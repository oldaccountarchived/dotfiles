call plug#begin()

" Syntax
Plug 'sheerun/vim-polyglot'

" Linting
Plug 'w0rp/ale'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python
Plug 'zchee/deoplete-jedi'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JavaScript and React JSX
Plug 'ternjs/tern_for_vim', { 'do': 'npm install; npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'noahfrederick/vim-noctu'

" Appearance
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Basic stuff.
set encoding=utf-8
syntax on
set number
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
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Colorscheme
set t_Co=256
set background=dark
colorscheme solarized

" Airline
let g:airline_powerline_fonts = 0
let g:tmuxline_powerline_separators = 0

" Better navigation of Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF
nnoremap <c-p> :FZF<cr>

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Language settings
let g:jsx_ext_required = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#data_directory = $HOME.'.vim/cache/deoplete'
let g:deoplete#force_omni_input_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
au FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete

" Gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
