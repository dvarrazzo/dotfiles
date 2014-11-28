" IndentTab.vim: Use tabs for indent at the beginning, spaces for alignment in
" the rest of a line.
"
" DEPENDENCIES:
"   - IndentTab/CommentPrefix.vim autoload script.
"   - IndentTab/Syntax.vim autoload script.
"
" Copyright: (C) 2008-2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.007	07-Mar-2012	BUG: Undefined variable l:softtabstop.
"	006	26-Feb-2012	Renamed g:indenttab to g:IndentTab to match
"				plugin name.
"				Renamed IndentTab#Switch() to IndentTab#Set().
"				Add IndentTab#Reset() and IndentTab#Toggle().
"	005	22-Sep-2011	Implement "comment" and "string" syntax scopes.
"	004     21-Sep-2011     Factor out s:IsInScope() to check for indent
"				before cursor (and then the other scopes from
"				g:IndentTab_scopes).
"				Implement "commentprefix" scope.
"	003	20-Sep-2011	Add flag g:indenttab / b:indenttab for
"				statusline and "supertab" integrations.
"				Expose mapping result functions for "supertab"
"				integrations through IndentTab#GetExpr().
"       002     12-Jun-2009     Implemented switching from indenting to
"				alignment when a single <Space> has been
"				entered.
"	001	20-Aug-2008	file creation

function! s:IsInScope( textBeforeCursor )
    let l:isInScope = 0
    let l:scopes = split(g:IndentTab_scopes, ',')

    if index(l:scopes, 'indent') != -1
	" For 'softtabstop', "whitespace" means <Tab> and <Space> (which must be
	" included because part of the indent can consist of spaces), but only
	" <Tab> when 'softtabstop' is off. This way, one can switch from
	" indenting to alignment (e.g. when continuing a multi-line statement)
	" for 'tabstop' by inserting a single <Space>, and can then finish the
	" alignment conveniently by pressing <Tab>.
	let l:isInScope = l:isInScope || (a:textBeforeCursor =~# (&l:softtabstop ? '^\s*$' : '^\t*$'))
    endif
    if index(l:scopes, 'commentprefix') != -1
	let l:isInScope = l:isInScope || IndentTab#CommentPrefix#IsIndentAfterCommentPrefix(a:textBeforeCursor)
    endif
    if index(l:scopes, 'comment') != -1
	let l:isInScope = l:isInScope || IndentTab#Syntax#IsInSyntax('^Comment$')
    endif
    if index(l:scopes, 'string') != -1
	let l:isInScope = l:isInScope || IndentTab#Syntax#IsInSyntax('^\%(String\|Constant\)$')
    endif

    return l:isInScope
endfunction

function! IndentTab#Tab()
    let l:textBeforeCursor = strpart(getline('.'), 0, col('.') - 1)
    if &l:expandtab || s:IsInScope(l:textBeforeCursor)
	" If 'expandtab' is on, Vim will do the translation to spaces for us.
	" In the whitespace-only indent section of the line return the ordinary
	" <Tab>. Settings like 'softtabstop' are then handled by Vim as if there
	" were not mapping for <Tab>.
	return "\<Tab>"
    endif

    " For the space-only text section of the line, determine and return the
    " correct amount of spaces.
    let l:indent = (&l:softtabstop == 0 ? &l:tabstop : &l:softtabstop)

    " Note: The simple virtcol('.') is wrong when the character under the cursor
    " is a <Tab>, ! isprint character (e.g. ^V) or double-width character (e.g.
    " a Japanese Kanji), because virtcol() returns the _last_ virtual column
    " occupied.
    " What is needed here is the _first_ virtual column of the cursor. Since we
    " cannot move the cursor to the left within this function, we use the
    " virtcol([line, col]) function and determine the (last) virtual column of
    " the character before the cursor to which we only have to add 1 to get to
    " the first column of the cursor. To determine the (start) column of the
    " character before the cursor, we subtract the length of the character
    " before the cursor from the overall length up to the cursor.
    " (Alternatively, this could also be done via a match with the \%<c regexp
    " item.)
    "let l:colBeforeCursor = strlen(matchstr(l:textBeforeCursor, '^.*\%<' . col('.') . 'c')) + 1
    let l:colBeforeCursor = strlen(l:textBeforeCursor) - strlen(matchstr(l:textBeforeCursor, '.$')) + 1
    let l:virtCol = virtcol([line('.'), l:colBeforeCursor]) + 1

    let l:off = l:virtCol % l:indent
    let l:off = (l:off ? l:off : l:indent)
"****D echomsg '****' l:virtCol . ' '. virtcol('.')  . ' ' . l:off . ' ' . (l:indent - l:off + 1)
    return repeat(' ', l:indent - l:off + 1)
endfunction
function! IndentTab#Backspace()
    let l:textBeforeCursor = strpart(getline('.'), 0, col('.') - 1)

    " Return the ordinary <BS> if we're not deleting a <Space> or if we're in
    " the whitespace-only indent section of the line.
    let l:charBeforeCursor = matchstr(l:textBeforeCursor, '.$')
    if l:charBeforeCursor !=# ' ' || s:IsInScope(l:textBeforeCursor)
	return "\<BS>"
    endif

    " In the space-only text section of the line, let Vim do the deletion of the
    " correct amount of spaces by temporarily turning on 'expandtab' and
    " 'softtabstop', if not already enabled. This relieves us from calculating
    " the correct amount of <BS> keys (which also depend on the 'softtabstop'
    " setting).
    if &l:expandtab && &l:softtabstop
	return "\<BS>"
    else
	let l:tempOn  = "\<C-\>\<C-o>:set" . (&l:expandtab ? '' : ' et')   . (&l:softtabstop ? '' : ' sts=' . &l:tabstop) . "\<CR>"
	let l:tempOff = "\<C-\>\<C-o>:set" . (&l:expandtab ? '' : ' noet') . (&l:softtabstop ? '' : ' sts=0')             . "\<CR>"
	return l:tempOn . "\<BS>" . l:tempOff
    endif
endfunction

" The indent tab can be en-/disabled globally or only for a particular buffer.
function! IndentTab#Set( isTurnOn, isGlobal )
    if a:isTurnOn
	let l:mappingScope = (a:isGlobal ? '' : '<buffer>')
	if ! g:IndentTab_IsSuperTab
	    execute 'inoremap' l:mappingScope '<expr> <Tab> IndentTab#Tab()'
	endif
	    execute 'inoremap' l:mappingScope '<expr> <BS>  IndentTab#Backspace()'
    elseif a:isGlobal
	if ! g:IndentTab_IsSuperTab
	    silent! iunmap <Tab>
	endif
	    silent! iunmap <BS>
    else
	" To turn off the buffer-local setting (when the global settting is
	" active, but it could be activated later on), a buffer-local mapping
	" needs to neutralize the global mapping. To do away with the
	" buffer-local setting, use IndentTab#Reset().
	if ! g:IndentTab_IsSuperTab
	    silent! inoremap <buffer> <Tab> <Tab>
	endif
	    silent! inoremap <buffer> <BS> <BS>
    endif

    execute 'let' (a:isGlobal ? 'g' : 'b') . ':IndentTab =' (!! a:isTurnOn)
endfunction
function! IndentTab#Reset()
    if ! g:IndentTab_IsSuperTab
	silent! iunmap <buffer> <Tab>
    endif
	silent! iunmap <buffer> <BS>
    unlet! b:IndentTab
endfunction
function! IndentTab#Toggle( isGlobal )
    call IndentTab#Set(! (a:isGlobal ? g:IndentTab : IndentTab#Info#IndentTab()), a:isGlobal)
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
