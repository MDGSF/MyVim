# Vim 技巧0001

计算光标所在段落的单词个数。

```
vip:w !wc -w
```

`v` 是进入 VISUAL 模式，`ip` 是选中光标所在的段落，可以用 `:help v_ip`
查看帮助文档。

`:` 进入命令行，对选中的段落进行操作。

把选中的段落传递给程序 `wc`，让 `wc` 程序来计算单词的个数。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_tips_0001.gif" alt="vim_tips_0001.gif" />
</details>

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

