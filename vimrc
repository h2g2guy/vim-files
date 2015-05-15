execute pathogen#infect()

" additional action needed:  install solarized into gnome-terminal
" https://github.com/Anthony25/gnome-terminal-colors-solarized
"
" additionally, you'll need to install a patched font for airline
" https://github.com/powerline/fonts

" syntax settings
syntax on
filetype plugin indent on

" leader
let mapleader=","

" leader commands
nnoremap <Leader>e :Eval<CR>

" search settings
set smartcase
set incsearch
set hlsearch
map <Space> :noh<CR>

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

" show ruler in status bar
set ruler

" switch tabs with left and right arrow keys
nnoremap <silent> <Right> gt
nnoremap <silent> <Left> gT

" a gentle reminder of the 80 column 'limit'
set colorcolumn=80

" allow easy hidden buffers
set hidden

" set encoding (duh)
set encoding=utf-8

" ensure we know we're running on a fast tty
set ttyfast

" very magic regexes
nnoremap / /\v
vnoremap / /\v

" default to global subst's
set gdefault

" doubletapping j, or chording j and k will escape insert mode
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

set scrolloff=5

" use patched font for windows (won't work if font isn't installed)
set guifont=DejaVu_Sans_Mono_for_Powerline:h9:cANSI

" use markdown highlighting for .md filetypes
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" ------------------- start plugin stuff

" required for airline
set laststatus=2
set ttimeoutlen=20

" set colorscheme to solarized, ensuring 256 colors
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" airline font for fancy arrows
let g:airline_powerline_fonts = 1

" enable the top tabline for airline
let g:airline#extensions#tabline#enabled = 1

" gundo mapping
nnoremap <F5> :GundoToggle<CR>

" nerdtree mapping
nnoremap <F6> :NERDTreeToggle<CR>
