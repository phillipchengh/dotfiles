set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("wind16") || has("win32") || has("win64")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Mine
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'zenorocha/dracula-theme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'JulesWang/css.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'matze/vim-move'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'wesQ3/vim-windowswap'
Plugin 'zhaocai/GoldenView.vim'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()	     " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set autochdir
set autoindent
set autoread
set binary
set complete-=i
set completeopt=menuone,preview
set cursorline
set equalalways
set expandtab
set foldmethod=indent
set foldnestmax=3
set hidden
set history=10000
set ignorecase
set incsearch
set hlsearch
set infercase
set laststatus=2
set lazyredraw
set nobackup
set nofoldenable
set noswapfile
set nowritebackup
set number
set numberwidth=4
set ruler
set scrolloff=3
set shiftwidth=2
set shortmess=atI
set showcmd
set showmatch
set showtabline=2
set sidescroll=1
set sidescrolloff=15
set smartcase
set softtabstop=2
set splitright
set synmaxcol=1000
set tabstop=2
set textwidth=0
set title
set ttyfast
set undodir='/tmp'
set undofile
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~
set wildignore=.git,,*.o,*.a,*.class 
set wildmenu
set wildmode=longest,list
set wrap linebreak textwidth=0

augroup vimrcEX
  " Remove previously defined autocmds
  au!

  " Auto create parent directory on save if doesn't exist
  au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif

  " Move to the last edited location
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
  au BufNewFile * set noeol

  " Automatically reload vimrc when it's saved
  au BufWritePost .vimrc source ~/.vimrc|set fdm=marker|AirlineRefresh
  au FileType vim set fdm=marker
  au SourceCmd .vimrc set fdm=marker|AirlineRefresh
augroup END

noremap <space> :NERDTreeTabsToggle<CR>
let g:NERDTreeChDirMode=2
let g:move_key_modifier = 'C'
let g:syntastic_javascript_checkers = ['jshint']
let g:airline_powerline_fonts = 1
let g:airline_theme="base16"
call expand_region#custom_text_objects({
      \ 'ii': 0,
      \ 'ai': 0,
      \ })
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<c-f>'
let g:multi_cursor_prev_key='<c-b>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:goldenview__enable_default_mapping = 0
let g:goldenview__enable_at_startup = 0
nnoremap R :GoldenViewResize<cr>
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'

if has("wind16") || has("win32") || has("win64")
  let g:nerdtree_tabs_open_on_gui_startup=0
endif

if has("gui_running")
  set background=dark
  colorscheme solarized
  syntax on
  if has("gui_win32")
    set guifont=Consolas:h11:cANSI
    set backspace=indent,eol,start
  endif
else
  syntax enable
endif
