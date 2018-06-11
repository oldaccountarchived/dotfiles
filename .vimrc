set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" END - Setting up Vundle - the vim plugin bundler

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Markdown support
Plugin 'plasticboy/vim-markdown'

" JavaScript and React JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" IDE like additions
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'

" Additional
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'edkolev/tmuxline.vim'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()
filetype plugin indent on

" Basic stuff.
set encoding=utf-8
syntax on
set number
set paste
set ruler
set laststatus=2
set backspace=2
set linespace=0

" Access system clipboard
set clipboard=unnamed

" 2 spaces instead of tabs
set tabstop=2
set expandtab
set shiftwidth=2

" Set column for character limit
set colorcolumn=80

" Please don't wrap
set nowrap

" Show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Colorscheme
set t_Co=256
set background=light
colorscheme solarized

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Better navigation of Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sometimes, I use the mouse. come at me, bro.
set mouse=a

let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" CTRLP Ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
