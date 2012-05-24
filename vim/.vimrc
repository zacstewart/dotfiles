set nocompatible                                " turn off VI compatibility mode
call pathogen#infect()                          " load Pathogen bundles
filetype plugin indent on                       " use filetype detection and load plugins and indent for them
au BufRead,BufNewFile *.scss set filetype=scss  " manually define scss filetype detection
set directory^=$HOME/.vim/.swp/                 " centralize swp file location

" Colors
syntax on                                       " turn on syntax highlighting
set t_Co=256                                    " use 256 colors
colorscheme ir_black                            " and ir_black as default theme
" Text formatting
set ai                                          " auto-indent
set si                                          " smart indentation
set expandtab                                   " use soft tabs
set softtabstop=2                               " that are 2 spaces wide
set shiftwidth=2                                " auto-indent and shift by 2 spaces
set list                                        " show non-printed chars
set listchars=tab:->,trail:·                    " specifically, tabs and trailing whitespace
set nowrap                                      " turn off line wrapping
" UI
set mouse=a                                     " use mouse in all modes
set wildmode=longest,list,full                  " tab completeion: 1) bash-like, 2) list, 3) wildmenu
set wildmenu                                    " use wildmenu (3rd tab)
set number                                      " turn on line numbers
set cursorline                                  " highlight current line
set laststatus=2                                " always show statusline
set noshowmode                                  " but not mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"        " set cursor to line on start insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"        " go back to block for normal mode
" Toggle status line
map <Leader>s :call ToggleStatusline()<CR>
function! ToggleStatusline()
  if &laststatus == 2
    set laststatus=0
  else
    set laststatus=2
  endif
endfunction
" Custom key mapping
inoremap jj <Esc>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
" remove superfluous whitespace
map <Leader><Space> :%s/\s\+$//g<CR>
" Visual indent
vnoremap < <gv
vnoremap > >gv
" Ruby-friendly folding
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
