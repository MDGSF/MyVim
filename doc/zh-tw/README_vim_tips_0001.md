# Vim 技巧0001

計算光標所在段落的單詞個數。

```
vip:w !wc -w
```

`v` 是進入 VISUAL 模式，`ip` 是選中光標所在的段落，可以用 `:help v_ip`
查看幫助文檔。

`:` 進入命令行，對選中的段落進行操作。

把選中的段落傳遞給程序 `wc`，讓 `wc` 程序來計算單詞的個數。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_tips_0001.gif" alt="vim_tips_0001.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

