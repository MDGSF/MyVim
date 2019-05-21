set background=dark
colorscheme solarized

vnoremap <silent> <F2> :<c-u>VDv<CR>
nnoremap <silent> <F2> :<c-u>VDn<CR>
noremap <leader>zz :<c-u>VDe<CR>

inoreabbrev #i #include
inoreabbrev #d #define
inoreabbrev @e 1342042894@qq.com
inoreabbrev @b mdgsf.github.io
inoreabbrev @c Copyright 2019 Huang Jian, all rights reserved.

" 在插入模式下，把 jk 映射为 <esc>，并且强制 <esc> 键不能使用。
inoremap jk <esc>
" inoremap <esc> <nop>

vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

nnoremap <leader>jg :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
