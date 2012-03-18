" Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.scss set filetype=scss

" Colors
colorscheme darkspectrum

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
" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Shortkeys
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
map <D-n> :edit<Space>
imap <D-n> <Esc>:edit<Space>
"" Toggle status line
map <Leader>s :if &laststatus==2<Bar>
        \set laststatus=0<Bar>
      \else<Bar>
        \set laststatus=2<Bar>
      \endif<CR>
"" Remove whitespace
map <Leader><Space> :%s/\s\+$//g<CR>
vnoremap < <gv
vnoremap > >gv

" Swp file location
set directory^=$HOME/.vim/.swp/
