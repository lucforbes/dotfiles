" ==========================================================================================
" START vundle init - https://github.com/VundleVim/Vundle.vim
" ==========================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" *********** START plugins ***********
Plugin 'vhda/verilog_systemverilog.vim'
" ************ END plugins ************

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
" ==========================================================================================
" END vundle init
" ==========================================================================================

" line numbering
set number relativenumber

" syntax highlighting
syntax on

" indentation
set autoindent
set tabstop=4
set shiftwidth=4

" highlight trailing whitespace
" https://stackoverflow.com/a/48951029
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" indent guides
" https://stackoverflow.com/a/13737262
" set list lcs=tab:\┆\
" https://vi.stackexchange.com/a/6140
" hi SpecialKey ctermfg=grey guifg=grey70

