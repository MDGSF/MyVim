# Vim 寄存器

`:help registers` 查看寄存器相關幫助文檔。

`:reg` 查看當前寄存器狀態。

## 一共有 10 類寄存器

1. The unnamed register ""
2. 10 numbered registers "0 to "9
3. The small delete register "-
4. 26 named registers "a to "z or "A to "Z
5. three read-only registers ":, "., "%
6. alternate buffer register "#
7. the expression register "=
8. The selection and drop registers "*, "+ and "~
9. The black hole register "_
10. Last search pattern register "/

## Unnamed register

```
""
```

最近的一次複製或者刪除操作（`d`, `c`, `s`, `x`, `y`），
數據都會保存到這個寄存器 `""` 中。

## Numbered registers

```
"0 to "9
```

一共 10 個數字寄存器。

寄存器 `"0` 保存最近一次複製的數據。

寄存器 `"1` 保存最近一次刪除的數據。

每次刪除的時候，寄存器 `"1` 的數據移動到寄存器 `"2`，
`"1` -> `"2`, `"2` -> `"3`, ...,  `"8` -> `"9`，
然後寄存器 `"9` 的數據丟棄。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_2_registers_01.gif" alt="vim_2_registers_01.gif" />
</details>

## Small delete register

```
"-
```

行內刪除的數據會被保存到寄存器 `"-` 中。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_2_registers_02.gif" alt="vim_2_registers_02.gif" />
</details>

## Named registers

```
"a to "z
"A to "Z
```

一共 26 個字母寄存器，這是給我們用戶使用的。

小寫字母將文本存儲到寄存器中。

大寫字母將文本添加到寄存器末尾。

`"aY` 將當前行存儲到寄存器 `"a` 中，而 `"AY` 將當前行添加到寄存器 `"a` 的末尾。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_2_registers_03.gif" alt="vim_2_registers_03.gif" />
</details>

## Selection registers

```
"*
"+
```

這兩個是剪切板寄存器。

詳細見 [vim,shell,tmux,瀏覽器之間互相複製數據](README_vim_2_copydata.md)

## Last search pattern register

```
"/
```

當你通過 `/` 或者 `?` 之類的命令執行了搜索，搜索的文本就會被保存到該寄存器。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

