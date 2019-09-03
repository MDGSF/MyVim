# Vim 技巧0002

把多個空行壓縮為一個空行。

## 方法一

```
:%!cat -s
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_tips_0002_01.gif" alt="vim_tips_0002_01.gif" />
</details>

## 方法二

```
:%s!\n\n\n\+!^M^M!g
```

The ^M is the visual representation of a newline, you can enter it by hitting `Ctrl+v Enter`.

試了下 `:%s!\n\n\n\+!\r\r!g` 也可以。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_tips_0002_02.gif" alt="vim_tips_0002_02.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

