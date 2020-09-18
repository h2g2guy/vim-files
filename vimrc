" THE BASICS ----------------------------------------------------------------------------------------------------------

syntax on
filetype plugin indent on

" PLUGIN SETUP --------------------------------------------------------------------------------------------------------

" decide plugin location based on platform
if has("win64") || has("win32")
    call plug#begin("~/vimfiles/vim-plug")
else
    call plug#begin("~/.vim/vim-plug")
endif

Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/yankwin.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'svermeulen/vim-yoink'
Plug 'justinmk/vim-sneak'

call plug#end()

" you'll need to install a patched font for airline to get fancy separators
" https://github.com/powerline/fonts

" REMAPPINGS ----------------------------------------------------------------------------------------------------------

" sometimes I need a sec to finish a key combo...
set timeoutlen=1750

" doubletapping j, or chording j and k will escape insert mode
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" set leader to space; why is this not default?
let mapleader=" "

" easily edit vimrc files
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <silent> <Leader>sg :source $MYGVIMRC<CR>
nnoremap <silent> <Leader>eg :vsp $MYGVIMRC<CR>

" doubletap leader to remove highlighting
nnoremap <silent> <Leader><Leader> :noh<CR>

" easy window movement
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l

" I don't use tabs much anymore, but if I want them, I want an easy way to
" switch between them
nnoremap <Left> gt
nnoremap <Right> gT
" copy current buffer to a new tab; requires tapping twice to avoid hitting accidentally
nnoremap <silent> <Up> <Up> :tab split<CR>
" close tab page; requires tapping twice to avoid hitting accidentally
nnoremap <silent> <Down><Down> :tabclose<CR>

" hmmm... gt and gT has been freed up. that sounds like a better name for 'goto tag',
" right? lets also make 'go back' while we're here, since I don't use
" bookmarks.
nnoremap gt <C-]>
nnoremap gT <C-W>]
nnoremap gb <C-T>
" while we're doing tag stuff, recompile ctags with F12
nnoremap <silent> <F12> :!ctags -R .<CR><CR>

" fugitive stuff
nnoremap <silent> <Leader>gs :Gstatus<CR>

" swap 0 and ^, because frankly 'beginning of line after whitespace' is way
" more useful
noremap 0 ^
noremap ^ 0

" easily comment and uncomment C-like code
noremap <silent> <Leader>c :norm I// <Esc>
noremap <silent> <Leader>u :norm f/dw<Return>
" this could really be improved; it will break on blank lines, for example

" change visual mode put behavior to restore default register after paste
xnoremap <silent> p p:let @"=@0<CR>

" map =p and =P to realign columns after using put
nnoremap =p ]p
nnoremap =P [p

if filereadable(expand('~/local.vimrc'))
    source ~/local.vimrc
endif

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
if has("win64") || has("win32")
    set dir=$HOME\\vimfiles\\swap//
else
    set dir=$HOME/.vim/swap//
endif

" background should be set as dark for terminal use
if !has("gui_running")
    set background=dark
endif

" search in parent directory for tags
set tags=./tags,tags,./../tags,../tags

" open quickfix on :make
augroup vimrc
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost l* nested lwindow
augroup END

" quickfix mappings
nnoremap <silent> <Leader>qo :cwindow<CR>
nnoremap <silent> <Leader>qn :cnext<CR>
nnoremap <silent> <Leader>qN :cprev<CR>
nnoremap <silent> <Leader>qq :cclose<CR>

" weird windows terminal fixes
set t_u7=

" PLUGIN-SPECIFIC CONFIGURATION ---------------------------------------------------------------------------------------

" required for airline
set laststatus=2
set ttimeoutlen=10

" enable the top tabline for airline
let g:airline#extensions#tabline#enabled = 1

" number the tabline's buffers
let g:airline#extensions#tabline#buffer_nr_show = 1

" airline font for fancy arrows
let g:airline_powerline_fonts = 1

" we don't need a mode displayed; we have powerline which does that for us
set noshowmode

" get rid of that ugly random separator at the end
let g:airline_skip_empty_sections = 1

" enable rainbow parens
let g:rainbow_active = 1

" yoink/put options
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap <C-n> <plug>(YoinkPostPasteSwapBack)
nmap <C-p> <plug>(YoinkPostPasteSwapForward)
" yoink defaults to 10 items; why not more?
let g:yoinkMaxItems = 20
" by default yoink doesn't include delete operations in the history; include
" those
let g:yoinkIncludeDeleteOperations = 1

" let sneak repeat on s or S
let g:sneak#s_next = 1
