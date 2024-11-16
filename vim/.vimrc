" <plugins>------------------------------------------------------------------------------------

" begin Vundle init
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
"Plugin 'Raimondi/delimitMate'

" gruxbox extension
Plugin 'nordtheme/vim'

" status line
"Plugin 'vim-airline/vim-airline' " too slow
Plugin 'itchyny/lightline.vim'
let g:lightline = {
\   'colorscheme': 'nord'
\   }

" end Vundle init
call vundle#end()
filetype plugin indent on

" <theme>---------------------------------------------------------------------------------------

"" nord theme
set background=dark
colorscheme nord

" <behaviour>-----------------------------------------------------------------------------------
"
" better line navigation
map j gj
map k gk

" set scroll offset
set scrolloff=8
set sidescroll=1
set sidescrolloff=8

" mouse control
set mouse=a

" indent options
set autoindent
set softtabstop=4 " tab expansion size
set shiftwidth=4  " tab character size
set expandtab

" restore cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" line numbering
set number relativenumber

" syntax highlighting
syntax on

" disable line wrapping
set nowrap

" highlight trailing whitespace (https://stackoverflow.com/a/48951029)
hi RedundantSpaces ctermbg=yellow guibg=yellow
match RedundantSpaces /\s\+$/ 

" hide ~ characters after EOF (https://vi.stackexchange.com/questions/28994/can-i-change-the-ugly-indicator-after-eol)
let &fillchars ..= ',eob: '

" highlight cursor line
augroup CursorLineColumn
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
hi cursorline ctermbg=black cterm=NONE

" status line colours
"autocmd vimenter * hi StatusLine ctermbg=black ctermfg=blue
"autocmd vimenter * hi StatusLineNC ctermbg=blue ctermfg=black

" tab colours
" https://stackoverflow.com/a/7238163
"hi TabLineFill ctermfg=black ctermbg=black
"hi TabLine ctermfg=blue ctermbg=black cterm=NONE
"hi TabLineSel ctermfg=black ctermbg=blue

" hide split bars
set fillchars+=vert:\ 
hi VertSplit ctermfg=0 ctermbg=NONE cterm=NONE

" customise tab X line
" see :h setting-tabline
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s ..= '%#TabLineSel#'
    else
      let s ..= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s ..= '%' .. (i + 1) .. 'T'

    " the label is made by MyTabLabel()
    let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s ..= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s ..= '%=%#TabLine#%999X[X]'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

" file exploration menu settings
let g:netrw_banner = 0        " remove directions at top of file listing
let g:netrw_liststyle=3       " tree style listing
let g:netrw_browse_split = 3  " split horizontal
let g:netrw_altv = 1
let g:netrw_winsize=25        " width of window
let g:netrw_preview=1
augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END
