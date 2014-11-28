" IndentTab.vim: Use tabs for indent at the beginning, spaces for alignment in
" the rest of a line.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"   - IndentTab.vim autoload script.
"
" Copyright: (C) 2008-2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.003	06-Mar-2012	Renamed g:indenttab to g:IndentTab to match
"				plugin name.
"	002	26-Feb-2012	Renamed IndentTab#Switch() to IndentTab#Set().
"	001	20-Sep-2011	Enable supertab integrations through
"				g:IndentTab_IsSuperTab (which disables the
"				remapping of <Tab>).
"				file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_IndentTab') || (v:version < 700)
    finish
endif
let g:loaded_IndentTab = 1

if ! exists('g:IndentTab_scopes')
    let g:IndentTab_scopes = 'indent,commentprefix,string'
endif

if ! exists('g:IndentTab_IsSuperTab')
    let g:IndentTab_IsSuperTab = 0
endif

if ! exists('g:IndentTab')
    let g:IndentTab = 0
endif
if g:IndentTab
    " Enable on startup if desired.
    call IndentTab#Set(1, 1)
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
