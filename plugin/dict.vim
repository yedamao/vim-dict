if exists('g:loaded_vim_dict')
    finish
endif
let g:loaded_vim_dict = 1

function! LookUp()
  " Look up the word
  let result = system("dict " . expand("<cword>"))

  echo result
endfunction

nnoremap <leader>l :call LookUp()<cr>
