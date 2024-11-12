" Vundle init begin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


" indent guides
"Plugin 'Yggdroot/indentLine'
"let g:indentLine_color_term = 0
"let g:indentLine_char = '┋'

" verilog/systemverilog support
Plugin 'vhda/verilog_systemverilog.vim'

" autocomplete pairs
Plugin 'Raimondi/delimitMate'

" gruxbox extension
Plugin 'nordtheme/vim'

" status line
Plugin 'itchyny/lightline.vim'
let g:lightline = {
\   'colorscheme': 'nord',
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' }
\   }

" Vundle init end
call vundle#end()
filetype plugin indent on
