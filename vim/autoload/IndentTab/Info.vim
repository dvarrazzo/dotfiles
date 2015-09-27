" IndentTab/Info.vim: IntentTab activation information for use in statusline
" etc.
"
" DEPENDENCIES:
"
" Copyright: (C) 2011-2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.002	26-Feb-2012	Renamed g:indenttab to g:IndentTab to match
"				plugin name. Also IndentTab#Info#IndentTab().
"	001	22-Sep-2011	file creation

function! IndentTab#Info#IndentTab()
    if exists('b:IndentTab')
	return b:IndentTab
    elseif exists('g:IndentTab')
	return g:IndentTab
    else
	return 0
    endif
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
