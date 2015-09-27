" IndentTab/Syntax.vim: IndentTab detection of syntax scopes.
"
" DEPENDENCIES:
"   - ingointegration.vim autoload script.
"
" Copyright: (C) 2011 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	22-Sep-2011	file creation

function! IndentTab#Syntax#IsInSyntax( syntaxItemPattern )
    " Note: During the insert expression evaluation, the cursor column is one
    " past the last entered character. At that position, the syntax query
    " doesn't work (at least when appending text to a line), so it must be
    " reduced by one.
    return ingointegration#IsOnSyntaxItem([0, line('.'), col('.') - 1, 0], a:syntaxItemPattern)
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
