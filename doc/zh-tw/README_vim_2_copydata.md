# vim,shell,tmux,瀏覽器之間互相複製數據

## vim 不同窗口之間互相複製

按 `v` 進入 VISUAL 模式，選擇文本，按 `y` 複製，按 `p` 粘貼。

## 複製 vim 數據到 vim 的命令行模式

按 `v` 進入 VISUAL 模式，選擇文本，按 `y` 複製

按 `:` 進入命令行模式，按 `ctrl+r shift+"` 粘貼數據到 `:` 後麵。

## 複製 vim 數據到 vim 的搜索模式

按 `v` 進入 VISUAL 模式，選擇文本，按 `y` 複製

按 `/` 進入搜索模式，按 `ctrl+r shift+"` 粘貼數據到 `/` 後麵。

## 操作係統剪切板

大部分的 Linux 和 UNIX-like 操作係統都有兩個獨立的剪切板：

**PRIMARY 剪切板**：

這個剪切板你隻要用鼠標選中了文本，就會被自動複製到這個剪切板中（叫 copy-on-select），然後用鼠標的中鍵就可以複製。

在 vim 中，你隻要在 VISUAL 模式下選中了文本，也會自動複製到這個剪切板中。

這個剪切板不是很好用，因為你鼠標一不小心就選中了其他的文本，剪切板中的內容就改變了。

**CLIPBOARD 剪切板**：

`ctrl+c` 用來複製

`ctrl+v` 用來粘貼

**OS X** 和 **Windows** 操作係統隻有一個剪切板，就是 **CLIPBOARD**。

vim 有兩個特殊的寄存器對應著這兩個剪切板：

`*` 對應著 `PRIMARY` 剪切板

`+` 對應著 `CLIPBOARD` 剪切板

```
"*y 複製數據到 PRIMARY 剪切板，其實選中了就複製了，根本用不著這個
"*p 粘貼 PRIMARY 剪切板的數據
"+y 複製數據到 CLIPBOARD 剪切板
"+p 粘貼 CLIPBOARD 剪切板的數據
```

## 瀏覽器上複製粘貼

1. 通過 `PRIMARY` 剪切板，選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，`ctrl+c` 複製，`ctrl+v` 粘貼。

## 複製瀏覽器數據到 shell 終端

1. 通過 `PRIMARY` 剪切板，鼠標選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，`ctrl+c` 複製，`ctrl+shift+v` 或者 `shift+insert` 粘貼。

## 複製 shell 終端數據到瀏覽器

1. 通過 `PRIMARY` 剪切板，鼠標選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，鼠標選擇文本，鼠標右鍵複製，`ctrl+v` 粘貼。

注意：在終端是不能使用 `ctrl+c` 來複製的，因為 `ctrl+c` 在終端是用來停止程序運行的。

## 複製瀏覽器數據到 tmux 終端

1. 無法通過 `PRIMARY` 剪切板。
2. 通過 `CLIPBOARD` 剪切板，`ctrl+c` 複製，`ctrl+shift+v` 或者 `shift+insert` 粘貼。

## 複製 tmux 終端數據到瀏覽器

1. `ctrl+b [` 進入複製模式，通過 hjkl 來上下左右移動光標。
2. 按空格開始複製，按回車結束複製。
3. `ctrl+b c` 複製。
4. 在瀏覽器中用 `ctrl+v` 粘貼。

## tmux終端之間互相複製粘貼

1. `ctrl+b [` 進入複製模式，通過 hjkl 來上下左右移動光標。
2. 按空格開始複製，按回車結束複製。
3. `ctrl+b ]` 粘貼。

## 複製 vim 數據到瀏覽器

1. 通過 `PRIMARY` 剪切板，選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，`"+y` 複製，`ctrl+v` 粘貼。

注意：`"+y` 要怎麼按？先按著 `shift` 鍵不放，然後按 `"` 鍵，再按 `+`
鍵，然後放開 `shift` 鍵，再按 `y` 鍵。

## 複製瀏覽器數據到 vim

1. 通過 `PRIMARY` 剪切板，選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，`ctrl+c` 複製，`"+p` 粘貼。

如果 vim 是在 tmux 終端下的，可以按 `i` 先進入插入模式，然後 `ctrl+b ctrl+v`
來複製數據到 vim。

## 複製 vim 數據到 shell

1. 通過 `PRIMARY` 剪切板，選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，`"+y` 複製，`ctrl+shift+v` 或者 `shift+insert` 粘貼。

## 複製 shell 數據到 vim

1. 通過 `PRIMARY` 剪切板，選擇文本，然後用鼠標中鍵粘貼。
2. 通過 `CLIPBOARD` 剪切板，鼠標選擇文本，鼠標右鍵複製，`"+p` 粘貼。

## vim 和 tmux 之間互相複製數據

如果 vim 是在 tmux 中打開的，可以直接使用 [tmux終端之間互相複製粘貼](#tmux終端之間互相複製粘貼)。

在 vim 中粘貼的時候需要進入插入模式。

* * *

[How can I copy text to the system clipboard from Vim?](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim)

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

