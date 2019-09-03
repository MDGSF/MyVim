# Vim 技巧0003

在光标所在行，从光标位置复制到指定的字符。

### 例子

下面的文本，光标如果位于 `a big world` 的 `a` 这个单词的，那我想从这里一直复制到
`world` 这个单词结束，不包括引号。可以使用 `yt"`，复制完之后，按 `p` 粘贴
可以查看成功复制的内容。

`yt"` 表示从光标所在位置，一直复制到引号。

如果我想复制到 `w` 呢？那就用 `ytw`。

```
"vim is a big world".
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_tips_0003_01.gif" alt="vim_tips_0003_01.gif" />
</details>

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

