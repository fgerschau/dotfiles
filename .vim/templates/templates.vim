function! SetupReactClass()
  silent! 0r ~/dotfiles/.vim/templates/skeleton.tsx
  %s/FILENAME/\=expand("%:t:r")
endfunction

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/dotfiles/.vim/templates/skeleton.sh
    autocmd BufRead *.sh if getfsize(expand('%'))==0|0r ~/dotfiles/.vim/templates/skeleton.sh|endif
    autocmd BufNewFile *.tsx SetupReactClass()
    autocmd BufRead *.tsx if getfsize(expand('%'))==0|call SetupReactClass()|endif
  augroup END
endif
