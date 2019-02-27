" THE BASICS ----------------------------------------------------------------------------------------------------------

syntax on
filetype plugin indent on

" PLUGIN SETUP --------------------------------------------------------------------------------------------------------

call plug#begin("~/vimfiles/vim-plug")
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/yankwin.vim'
Plug 'luochen1990/rainbow'
call plug#end()

" you'll need to install a patched font for airline to get fancy separators
" https://github.com/powerline/fonts

" REMAPPINGS ----------------------------------------------------------------------------------------------------------

" doubletapping j, or chording j and k will escape insert mode
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" set leader to space; why is this not default?
let mapleader=" "

" commands
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <silent> <Leader>sg :source $MYGVIMRC<CR>
nnoremap <silent> <Leader>eg :vsp $MYGVIMRC<CR>
nnoremap <silent> <Leader><Leader> :noh<CR>

" easy window movement
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <Leader>L gt
nnoremap <Leader>H gT

" fugitive stuff
nnoremap <silent> <Leader>gs :Gstatus<CR>

" FORMATTING SETTINGS -------------------------------------------------------------------------------------------------

" don't use tab characters, and use indent level of four spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"
" set encoding (duh)
set encoding=utf-8

" SEARCH SETTINGS -----------------------------------------------------------------------------------------------------

set ignorecase
set smartcase
set incsearch
set hlsearch
" turn off highlighting if we've reloaded this file
noh

" VISUAL SETTINGS -----------------------------------------------------------------------------------------------------

" show ruler in status bar
set ruler

" a gentle reminder of a 120 column 'limit'
set colorcolumn=120

" context is important! ensure it's always on screen
set scrolloff=5

" who decided vsplits are on the left and top? default to right
set splitright
set splitbelow

" RANDOM OTHER STUFF --------------------------------------------------------------------------------------------------

" arbitrarily long history
set history=10000

" show current command in status line
set showcmd

" line numbering
set number

" automatically keeps current indentation level, unless
" a plugin requests otherwise.  cindent and smartindent can interfere
" with plugins.
set autoindent

" allow easy hidden buffers
set hidden

" ensure we know we're running on a fast tty
set ttyfast

" default to global subst's
set gdefault

" use markdown highlighting for .md filetypes
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" turn off error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" put swap files elsewhere
" trailing // indicates that the file path should be built from the full file name
set dir=$HOME\\vimfiles\\swap//

" PLUGIN-SPECIFIC CONFIGURATION ---------------------------------------------------------------------------------------

" required for airline
set laststatus=2
set ttimeoutlen=20

" enable the top tabline for airline
let g:airline#extensions#tabline#enabled = 1

" airline font for fancy arrows
" for some reason, this won't work if it's in gvimrc, but will work here. gate
" it with gui_running
if has("gui_running")
    let g:airline_powerline_fonts = 1
endif

" we don't need a mode displayed; we have powerline which does that for us
set noshowmode

" get rid of that ugly random separator at the end
let g:airline_skip_empty_sections = 1

" enable rainbow parens
let g:rainbow_active = 1
