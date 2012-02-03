syntax on
set mouse=a
set showmode
autocmd VimEnter * wincmd p
colorscheme railscasts
" Whitespace -----------------------------
set autoindent
set expandtab
set tabstop=2
set ts=2
set shiftwidth=2
set listchars=tab:->,trail:·
set list
set nowrap
" Numbers --------------------------------
set number
set scrolloff=3
set sidescrolloff=2
set numberwidth=4
set cursorline
" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
" NERD Tree
map <D-D> :NERDTreeToggle<CR>
imap <D-D> <Esc>:NERDTreeToggle<CR>
" Searching
map <D-F> :Ack<space>
imap <D-F> <Esc>:Ack<space>
" jj to escape
imap jj <Esc>
" New line from anywhere
imap <D-CR> <Esc>o
imap <S-D-CR> <Esc>O
" Status Line ----------------------------
set showcmd
set wildmenu
set wildmode=list:longest
set ruler
set shortmess=atI

" Indenting ------------------------------
set ai
set si
filetype plugin indent on
" Swap files
set directory^=$HOME/.vim/.swap//
