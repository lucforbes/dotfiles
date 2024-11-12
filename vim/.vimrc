source ~/.vim/plugins.vim
source ~/.vim/theme.vim
source ~/.vim/behaviour.vim

" line numbering
set number relativenumber

" syntax highlighting
syntax on

" disable line wrapping
set nowrap

" highlight trailing whitespace (https://stackoverflow.com/a/48951029)
hi RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/ 

" hide ~ at end (https://vi.stackexchange.com/questions/28994/can-i-change-the-ugly-indicator-after-eol)
let &fillchars ..= ',eob: '

" cursor highlighting
augroup CursorLineColumn
    au!
    au VimEnter * setlocal cursorline
    au VimEnter * setlocal cursorcolumn
    au WinEnter * setlocal cursorline
    au WinEnter * setlocal cursorcolumn
    au BufWinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorline
    au WinLeave * setlocal nocursorcolumn
augroup END
hi cursorline ctermbg=black cterm=NONE
set cursorlineopt=both
hi CursorLineNR ctermbg=black cterm=NONE
hi cursorcolumn ctermbg=black

" status line colours
"autocmd vimenter * hi StatusLine ctermbg=black ctermfg=blue
"autocmd vimenter * hi StatusLineNC ctermbg=blue ctermfg=black

" tab colours
" https://stackoverflow.com/a/7238163
hi TabLineFill ctermfg=black ctermbg=black
hi TabLine ctermfg=blue ctermbg=black cterm=NONE
hi TabLineSel ctermfg=black ctermbg=blue

" hide split bars
set fillchars+=vert:\ 
"hi VertSplit ctermfg=0 ctermbg=NONE cterm=NONE

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
