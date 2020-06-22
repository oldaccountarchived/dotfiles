if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Syntax
Plug 'sheerun/vim-polyglot'

" Linting
Plug 'w0rp/ale'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Python
Plug 'zchee/deoplete-jedi'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JavaScript and React JSX
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install; npm install -g tern' }
" Plug 'carlitux/deoplete-ternjs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'noahfrederick/vim-noctu'
Plug 'ayu-theme/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

" Appearance
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Utility
Plug 'tpope/vim-eunuch'

call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"

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
set colorcolumn=80

" Please don't wrap
set nowrap

" Show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Colorscheme
" set t_Co=256
" set background=light
" colorscheme ayu

" Colorscheme
" set t_Co=256
" set background=dark

set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
"colorscheme codedark
"colo gruvbox
"set background=dark

" Airline/Tmuxline
let g:airline_powerline_fonts = 0
let g:tmuxline_powerline_separators = 0
let g:airline#extensions#tmuxline#enabled = 1
" let g:airline_theme="dark"

" Better navigation of Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Ag<cr>

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Language settings
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

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
" au FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Global Prettier settings
let g:prettier#config#semi = "false"
let g:prettier#config#single_quote = "false"

" Gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Ale
let g:ale_sign_error = '💣'
let g:ale_sign_warning = '🚩'
let g:ale_statusline_format = ['💣 %d', '🚩 %d', '']

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
