# Vim 插件 cscope

[cscope](http://cscope.sourceforge.net/) 用於 C，C++，Java 文件快速查找函數。
是 [ctags](http://ctags.sourceforge.net/) 的增強版本。

## 安裝

```
./configure
make
make install
```

## 構建數據庫

```
$ cscope -bqR
```

這個命令會在當前目錄下生成 cscope.out，cscope.in.out，cscope.po.out 三個文件，這
3 個文件可以理解為就是數據庫。

cscope 默認隻支持 C 語言，要使用 C++ 和 Java，需要執行如下命令：

```
$ find . -name "*.cpp" > cscope.files
$ find . -name "*.java" > cscope.files
$ cscope -bqR
```

可以到 `/usr/include` 和 `/usr/local/include` 目錄下生成數據庫。

`~/.MyVim/vimrcs/plugins_cscope_maps.vim` 配置會在 vim 啟動的時候，
去嘗試自動加載數據庫 `/usr/include/cscope.out`，
`/usr/local/include/cscope.out` 和當前目錄下的 `cscope.out`。

## 添加數據庫

也可以在 vim 中，手動執行 `:cs add cscope.out` 來添加數據庫。

可以使用 `:cs show` 來查看當前加載了哪些數據庫。

## 快捷鍵

快捷鍵映射都配置在文件 `~/.MyVim/vimrcs/plugins_cscope_maps.vim` 中。

```
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
```

```
's'   symbol: find all references to the token under cursor
'g'   global: find global definition(s) of the token under cursor
'c'   calls:  find all calls to the function name under cursor
't'   text:   find all instances of the text under cursor
'e'   egrep:  egrep search for the word under cursor
'f'   file:   open the filename under cursor
'i'   includes: find files that include the filename under cursor
'd'   called: find functions that function under cursor calls
```

## 查看幫助文檔

```
man cscope
cscope -h
:h cscope
```

* * *

[cscope 官網](http://cscope.sourceforge.net/)

[cscope 下載](https://sourceforge.net/projects/cscope/files/)

[galore/cscope](https://github.com/mhinz/vim-galore#cscope)

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_3.2_plugin_pathogen.md)
>
> [下一章](README_vim_3.4_plugin_nerdtree.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

