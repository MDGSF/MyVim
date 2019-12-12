""""""""""""""""""""""""""""""
" => C/C++
""""""""""""""""""""""""""""""
" {{{
augroup filetype_cpp
  autocmd!
  autocmd FileType c,cpp setl foldenable
  autocmd FileType c,cpp setl foldmethod=syntax
  autocmd FileType c,cpp setl foldopen-=search  "don't open folds when I search
  autocmd FileType c,cpp setl foldopen-=undo    "don't open folds when I undo
  autocmd FileType c,cpp setl foldlevel=100    "don't folds when I open the file
  autocmd FileType c,cpp nnoremap <space> @=((foldclosed(line( '.' ))<0) ? 'zc' : 'zo')<CR>
  autocmd FileType c,cpp setlocal tabstop=2
  autocmd FileType c,cpp setlocal shiftwidth=2
  autocmd FileType c,cpp setlocal softtabstop=2
augroup END
" }}}



""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
" {{{
let python_highlight_all = 1
autocmd FileType python syn keyword pythonDecorator True None False self

autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
autocmd BufNewFile,BufRead *.mako set ft=mako

autocmd FileType python map <buffer> F :set foldmethod=indent<cr>

autocmd FileType python inoremap <buffer> $r return
autocmd FileType python inoremap <buffer> $i import
autocmd FileType python inoremap <buffer> $p print
autocmd FileType python inoremap <buffer> $f # --- <esc>a
autocmd FileType python map <buffer> <leader>1 /class
autocmd FileType python map <buffer> <leader>2 /def
autocmd FileType python map <buffer> <leader>C ?class
autocmd FileType python map <buffer> <leader>D ?def
autocmd FileType python set cindent
autocmd FileType python set cinkeys-=0#
autocmd FileType python set indentkeys-=0#

autocmd FileType python nnoremap <buffer> <leader>pyt ggO#!/usr/bin/env python<CR># -*- coding: UTF-8 -*-<CR><CR>def main():<CR>pass<CR><CR><CR><Backspace>if __name__ == "__main__":<CR>main()<Esc>gg
" }}}


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" {{{
" autocmd FileType javascript call JavaScriptFold()
autocmd FileType javascript setl fen
autocmd FileType javascript setl nocindent

autocmd FileType javascript imap <c-t> $log();<esc>hi
autocmd FileType javascript imap <c-a> alert();<esc>hi

autocmd FileType javascript inoremap <buffer> $r return
autocmd FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

autocmd FileType javascript setlocal tabstop=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType javascript setlocal softtabstop=2

function! JavaScriptFold()
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction
" }}}


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
" {{{
function! CoffeeScriptFold()
  setlocal foldmethod=indent
  setlocal foldlevelstart=1
endfunction
autocmd FileType coffee call CoffeeScriptFold()

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
" }}}


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
" {{{
if exists('$TMUX')
  if has('nvim')
    set termguicolors
  else
    set term=screen-256color
  endif
endif
" }}}


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
" {{{
autocmd BufRead *.twig set syntax=html filetype=html
" }}}


""""""""""""""""""""""""""""""
" => Vimscript file settings
""""""""""""""""""""""""""""""
" {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType vim setlocal foldlevel=0
  autocmd BufEnter *.vim setlocal tabstop=2
  autocmd BufEnter *.vim setlocal shiftwidth=2
  autocmd BufEnter *.vim setlocal softtabstop=2
augroup END
" }}}


""""""""""""""""""""""""""""""
" => TeX file settings
""""""""""""""""""""""""""""""
" {{{
augroup filetype_tex
  autocmd!
  autocmd BufEnter *.tex setlocal tabstop=2
  autocmd BufEnter *.tex setlocal shiftwidth=2
  autocmd BufEnter *.tex setlocal softtabstop=2
augroup END
" }}}


""""""""""""""""""""""""""""""
" => golang file settings
""""""""""""""""""""""""""""""
" {{{
augroup filetype_golang
  autocmd!
  autocmd BufEnter *.go setlocal tabstop=2
  autocmd BufEnter *.go setlocal shiftwidth=2
  autocmd BufEnter *.go setlocal softtabstop=2
augroup END
" }}}


""""""""""""""""""""""""""""""
" => Markdown file settings
""""""""""""""""""""""""""""""
" {{{

let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

augroup filetype_markdown
  autocmd!
  " autocmd FileType *.md setlocal foldmethod=marker
  " autocmd FileType *.md setlocal foldlevelstart=100
  " autocmd FileType *.md setlocal foldlevel=100
  autocmd FileType,BufEnter,BufNewFile,BufRead *.md setlocal foldexpr=MarkdownLevel()
  autocmd FileType,BufEnter,BufNewFile,BufRead *.md setlocal foldmethod=expr
  autocmd FileType,BufEnter,BufNewFile,BufRead *.md setlocal foldlevelstart=100
  autocmd FileType,BufEnter,BufNewFile,BufRead *.md setlocal foldlevel=100
augroup END

function! MarkdownLevel()
  if getline(v:lnum) =~ '^# .*$'
    return ">1"
  endif
  if getline(v:lnum) =~ '^## .*$'
    return ">2"
  endif
  if getline(v:lnum) =~ '^### .*$'
    return ">3"
  endif
  if getline(v:lnum) =~ '^#### .*$'
    return ">4"
  endif
  if getline(v:lnum) =~ '^##### .*$'
    return ">5"
  endif
  if getline(v:lnum) =~ '^###### .*$'
    return ">6"
  endif
  return "="
endfunction
" }}}
