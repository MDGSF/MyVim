# vim 打開、退出

## 打開 vim

```
vim
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_01.gif" alt="vim_1.1_open_01.gif" />
</details>

## 打開 file.txt

```
vim file.txt
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_02.gif" alt="vim_1.1_open_02.gif" />
</details>

## 打開多個文件

```
vim file1.txt file2.txt
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_03.gif" alt="vim_1.1_open_03.gif" />
</details>

## 以標簽頁的方式打開多個文件

```
vim -p file1.txt file2.txt
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_04.gif" alt="vim_1.1_open_04.gif" />
</details>

## 水平打開多個窗口

```
vim -o file1.txt file2.txt file3.txt ...
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_05.gif" alt="vim_1.1_open_05.gif" />
</details>

在不同的窗口之間移動光標可以使用 `ctrl+h,j,k,l`。
和窗口相關的其它知識點會在 [vim 窗口](README_vim_1.7_windows.md) 那一章介紹。

## 垂直打開多個窗口

```
vim -O file1.txt file2.txt file3.txt ...
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_06.gif" alt="vim_1.1_open_06.gif" />
</details>

## 對比文件

```
vim -d file1.txt file2.txt file3.txt ...
vimdiff file1.txt file2.txt file3.txt ...
```

詳細見 [vimdiff](README_vim_2_vimdiff.md) 那一章。

## 退出 vim

```
:q
```

## 強製退出

如果修改了文件，不想保存

```
:q!
```

## 保存當前文件

```
:w
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_07.gif" alt="vim_1.1_open_07.gif" />
</details>

## 強製保存

```
:w!
```

`<leader>w` 也可以保存，在配置文件中增加映射。

```
nmap <leader>w :w!<cr>
```

## 以超級用戶身份保存

```
:W （大寫字母W）
```

需要在配置中增加映射。

```
command W w !sudo tee % > /dev/null
```

## 保存全部文件

```
:wa
```

## 保存並退出

```
:wq
```

## 保存內容到 filename.txt 並退出

```
:wq filename.txt
```

## 退出多個文件

```
:qa
```

`:q` 隻是關閉當前窗口，`:qa` 可以把所有的窗口都關閉。

## 強製退出多個文件

```
:qa!
```

## 優雅的退出

如果文件有修改，則先保存之後，再退出。

如果文件冇有修改，則直接退出。

```
:x
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_08.gif" alt="vim_1.1_open_08.gif" />
</details>

## 另存為

`:saveas newfilename.txt` 另存為 `newfilename.txt` 並開始編輯新的這個 `newfilename.txt`。

`:w newfilename.txt` 把當前文件另存一份副本 `newfilename.txt`，並繼續編輯原文件。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.1_open_09.gif" alt="vim_1.1_open_09.gif" />
<img src="../../images/vim_1.1_open_10.gif" alt="vim_1.1_open_10.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_02_how_to_use_this_document.mdmd)
>
> [下一章](README_vim_1.2_move_cursor.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

