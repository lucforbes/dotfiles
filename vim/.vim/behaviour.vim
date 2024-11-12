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

