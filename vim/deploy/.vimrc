set nocompatible              " be iMproved, required
filetype off                  " required

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'fatih/vim-go'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


colorschem ron


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

if (&term == 'xterm-256color')
    set t_Co=256
endif

" map leader
let mapleader=","

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		    " Hide buffers when they are abandoned
set number          " display line number
set relativenumber
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set foldmethod=indent
set ruler
set nowrap
set laststatus=2
set backspace=indent,eol,start
set noswapfile
set clipboard+=unnamed

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" key-bindings
map <C-n> :NERDTreeToggle<CR>
" switch panes
:inoremap <C-j> <DOWN>
:inoremap <C-k> <UP>
:inoremap <C-l> <RIGHT>
"map <C-j> <C-w><C-j>
"map <C-k> <C-w><C-k>
"map <C-l> <C-w><C-l>
"map <C-h> <C-w><C-h>

" toggle the paste option
set pastetoggle=<F5>

" file extension ignored in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" map ev to open .vimrc in a vsplit window
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" ycm config file path
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" map sv to command:source $MYVIMRC, that is to say, reload .vimrc to make changes take
" effect
nnoremap <leader>sv :source $MYVIMRC<CR>

" move line up
nnoremap - :m -2<CR>
" move line down
nnoremap + :m +1<CR>

" vim-flake8
autocmd BufWritePost *.py call Flake8()

