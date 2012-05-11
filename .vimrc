" Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.scss set filetype=scss

" Colors
set t_Co=256
colorscheme ir_black

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
nmap <D-f> /
imap <D-f> <Esc>/
map <Leader><D-t> :CommandTFlush<CR>:CommandT<CR>
imap <Leader><D-t> <Esc>:CommandTFlush<CR>:CommandT<CR>
nmap <D-D> :NERDTreeToggle<CR>
imap <D-D> <Esc>:NERDTreeToggle<CR>
map <D-/> mc<plug>NERDCommenterToggle<CR>'c
imap <D-/> <Esc>mc<plug>NERDCommenterToggle<CR>'ci
imap jj <Esc>
imap <D-CR> <Esc>o
imap <S-D-CR> <Esc>O
map <D-[> <C-w>h
map <D-]> <C-w>l
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
" Ruby folding
set foldmethod=syntax
set foldlevel=100
set foldminlines=2
set foldtext=MyFoldFunction()
set fillchars=fold:\ 

function! MyFoldFunction()
  let line = getline(v:foldstart)
  let lastline = getline(v:foldend)
  let numfolded = v:foldend - v:foldstart + 1
  return line . '  folded ' . numfolded . ' lines'
endfunction
 
highlight Folded term=bold ctermbg=0 ctermfg=7 guibg=bg guifg=fg
highlight FoldColumn term=bold ctermbg=10 ctermfg=7 guibg=bg guifg=fg
" Visual indent
vnoremap < <gv
vnoremap > >gv

" Swp file location
set directory^=$HOME/.vim/.swp/
