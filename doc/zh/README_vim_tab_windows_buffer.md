# Vim 标签页,窗口,缓冲区三者之间的关系

> 1. 缓冲区是文件在内存中的文本数据。
> 2. 窗口是用来显示缓冲区数据的。
> 3. 标签页是窗口的集合。

你可以使用多个窗口来显示同一个缓冲区，
也可以用多个窗口来显示多个不同的缓冲区。

缓冲区是加载到内存中进行编辑的文件。
原始的文件保持不变直到你把缓冲区中的数据写入到文件。

如果你启动 vim 的时候没有附带任何参数，你会得到一个标签页，
这个标签页里面有一个窗口，这个窗口里面有一个缓冲区。

缓冲区是全局可见的，你可以在任意一个标签页的任意一个窗口中访问任意一个缓冲区。

`:tabnew` 会创建一个新的标签页，该标签页中有一个新的窗口，窗口中有一个新的**未命名缓冲区**。

`:new` 会创建一个新的窗口，该窗口中包含一个**未命名缓冲区**。

`:split` 会创建一个新的窗口，两个窗口显示的是同一个缓冲区中的数据，
所以你在一个窗口中修改，另一个窗口中也会跟着改变。

`:ls` 查看所有的缓冲区。

`:enew` 把当前窗口的缓冲区切换为**隐藏缓冲区**，
然后新建一个**未命名缓冲区**显示在当前窗口。

* * *

[buffers-windows-tabs](https://github.com/mhinz/vim-galore/blob/master/README.md#buffers-windows-tabs)

[http://vimdoc.sourceforge.net/htmldoc/windows.html#windows-intro](http://vimdoc.sourceforge.net/htmldoc/windows.html#windows-intro)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

