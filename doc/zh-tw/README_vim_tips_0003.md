# Vim 技巧0003

在光標所在行，從光標位置複製到指定的字符。

### 例子

下麵的文本，光標如果位於 `a big world` 的 `a` 這個單詞的，那我想從這裡一直複製到
`world` 這個單詞結束，不包括引號。可以使用 `yt"`，複製完之後，按 `p` 粘貼
可以查看成功複製的內容。

`yt"` 表示從光標所在位置，一直複製到引號。

如果我想複製到 `w` 呢？那就用 `ytw`。

```
"vim is a big world".
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_tips_0003_01.gif" alt="vim_tips_0003_01.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

