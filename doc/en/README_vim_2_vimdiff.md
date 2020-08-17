# vimdiff 介绍

对比两个或者多个文件的不同之处。

```
vimdiff file1 file2 [file3 [file4]]
```

或者

```
vim -d file1 file2 [file3 [file4]]
```

还可以先打开 `file1`，然后用 `:vertical diffsplit file2` 来对比 `file1` 和 `file2`
两个文件。

**注意：** 在左右两个不同的窗口之间移动光标使用 `ctrl+h,j,k,l`。

### 跳转到差异点

`]c` 跳转到下一个差异点

`[c` 跳转到上一个差异点

### 文件合并

`dp` 把一个差异点中当前文件的内容复制到另一个文件里面。

`do` 把另一个文件中的内容复制到当前文件。

### 折叠代码

`zo` 打开折叠的代码

`zc` 折叠代码

### 保存

`:wa` 全部保存

### 其它

其它的操作就和正常使用 vim 没有任何区别。

用 `:help vimdiff` 查看帮助文档

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_2_vimdiff_01.gif" alt="vim_2_vimdiff_01.gif" />
</details>

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

