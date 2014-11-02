set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
" call vundle#rc()
call vundle#begin()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'gcmt/breeze.vim'
Bundle 'Valloric/MatchTagAlways'

Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-unimpaired'
" Bundle 'tpope/vim-vinegar'
Bundle 'scrooloose/nerdtree'
Bundle "chrisbra/NrrwRgn"
Bundle 'fatih/vim-go'
Bundle 'tpope/vim-fugitive'

Bundle 'pangloss/vim-javascript'
Bundle 'majutsushi/tagbar'
Bundle 'vcscommand.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'marijnh/tern_for_vim'
Bundle 'mattn/emmet-vim'

" Color themes
Bundle 'molokai'
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'zenorocha/dracula-theme'
Bundle 'abra/vim-abra'
Bundle 'daddye/soda.vim'
Bundle 'john2x/flatui.vim'
Bundle 'nice/sweater'

" Not sure if needed
Bundle 'godlygeek/tabular'

Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-tag'

Bundle 'dbext.vim'
Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-signify'


" NEW
Bundle 'gundo'
Bundle 'mhinz/vim-startify'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'int3/vim-extradite'
Bundle 'vasconcelloslf/vim-interestingwords'
Bundle 'kshenoy/vim-signature'
Bundle 'haya14busa/incsearch.vim'


call vundle#end()
filetype plugin indent on
colorscheme badwolf
syntax on
set background=dark
set mouse=a
set modelines=0

set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set noerrorbells
set novisualbell
" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set lazyredraw
set relativenumber
" set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>


set list
set listchars=tab:#\ ,eol:¬

" Disabling arrow keys. Use hjkl, Luke!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" Map jk to <Esc>
imap jk <Esc>


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set si "Smart indent
set wrap "Wrap lines

set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set foldenable

set backspace=2

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" Windows
nnoremap <leader>w <C-w>v<C-w>lremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" NERDTree
" nmap <silent> <Leader>n :vs.<CR>
" let g:netrw_liststyle = 3
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.pyc$']

let g:syntastic_enable_signs=1

" map ; A;<Esc>
imap jk <Esc>

" MiniBufExplorer
" let g:miniBufExplUseSingleClick = 1
" let g:miniBufExplMapCTabSwitchBufs = 1

map <Leader>mbt :MBEToggle<cr>

" DelimitMate
let g:delimitMate_expand_cr = 1

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" DBEXT
let g:dbext_default_profile_nav_dev = 'type=PGSQL:user=navigator:passwd=12321q:dbname=dev:host=192.168.135.19:port=5433'

" UNITE
nmap <silent> <Leader>t :Unite buffer -auto-resize<CR>
nmap <silent> <Leader>p :Unite file_rec/async -start-insert<CR>
nmap <silent> <Leader>faf :Unite grep:.: -no-quit -direction="bottom"<CR>
" nmap <silent> <Leader>n :Unite file -vertical<CR>
" nmap <silent> <Leader>nn :Unite file -input=**/ -start-insert<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif


" Tagbar
nmap <F8> :TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"
" let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsJumpForwardTrigger = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-k>"


au FileType python nmap <Leader>gd :YcmCompleter GoToDefinition<CR>


let g:signify_vcs_list = [ 'git', 'hg' ]


nmap <leader>w :w!<cr>

map <leader>cd :cd %:p:h<cr>:pwd<cr>

let g:airline_powerline_fonts=1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
