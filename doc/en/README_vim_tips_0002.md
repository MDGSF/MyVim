# Vim 技巧0002

把多个空行压缩为一个空行。

## 方法一

```
:%!cat -s
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_tips_0002_01.gif" alt="vim_tips_0002_01.gif" />
</details>

## 方法二

```
:%s!\n\n\n\+!^M^M!g
```

The ^M is the visual representation of a newline, you can enter it by hitting `Ctrl+v Enter`.

试了下 `:%s!\n\n\n\+!\r\r!g` 也可以。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_tips_0002_02.gif" alt="vim_tips_0002_02.gif" />
</details>

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

