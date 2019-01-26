" only gvim specific stuff should go here

" use patched font for windows (won't work if font isn't installed)
set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI

" who needs toolbars? turn off all the gui elements we don't need
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" turn off error bells (again, apparently this is important to do again after gui initialization
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" maximize on startup
autocmd GUIEnter * simalt ~x

" PLUGIN-SPECIFIC CONFIGURATION ---------------------------------------------------------------------------------------

" set colorscheme to solarized
let g:solarized_italic=0    "default value is 1
let g:solarized_hitrail=1    "default value is 0
set background=dark
colorscheme solarized