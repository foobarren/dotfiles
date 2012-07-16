" General {{{
set nocompatible			" Disable vi compatibility
set encoding=utf-8
set history=256				" Number of things to remember in history
set timeoutlen=250			" Time to wait after ESC (default causes an annoying delay)
set clipboard=unnamed		" Yanks go on clipboard instead
" Match & search
set hlsearch				" Highlight search
set ignorecase				" Do case in sensitive matching with
set smartcase				" be sensitive when there's a capital letter
set incsearch				" Do incremental searching
" Backup & undo
set nowritebackup
set nobackup
set directory=/tmp//		" prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

set undofile
set undodir=~/.vim/undo
" }}}

" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = ','
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
map <S-m> <plug>NERDTreeTabsToggle<CR>
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'
" }}}

" Formatting {{{
set fo-=o					" Do not insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r					" Do not automatically insert a comment leader after an enter
set fo-=t					" Do not auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0				" Don't wrap lines by default
set wildmode=longest,list	" At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start

set tabstop=4				" Set the default tabstop
set softtabstop=4
set shiftwidth=4			" Set the default shift width for indents
set smarttab				" Smarter tab levels

" indent setting
set ai
set si
set formatoptions+=mM
set autoindent
set smartindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on
filetype plugin indent on	" Automatically detect file types
" }}}

" Visual {{{
set ruler					" Show the cursor position all the time
set showcmd					" Display incomplete commands

set background=dark
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized

" Highlight trailing whitespace
:highlight TrailWhitespace ctermbg=red guibg=red
:match TrailWhitespace /\s\+$\| \+\ze\t/

set wrap
set whichwrap=b,s,<,>,[,],h,l

" list setting
set list
set listchars=tab:▸-,trail:⋅,extends:❯,precedes:❮
" relative number
set relativenumber
" make relative number set for all buffer
au BufReadPost * set relativenumber
" }}}

" Key mappings {{{
noremap H ^
noremap L $
nnoremap <CR> o
" Smart escape
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>
" emacs style key binding for insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <M-b> <C-o>b
inoremap <M-f> <C-o>w
inoremap <C-w> <Esc><Right>cb
inoremap <C-u> <Esc><Right>c0
inoremap <C-k> <Esc><Right>C
" write with sudo
cnoremap w!! w !sudo tee % >/dev/null
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" make Y behave like other capitals
map Y y$

" }}}

" Omnifunc {{{
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" }}}
