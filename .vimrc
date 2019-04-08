" vim configuration
set tabstop=4

set guifont=Monaco\ 11

set shiftwidth=4	" Indents will have a width of 4

set softtabstop=4	" Sets the number of columns for a TAB

set expandtab		" Expand TABs to spaces

set number          " Display line number

set nocompatible              " be iMproved, required
filetype off                  " required

map <tab> <c-w><c-w>
map tn :bn<cr>
map tp :bp<cr>
map tc :bd<cr>
map tt :TagbarToggle<CR>
map <C-o> :NERDTreeToggle<CR>
" map <C-l> :tabn<CR>
" map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin fugitive.vim
" Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/nerdtree'
" Plugin 'lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'kien/ctrlp.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" gruvbox
Plugin 'morhetz/gruvbox'
" material-theme
Plugin 'jdkanani/vim-material-theme'
Plugin 'dracula/vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" activate gruvbox
colorscheme gruvbox
set bg=dark

" activate dracula
" colorscheme dracula

let g:airline_theme='dark'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0

let g:ctrlp_map = 'ff'
let g:ctrlp_cmd = 'CtrlP'

" set hidden
