# Vim 缓冲区

## 查看所有的缓冲区

```
:help :ls
:ls
:files
:buffers
```

示例：

```
:ls
1 #h   "README_vim_resource.md"       line 15
3  a   "README_vim_modify.md"         line 54
4  h   "README_vim_openclose.md"      line 1
5  h   "README_vim_tab_windows_buffer.md" line 1
6  h   "[No Name]"                    line 0
7 %a   "README_vim_buffer.md"         line 10
```

第一列的数字就是每个缓冲区的编号，是唯一的。

第二列的 `%a` 表示正在编辑的文件，也就是当前文件。

第二列的 `%h` 表示上一个编辑的文件。

可以使用 `ctrl+^` 在当前文件和上一个文件之间切换。

注意：`:ls` 只可以查看我们自己的缓冲区，像插件缓冲区，帮助缓冲区是需要用 `:ls!`
才可以看到的。

## 切换缓冲区

```
:help :buffer
:[N]b[uffer][!] [+cmd] [N]
:b
:bu
:buf
:buffer
```

`[N]` 就是缓冲区的编号。

`b1` 或者 `b 1` 切换到第一个缓冲区。

## 缓冲区分类

用 `vim file1` 启动 vim。这个文件的内容将会被加载到缓冲区中，你现在就有一个
**已激活的缓冲区**。如果你现在执行 `:e file2`，那么 `file1` 会变成一个
**隐藏的缓冲区**，并且 `file2` 变成**已激活的缓冲区**。

**未命名缓冲区**是一种没有关联特定文件的缓冲区。`:enew` 会创建一个**未命名缓冲区**。修改了之后保存到文件中，这个缓冲区就会变成一个**已命名缓冲区**。

* * *

[active-loaded-listed-named-buffers](https://github.com/mhinz/vim-galore#active-loaded-listed-named-buffers)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

