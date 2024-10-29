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
" indent guides
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 0
let g:indentLine_char = '┋'

" verilog/systemverilog support
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

" indent options
set autoindent
set softtabstop=4 " tab expansion size
set shiftwidth=4  " tab character size
set expandtab

" disable line wrapping
set nowrap

" set scroll offset
set scrolloff=12
set sidescroll=1
set sidescrolloff=12
" mouse scrolling
set mouse=a

" highlight trailing whitespace
" https://stackoverflow.com/a/48951029
hi RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" indent guides for tabs
" https://github.com/Yggdroot/indentLine
" set list lcs=tab:\|\ 
" set list lcs=
" hi SpecialKey ctermfg=black

" status line colours
hi StatusLine ctermbg=black ctermfg=blue
hi StatusLineNC ctermbg=blue ctermfg=black

" split bar config
set fillchars+=vert:\ 
hi VertSplit ctermfg=0 ctermbg=NONE cterm=NONE

" hide ~ at end
" https://vi.stackexchange.com/questions/28994/can-i-change-the-ugly-indicator-after-eol
let &fillchars ..= ',eob: '
