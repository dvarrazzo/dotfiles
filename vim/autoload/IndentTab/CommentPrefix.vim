" IndentTab/CommentPrefix.vim: IndentTab detection of comment prefix scope.
"
" DEPENDENCIES:
"   - ingocomments.vim autoload script.
"
" Copyright: (C) 2011 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.002	22-Sep-2011	Use ingocomments#GetCommentPrefixType() for
"				handling of three-part comments.
"	001	21-Sep-2011	file creation

function! IndentTab#CommentPrefix#IsIndentAfterCommentPrefix( textBeforeCursor )
    let l:prefix = get(matchlist(a:textBeforeCursor, '^\(\s*\S\+\)' . (&l:softtabstop ? '\s*$' : '\t*$')), 1, '')
    if empty(l:prefix)
	return 0
    endif

    let l:commentPrefixType = ingocomments#GetCommentPrefixType(l:prefix)
    if empty(l:commentPrefixType)
	" This is not a comment prefix.
	return 0
    elseif l:commentPrefixType[0] ==# 'e'
	" The comment ends after the end part of a three-piece comment.
	return 0
    else
	return 1
    endif
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
