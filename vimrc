set nocompatible
filetype off


"{{{ Vundle plugins
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" Bundles
Bundle 'gmarik/vundle'

" UI
Bundle 'gundo'
Bundle 'bling/vim-airline'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tpope/vim-repeat'
Bundle 'Valloric/MatchTagAlways'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'vasconcelloslf/vim-interestingwords'
Bundle 'kshenoy/vim-signature'
Bundle 'haya14busa/incsearch.vim'

" Misc
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-unimpaired'
" Bundle 'tpope/vim-vinegar'
Bundle 'jpalardy/vim-slime'

" Languages
Bundle 'fatih/vim-go'
Bundle 'pangloss/vim-javascript'

" Text editing
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'

" Completion
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'mattn/emmet-vim'
Bundle 'marijnh/tern_for_vim'

" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

" Color themes
Bundle 'molokai'
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'zenorocha/dracula-theme'
Bundle 'abra/vim-abra'
Bundle 'daddye/soda.vim'
Bundle 'john2x/flatui.vim'
Bundle 'nice/sweater'
Bundle 'junegunn/seoul256.vim'
Bundle 'whatyouhide/vim-gotham'
Bundle 'jordwalke/flatlandia'
Bundle 'gosukiwi/vim-atom-dark'

" Unite
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'tsukkee/unite-tag'

" DB
Bundle 'dbext.vim'

call vundle#end()
" Vundle plugins }}}


filetype plugin indent on
" colorscheme gotham
colorscheme atom-dark
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
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
" set lazyredraw
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
set listchars=tab:│\ ,eol:¬

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
    set guioptions-=T " Remove toolbar
    set guioptions+=e
    set guioptions-=r  " Remove right-hand scroll bar
    set guioptions-=L  " Remove left-hand scroll bar
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
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set si "Smart indent
set wrap "Wrap lines

set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
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
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>nf :NERDTreeFind<CR>


let g:syntastic_enable_signs=1

map <Leader>mbt :MBEToggle<cr>

" DelimitMate
let g:delimitMate_expand_cr = 1

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" UNITE
nmap <silent> <Leader>t :Unite buffer -auto-resize<CR>
nmap <silent> <Leader>p :Unite file_rec/async -start-insert<CR>
nmap <silent> <Leader>faf :Unite grep:.: -no-quit -direction="bottom"<CR>

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


au FileType python nmap <Leader>gd :YcmCompleter GoToDefinition<CR>


let g:signify_vcs_list = [ 'git', 'hg' ]


nmap <leader>w :w!<cr>

map <leader>cd :cd %:p:h<cr>:pwd<cr>

let g:airline_powerline_fonts=1
let g:airline_enable_branch = 1

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Move selected text around
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
