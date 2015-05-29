set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-vinegar'

call vundle#end()
filetype plugin indent on

" Basic stuff.
set encoding=utf-8
syntax on
set number
set expandtab
set paste
set ruler
set laststatus=2
set tabstop=4
colorscheme solarized 
set t_Co=256
set linespace=0
let base16colorspace=256

" Airline
let g:airline_powerline_fonts = 1

" NERDTREE
" nmap <silent> <F3> :NERDTreeToggle<CR>

" Better navigation of Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Sometimes, I use the mouse. come at me, bro.
set mouse=a
