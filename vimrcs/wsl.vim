"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows WSL Copy and Paste
"
" save selection to windows clipboard
" :'<,'>w !clip.exe
"
" save whole file to windows clipboard
" :w !clip.exe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" WSL yank support
" 直接使用 y 来复制，就会直接复制到 windows 的剪切板中
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

