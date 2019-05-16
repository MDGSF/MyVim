# Vim 緩衝區

## 查看所有的緩衝區

```
:help :ls
:ls
:files
:buffers
```

示例：

```
:ls
1 #h   "README_vim_resource.md"       line 15
3  a   "README_vim_modify.md"         line 54
4  h   "README_vim_openclose.md"      line 1
5  h   "README_vim_tab_windows_buffer.md" line 1
6  h   "[No Name]"                    line 0
7 %a   "README_vim_buffer.md"         line 10
```

第一列的數字就是每個緩衝區的編號，是唯一的。

第二列的 `%a` 表示正在編輯的文件，也就是當前文件。

第二列的 `%h` 表示上一個編輯的文件。

可以使用 `ctrl+^` 在當前文件和上一個文件之間切換。

注意：`:ls` 隻可以查看我們自己的緩衝區，像插件緩衝區，幫助緩衝區是需要用 `:ls!`
才可以看到的。

## 打開緩衝區第 N 個文件

```
:help :buffer
:[N]b[uffer][!] [+cmd] [N]
:b
:bu
:buf
:buffer
```

`[N]` 就是緩衝區的編號。

`b1` 或者 `b 1` 切換到第一個緩衝區。

## 切換緩衝區

> :bn 打開緩衝區下一個文件
> :bp 打開緩衝區上一個文件
> :b [N] 打開緩衝區第 N 個文件

## 緩衝區分類

用 `vim file1` 啟動 vim。這個文件的內容將會被加載到緩衝區中，你現在就有一個
**已激活的緩衝區**。如果你現在執行 `:e file2`，那麼 `file1` 會變成一個
**隱藏的緩衝區**，並且 `file2` 變成**已激活的緩衝區**。

**未命名緩衝區**是一種冇有關聯特定文件的緩衝區。`:enew` 會創建一個**未命名緩衝區**。修改了之後保存到文件中，這個緩衝區就會變成一個**已命名緩衝區**。

* * *

[active-loaded-listed-named-buffers](https://github.com/mhinz/vim-galore#active-loaded-listed-named-buffers)

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.7_windows.md)
>
> [下一章](README_vim_1_how_to_find_help.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

