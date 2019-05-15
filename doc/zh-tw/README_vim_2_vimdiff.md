# vimdiff 介紹

對比兩個或者多個文件的不同之處。

```
vimdiff file1 file2 [file3 [file4]]
```

或者

```
vim -d file1 file2 [file3 [file4]]
```

還可以先打開 `file1`，然後用 `:vertical diffsplit file2` 來對比 `file1` 和 `file2`
兩個文件。

**注意：** 在左右兩個不同的窗口之間移動光標使用 `ctrl+h,j,k,l`。

### 跳轉到差異點

`]c` 跳轉到下一個差異點

`[c` 跳轉到上一個差異點

### 文件合並

`dp` 把一個差異點中當前文件的內容複製到另一個文件裡麵。

`do` 把另一個文件中的內容複製到當前文件。

### 折疊代碼

`zo` 打開折疊的代碼

`zc` 折疊代碼

### 保存

`:wa` 全部保存

### 其它

其它的操作就和正常使用 vim 冇有任何區彆。

用 `:help vimdiff` 查看幫助文檔

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_2_vimdiff_01.gif" alt="vim_2_vimdiff_01.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

