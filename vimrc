set shell=/bin/bash " avoid problem in fish

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
" Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/syntastic'
Plug 'farmergreg/vim-lastplace'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jreybert/vimagit'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" for python
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" " IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
"
" " NOTE: you need to install completion sources to get completions. Check
" " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'

call plug#end()


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on
syntax on

set nu

"set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamedplus " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode
set cursorline " highlight current line
set scrolloff=6
set novisualbell
set autoread " reload files when changed on disk
set wildmenu " GREAT autocomplete menu

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type
set hlsearch
set magic

" mimic emacs
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-d> <Del>
inoremap <c-h> <BS>
" cmdline-editing
cnoremap <c-g> <c-c>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-d> <Del>
"execute "set <M-b>=\eb"
"execute "set <M-f>=\ef"
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" disable cmdline history
map q: :

xnoremap p pgvy

" indent
set autoindent
set cindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" no template files
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undofile
set undodir=~/.undo
set history=10000

" encoding
if has("multi_byte")
  "set encoding=utf-8
  set termencoding=utf-8
  set fileencodings=utf-8,chinese,latin-1
endif


" set termguicolors
color dracula

" set background=dark
" color jellybeans
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" for osx
set go=aAce
if has("gui_running")
    set transparency=2
endif

set guifont=Source\ Code\ Pro:h16

" indent
"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
let g:pymode_python = 'python3'
autocmd FileType python,haskell,c,cpp setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,javascript,cmake setlocal et sta ts=2 sts=2 sw=2

let python_highlight_all=1

"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map<silent><leader>ss :source $MYVIMRC<cr>
map<silent><leader>ee :e $MYVIMRC<cr>
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
nnoremap gb :bn<cr>
nnoremap gB :bp<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
set laststatus=2 " /N
set noshowmode
set linespace&
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'dark'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
" goto:<leader>g  defn:<leader>d  doc:K  rename:<leader>r  related:<leader>n
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 0
let g:SuperTabDefaultCompletionType = "context"

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "gr"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim2hs
let g:haskell_conceal = 0
"let g:haskell_conceal_wide = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree
map <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'c': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
    \ 'cc': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['/usr/local/bin/ccls', '--log-file=/tmp/cc.log'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nn <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately

nn <silent> gd :call LanguageClient#textDocument_definition()<cr>
nn <silent> gr :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
nn <silent> K :call LanguageClient#textDocument_hover()<cr>
nn <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/Users/weiyizhang/.config/nvim/settings.json'

augroup LanguageClient_config
  au!
  au BufEnter * let b:Plugin_LanguageClient_started = 0
  au User LanguageClientStarted setl signcolumn=yes
  au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
  au User LanguageClientStopped setl signcolumn=auto
  au User LanguageClientStopped let b:Plugin_LanguageClient_started = 0
  au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
augroup END

" https://github.com/autozimu/LanguageClient-neovim/issues/379 LSP snippet is not supported
let g:LanguageClient_hasSnippetSupport = 0
"
set completefunc=LanguageClient#complete
fu! C_init()
  setl formatexpr=LanguageClient#textDocument_rangeFormatting()
endf
au FileType c,cpp,cuda,objc :call C_init()

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" deoplete "
let g:deoplete#enable_at_startup = 1
