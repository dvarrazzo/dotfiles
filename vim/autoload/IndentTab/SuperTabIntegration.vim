" IndentTab/SuperTabIntegration.vim: IntentTab integration functions for
" SuperTab plugins that overload the <Tab> key.
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
"				plugin name.
"	001	22-Sep-2011	file creation

function! IndentTab#SuperTabIntegration#GetExpr()
    return (exists('g:IndentTab') && g:IndentTab || exists('b:IndentTab') && b:IndentTab ? IndentTab#Tab() : "\<Tab>")
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
