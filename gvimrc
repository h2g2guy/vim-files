" only gvim specific stuff should go here

" use patched font for windows (won't work if font isn't installed)
set guifont=Cascadia_Code_PL:h10:cANSI

" who needs toolbars? turn off all the gui elements we don't need
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" use command line style dialogs
set guioptions+=c

" turn off error bells (again, apparently this is important to do again after gui initialization)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" maximize on startup
autocmd GUIEnter * simalt ~x

" use local settings if present
if filereadable(expand('~/local.gvimrc'))
    source ~/local.gvimrc
endif

" PLUGIN-SPECIFIC CONFIGURATION ---------------------------------------------------------------------------------------

" set colorscheme to solarized
let g:solarized_italic=0    "default value is 1
let g:solarized_hitrail=1    "default value is 0
let g:solarized_contrast="high"
set background=dark
colorscheme solarized

" CUSTOM COLORS -------------------------------------------------------------------------------------------------------

" gently highlight the current line
set cursorline
set cursorlineopt=both
hi CursorLineNr guifg=#93a1a1 guibg=#002b36
