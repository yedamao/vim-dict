if exists('g:loaded_vim_dict')
    finish
endif
let g:loaded_vim_dict = 1

function! LookUp(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  echo system("dict " . shellescape(@@))
  let @@ = saved_unnamed_register

endfunction

nnoremap <leader>l :set operatorfunc=LookUp<cr>g@
vnoremap <leader>l :<c-u>call LookUp(visualmode())<cr>
