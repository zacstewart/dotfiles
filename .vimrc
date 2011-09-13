syntax on
set mouse=a
set autoindent
set expandtab
set tabstop=2
set ts=2
set shiftwidth=2
set showmode
"autocmd VimEnter * wincmd p
colorscheme railscasts

" Numbers --------------------------------
set number
set scrolloff=3
set sidescrolloff=2
set numberwidth=4
set cursorline
 "Command-/ to toggle comments
map <D-/> mz<plug>NERDCommenterToggle<CR>`z
imap <D-/> <Esc>mz<plug>NERDCommenterToggle<CR>`zi

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
