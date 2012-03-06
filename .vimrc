""" Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.scss set filetype=scss

""" Colors
colorscheme darkspectrum

""" Whitespace
" Indentation
set ai
set si
" Use soft tabs
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
" Highlight trailing ws
set listchars=tab:->,trail:·
set list
set nowrap
" Line numbers
set number
set cursorline

""" Shortkeys
nmap <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>
map <Leader><D-t> :CommandTFlush<CR>
imap <Leader><D-t> <Esc>:CommandTFlush<CR>
nmap <D-D> :NERDTreeToggle<CR>
imap <D-D> <Esc>:NERDTreeToggle<CR>
map <D-/> mc<plug>NERDCommenterToggle<CR>'c
imap <D-/> <Esc>mc<plug>NERDCommenterToggle<CR>'ci
imap jj <Esc>
imap <D-CR> <Esc>o
imap <S-D-CR> <Esc>O
map <D-n> :edit 
imap <D-n> <Esc>:edit 
vnoremap < <gv
vnoremap > >gv

""" Filesystem
set directory^=$HOME/.vim/.swp/
