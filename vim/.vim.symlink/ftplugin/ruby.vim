nnoremap <Leader>rh8 :call Ruby19HashTo18()<CR>
function! Ruby19HashTo18()
  normal bf:xbPea =>
endfunction

nnoremap <Leader>rh9 :call Ruby18HashTo19()<CR>
function! Ruby18HashTo19()
  normal F:xepldf>
endfunction

nnoremap <Leader>f :call HshToFetch()<CR>
function! HshToFetch()
  normal f[cs[)i.fetchjj
endfunction
