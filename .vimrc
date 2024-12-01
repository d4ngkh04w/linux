call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'github/copilot.vim'

call plug#end()

set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:airline_theme='base16_dracula'
let g:NERDTreeFileLines = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

colorscheme tokyonight

set number
set cursorline
set showmode
set tabstop=4
set shiftwidth=4
" set autoindent
set encoding=UTF-8
set smartindent
set clipboard=unnamedplus
set mouse=a

syntax enable
syntax on
filetype plugin indent on

nnoremap <F2> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <Esc>:NERDTreeToggle<CR>

" Ctrl + S to save
noremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" Ctrl + Q to quit
noremap <C-q> :q<CR>

" Ctrl + W to close
nnoremap <C-w> :wq<CR>
inoremap <C-w> <C-o>:wq<CR>

" Ctrl + P to open fzf
nnoremap <C-p> :FZF<CR>

" Ctrl + A to select all
vnoremap <C-a> "+y
nnoremap <C-a> ggVG"+y

" Ctrl + C to copy
vnoremap <C-c> "+y
nnoremap <C-c> "+y
inoremap <C-c> <C-o>"+y

" Ctrl + V to paste
nnoremap <C-v> "+p
vnoremap <C-v> "+p
inoremap <C-v> <C-o>"+p

" Ctrl + T to open terminal
nnoremap <C-t> :terminal<CR>

" F5 to refresh VIM
nnoremap <F5> :source $MYVIMRC<CR>
inoremap <F5> <C-o>:source $MYVIMRC<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

