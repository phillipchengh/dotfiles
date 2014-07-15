set nocompatible              " be iMproved, required

" g:my_vim_dir is used elsewhere in my vim configurations
let g:my_vim_dir=expand("$HOME/.vim")

" $HOME/.vim and $HOME/.vim/after are in the &rtp on unix
" But on windows they need to be added
if has("wind16") || has("win32") || has("win64")
    " Add g:my_vim_dir to the front of the runtimepath
    execute "set rtp^=".g:my_vim_dir
    " Add g:my_vim_dir\after to the end of the runtimepath
    execute "set rtp+=".g:my_vim_dir."\\after"
    " Note, pathogen#infect() looks for the 'bundle' folder in each path
    " of the &rtp, where the last dir in the '&rtp path' is not 'after'. The
    " <path>\bundle\*\ after folders will be added if and only if 
    " the corresponding <path>\after folder is in the &rtp before 
    " pathogen#infect() is called. So it is very important to add the above
    " 'after' folder.
    "
    " Not necessary but I like to cleanup &rtp to use \ instead of /
    " when on windows machines
    let &rtp=substitute(&rtp, "[/]", "\\", "g")
    " On windows, if called from cygwin or msys, the shell needs to be changed
    " to cmd.exe to work with certain plugins that expect cmd.exe on windows
    " vers of vim.
    if &shell=~#'bash$'
        set shell=$COMSPEC " Sets shell to correct path for cmd.exe
    endif
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Mine
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'zenorocha/dracula-theme'
Bundle 'jiangmiao/auto-pairs'
Bundle 'JulesWang/css.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'matze/vim-move'
Bundle 'mbbill/undotree'
Bundle 'scrooloose/syntastic'
Bundle 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
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
map <C-n> :NERDTreeToggle<CR>
let g:move_key_modifier = 'C'
let g:syntastic_javascript_checkers = ['jshint']
