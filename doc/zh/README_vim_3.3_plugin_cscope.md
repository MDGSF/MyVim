# Vim 插件 cscope

[cscope](http://cscope.sourceforge.net/) 用于 C，C++，Java 文件快速查找函数。
是 [ctags](http://ctags.sourceforge.net/) 的增强版本。

## 安装

```
./configure
make
make install
```

## 构建数据库

```
$ cscope -bqR
```

这个命令会在当前目录下生成 cscope.out，cscope.in.out，cscope.po.out 三个文件，这
3 个文件可以理解为就是数据库。

cscope 默认只支持 C 语言，要使用 C++ 和 Java，需要执行如下命令：

```
$ find . -name "*.cpp" > cscope.files
$ find . -name "*.java" > cscope.files
$ cscope -bqR
```

可以到 `/usr/include` 和 `/usr/local/include` 目录下生成数据库。

`~/.MyVim/vimrcs/plugins_cscope_maps.vim` 配置会在 vim 启动的时候，
去尝试自动加载数据库 `/usr/include/cscope.out`，
`/usr/local/include/cscope.out` 和当前目录下的 `cscope.out`。

## 添加数据库

也可以在 vim 中，手动执行 `:cs add cscope.out` 来添加数据库。

可以使用 `:cs show` 来查看当前加载了哪些数据库。

## 快捷键

快捷键映射都配置在文件 `~/.MyVim/vimrcs/plugins_cscope_maps.vim` 中。

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

## 查看帮助文档

```
man cscope
cscope -h
:h cscope
```

* * *

[cscope 官网](http://cscope.sourceforge.net/)

[cscope 下载](https://sourceforge.net/projects/cscope/files/)

[galore/cscope](https://github.com/mhinz/vim-galore#cscope)

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_vim_3.2_plugin_pathogen.md)
>
> [下一章](README_vim_3.4_plugin_nerdtree.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

