call plug#begin("~/vimfiles/vim-plug")
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

" you'll need to install a patched font for airline
" https://github.com/powerline/fonts

" syntax settings
syntax on
filetype plugin indent on

" leader
let mapleader=" "

" leader commands
nnoremap <Leader>e :Eval<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" search settings
set smartcase
set incsearch
set hlsearch
map <Space> :noh<CR>
" turn off highlighting if we've reloaded this file
noh

" arbitrarily long history
set history=10000

" show current command in status line
set showcmd

" join ends of sentences with two spaces
set joinspaces

" line numbering
set number

" automatically keeps current indentation level, unless
" a plugin requests otherwise.  cindent and smartindent can interfere
" with plugins.
set autoindent

" don't use tab characters, and use indent level of four spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" turn off error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" maximize on startup
autocmd GUIEnter * simalt ~x

" show ruler in status bar
set ruler

" switch tabs with left and right arrow keys
nnoremap <silent> <Right> gt
nnoremap <silent> <Left> gT

" a gentle reminder of a 120 column 'limit'
set colorcolumn=120

" allow easy hidden buffers
set hidden

" set encoding (duh)
set encoding=utf-8

" ensure we know we're running on a fast tty
set ttyfast

" default to global subst's
set gdefault

" doubletapping j, or chording j and k will escape insert mode
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

set scrolloff=5

" use patched font for windows (won't work if font isn't installed)
set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI

" who needs toolbars? turn off all the gui elements we don't need
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" use markdown highlighting for .md filetypes
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" ------------------- start plugin stuff

" required for airline
set laststatus=2
set ttimeoutlen=20

" set colorscheme to solarized, ensuring 256 colors
let g:solarized_italic=0    "default value is 1
let g:solarized_hitrail=1    "default value is 0
set background=dark
colorscheme solarized

" airline font for fancy arrows
let g:airline_powerline_fonts = 1

" enable the top tabline for airline
let g:airline#extensions#tabline#enabled = 1

" gundo mapping
nnoremap <F5> :GundoToggle<CR>

" nerdtree mapping
nnoremap <F6> :NERDTreeToggle<CR>
