" General {{{
set nocompatible        " Disable vi compatibility
set hidden              " Open a new file using :e,
                        " without being forced to write or undo your changes first
set encoding=utf-8
set history=256         " Number of things to remember in history
set timeoutlen=250      " Time to wait after ESC (default causes an annoying delay)
set clipboard=unnamed   " Yanks go on clipboard instead
set lazyredraw          " Don't redraw while executing macros (good performance config)
" Match & search
set hlsearch            " Highlight search
set ignorecase          " Do case in sensitive matching with
set smartcase           " be sensitive when there's a capital letter
set incsearch           " Do incremental searching
" Backup & undo
set nowritebackup
set nobackup
set directory=/tmp//    " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

set undofile
set undodir=~/.vim/undo

:let mapleader = ","
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
Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 5
let g:neocomplcache_enable_auto_select = 1
if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><Leader><ESC>  pumvisible() ? neocomplcache#cancel_popup() : "\<ESC>"
Bundle 'Shougo/neosnippet.git'
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? neocomplcache#close_popup() : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
Bundle 'mattn/zencoding-vim'
Bundle 'groenewege/vim-less'
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/bufexplorer.zip'
noremap <silent> <CR> :BufExplorer<CR>
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/grep.vim'
Bundle 'digitaltoad/vim-jade'

" }}}

" Formatting {{{
set fo-=o         " Do not insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r         " Do not automatically insert a comment leader after an enter
set fo-=t         " Do not auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0   " Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start

set tabstop=2     " Set the default tabstop
set softtabstop=2
set shiftwidth=2  " Set the default shift width for indents
set smarttab      " Smarter tab levels
set expandtab

" indent setting
set si
set formatoptions+=mM
set smartindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on
set foldmethod=manual
filetype plugin indent on " Automatically detect file types
" }}}

" Visual {{{
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands
set cursorcolumn  " Highlight the current column

" Have a different background in GUI and terminal modes.
if has('gui_running')
    set background=light
else
    set background=dark
endif

:silent! colorscheme solarized

" Highlight trailing whitespace
:highlight TrailWhitespace ctermbg=red guibg=red
:match TrailWhitespace /\s\+$\| \+\ze\t/

set nowrap
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
noremap = +
nnoremap ; :
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
" use left & right key to switch between buffers
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>
" map up & down to gk & gj for convenient in wrap model
noremap <Up> gk
noremap <Down> gj
" write with sudo
cnoremap w!! w !sudo tee % >/dev/null
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" reselect visual block after indent/outdent
vnoremap , <gv
vnoremap . >gv
" make Y behave like other capitals
noremap Y y$

" Quickly insert parenthesis/brackets/etc.
inoremap (( ()<esc>i
inoremap [[ []<esc>i
inoremap "" ""<esc>i
inoremap '' ''<esc>i
inoremap {{ {<esc>o}<esc>O

" map ctrl + s to save file. need add 'stty -ixon' in the .bashrc or .zshrc
" if you use vim in the terminal.
inoremap <C-s> <ESC>:w<CR>a
nnoremap <C-s> :w<CR>

nnoremap <BS> X
nnoremap \ :!open <C-R>%<CR><CR>
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
