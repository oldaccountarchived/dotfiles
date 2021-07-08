if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Syntax
Plug 'sheerun/vim-polyglot'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-fubitive'

" JavaScript and React JSX
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Colors
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'tomasiser/vim-code-dark'

" Appearance
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'

" Utility
Plug 'tpope/vim-eunuch'

call plug#end()

" Map the leader key to SPACE
nnoremap <Space> <Nop>
let mapleader = "\<Space>"


" Basic stuff.
set encoding=utf-8
syntax on
set number
set relativenumber
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
" set colorcolumn=80

" Please don't wrap
set nowrap

" show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" More room for coc.nvim
set cmdheight=2

" Show tabline
" set showtabline=2

if (has("termguicolors"))
  set termguicolors
endif

" nord config
let g:nord_italic = 1
let g:nord_italic_comments = 1
set background=dark

" Set nord colorscheme
colorscheme nord

" Airline/Tmuxline
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Better navigation of Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Ag<cr>

" JSX Pretty config
let g:vim_jsx_pretty_disable_tsx = 0
let g:vim_jsx_pretty_colorful_config = 0

" Language settings
let g:jsx_ext_required = 0

" Global Prettier settings
let g:prettier#config#semi = "true"
let g:prettier#config#single_quote = "true"

" Syntax highlighting for JSX/TSX
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" COC
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
