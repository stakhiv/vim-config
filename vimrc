set nocompatible
filetype off

"{{{ Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundles
Bundle 'VundleVim/Vundle.vim'

" UI
Bundle 'simnalamburt/vim-mundo'
Bundle 'Valloric/MatchTagAlways'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'vasconcelloslf/vim-interestingwords'
Bundle 'kshenoy/vim-signature'
Bundle 'haya14busa/incsearch.vim'
Bundle 'mhinz/vim-startify'

" Misc
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/tpope-vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'

" Languages
Bundle 'fatih/vim-go'
Bundle 'pangloss/vim-javascript'

" Text editing
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'

" Completion
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'neoclide/coc.nvim'
Bundle 'w0rp/ale'

" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" Color themes
Bundle 'joshdick/onedark.vim'
Bundle 'ayu-theme/ayu-vim'
Bundle 'dracula/vim'

" Search
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" Experiments
" Bundle 'vimwiki/vimwiki'

call vundle#end()
" Vundle plugins }}}


" set termguicolors
filetype plugin indent on
set background=dark
set t_Co=256
colorscheme dracula
syntax on
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
" set ruler
set backspace=indent,eol,start
set laststatus=2
set number
" set relativenumber
set lazyredraw
" set undofile
" hi vertsplit guifg=black guibg=bg

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

" Set focus on new :vs window
set splitright

set list
set listchars=tab:│\ ,eol:¬

nmap <leader>w :w!<cr>

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

" No one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" Better buffer search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Move selected text around
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

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
    " set guifont=Menlo\ for\ Powerline
    " set guifont=Hack
    set macligatures
    set guifont=Fira\ Code:h12
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" Indentation
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
set backspace=2


" Buffer search for cursor words
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" Window navigation without <C-w>
nnoremap <leader>w <C-w>v<C-w>lremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" The Silver Searcher as grep
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Use ag as Ack command
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
endif

" Search for text in all files
nmap <silent> <Leader>faf :Ack!<space>
vmap <silent> <Leader>faf y:Ack!<space>'<C-r>"'

" NERDTree config
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


" vim-go
let g:go_fmt_command = "goimports"
let g:go_code_completion_enabled = 0

" Use coc.vim to display doc hint, as godoc is so sloooow
let g:go_doc_keywordprg_enabled = 0

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" DelimitMate
let g:delimitMate_expand_cr = 1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"

" Display file changes for Git and Mercurial only
let g:signify_vcs_list = [ 'git', 'hg' ]

" Autocommands for indentation per file type
:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

:autocmd Filetype sh set softtabstop=2
:autocmd Filetype sh set sw=2
:autocmd Filetype sh set ts=2

:autocmd Filetype php set softtabstop=4
:autocmd Filetype php set sw=4
:autocmd Filetype php set ts=4

:autocmd Filetype javascript set softtabstop=2
:autocmd Filetype javascript set sw=2
:autocmd Filetype javascript set ts=2


" CtrlP bindings
nmap <silent> <Leader>p :CtrlP<CR>
nmap <silent> <Leader>g :CtrlPTag<CR>
nmap <silent> <Leader>t :CtrlPBuffer<CR>

" Open current directory view
map <leader>ff :e %:p:h<cr>

" ALE config
nmap <silent> <Leader>e <Plug>(ale_previous_wrap)
nmap <silent> <Leader>E <Plug>(ale_next_wrap)

" Autocommands for coc.vim LSP commands
au FileType php nmap <silent> gd <Plug>(coc-definition)
au FileType php nmap <silent> gy <Plug>(coc-type-definition)
au FileType php nmap <silent> gi <Plug>(coc-implementation)
au FileType php nmap <silent> gr <Plug>(coc-references)

au FileType ruby nmap <silent> gd <Plug>(coc-definition)
au FileType ruby nmap <silent> gy <Plug>(coc-type-definition)
au FileType ruby nmap <silent> gi <Plug>(coc-implementation)
au FileType ruby nmap <silent> gr <Plug>(coc-references)

au FileType javascript nmap <silent> gd <Plug>(coc-definition)
au FileType javascript nmap <silent> gy <Plug>(coc-type-definition)
au FileType javascript nmap <silent> gi <Plug>(coc-implementation)
au FileType javascript nmap <silent> gr <Plug>(coc-references)

au FileType go nmap <silent> gr <Plug>(coc-references)


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Quick list of actions
nmap <silent> <Leader>l :CocList<CR>

" Custom statusline config
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
