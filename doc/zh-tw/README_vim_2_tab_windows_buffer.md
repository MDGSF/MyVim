# Vim 標簽頁,窗口,緩衝區三者之間的關係

> 1. 緩衝區是文件在內存中的文本數據。
> 2. 窗口是用來顯示緩衝區數據的。
> 3. 標簽頁是窗口的集合。

你可以使用多個窗口來顯示同一個緩衝區，
也可以用多個窗口來顯示多個不同的緩衝區。

緩衝區是加載到內存中進行編輯的文件。
原始的文件保持不變直到你把緩衝區中的數據寫入到文件。

如果你啟動 vim 的時候冇有附帶任何參數，你會得到一個標簽頁，
這個標簽頁裡麵有一個窗口，這個窗口裡麵有一個緩衝區。

緩衝區是全局可見的，你可以在任意一個標簽頁的任意一個窗口中訪問任意一個緩衝區。

`:tabnew` 會創建一個新的標簽頁，該標簽頁中有一個新的窗口，窗口中有一個新的**未命名緩衝區**。

`:new` 會創建一個新的窗口，該窗口中包含一個**未命名緩衝區**。

`:split` 會創建一個新的窗口，兩個窗口顯示的是同一個緩衝區中的數據，
所以你在一個窗口中修改，另一個窗口中也會跟著改變。

`:ls` 查看所有的緩衝區。

`:enew` 把當前窗口的緩衝區切換為**隱藏緩衝區**，
然後新建一個**未命名緩衝區**顯示在當前窗口。

> [vim 標簽頁](README_vim_1.6_tab.md)
> [vim 窗口](README_vim_1.7_windows.md)
> [vim 緩衝區](README_vim_1.8_buffer.md)

* * *

[buffers-windows-tabs](https://github.com/mhinz/vim-galore/blob/master/README.md#buffers-windows-tabs)

[http://vimdoc.sourceforge.net/htmldoc/windows.html#windows-intro](http://vimdoc.sourceforge.net/htmldoc/windows.html#windows-intro)

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

