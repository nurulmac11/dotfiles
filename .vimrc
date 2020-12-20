set nocompatible              " be iMproved, required
filetype off                  " required
set nu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CycleColor'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf'
Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ervandew/supertab'
Plugin 'enricobacis/vim-airline-clock'
" All of your Plugins must be added before the following line
call vundle#end()            " required

autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:powerline_pycmd="py3"
let g:airline_powerline_fonts = 1

filetype plugin indent on    " required

syntax on
syntax enable
set background=dark
set relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader=","
nnoremap <leader>py :r !python %<CR>
colorscheme gruvbox

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set encoding=utf8

hi Normal guibg=NONE ctermbg=NONE

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
" map <C-n> <Esc>:tabnew
map <C-x> <Esc>:tabclose<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set cursorline                                                                                                                                                           
set cursorcolumn
set ignorecase
set smartcase
