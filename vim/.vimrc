filetype on

filetype plugin on
filetype indent on
syntax on
set background=dark
set encoding=utf-8
set cmdheight=2
set updatetime=300
set clipboard=unnamed

set nocompatible
set wildmenu
set nobackup
set nowritebackup
set noswapfile
set noundofile
set lazyredraw

set autochdir " change to file's directory when switching files

set showmode
set showcmd
set mouse=a

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab

set number
set relativenumber
set ruler

set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" enable auto completion menu after pressing TAB
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.pdf,*.img,*.flv,*.xlsx

set spell spelllang=en_us

" PLUGINS -------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'
Plug 'cdelledonne/vim-cmake'
Plug 'junegunn/fzf' , { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme gruvbox
" }}}

" MAPPINGS ------------------------------------------------------- {{{

let g:floaterm_position = 'bottom'
let g:floaterm_width = 1.0
let g:floaterm_height = 0.4

let g:cmake_link_compile_commands = 1

nmap <c-t> :FloatermNew fff<cr>

let mapleader = '\'
" press \\ to jump back to the last cursor position
nnoremap <leader>\ ``
nnoremap <space> :

" Pressing o will open a new line, this will make exit insert mode
nnoremap o o<esc>
nnoremap O O<esc>

inoremap jj <esc>

" center the cursor vertically when moving to the next word during a search
nnoremap n nzz
nnoremap N Nzz

nnoremap Y y$

nnoremap <C-Tab> :bn<cr>
nnoremap <C-S-Tab> :bp<cr>

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"use tab for completion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>cc :CMakeClean<cr>

nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>u :UndotreeShow<cr>
nnoremap <leader>pv :wincdm v<bar> :Ex <bar> :vertical resize 30<cr>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<cr>
nnoremap <silent> <leader>- :vertical resize -5<cr>

nnoremap <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.iso$', '\.pdf$', '\.pyc$', '\.gif$', '\.db$']

if executable('rg')
	let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

" cpp bindings
map <F4> :e %:ps,.h$,.X123X,:s,.cpp$,.h,:s,.X123$,.cpp,<cr>
" }}}
