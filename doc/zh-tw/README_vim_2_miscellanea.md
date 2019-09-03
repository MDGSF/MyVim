# vim 其他注意點

## Esc

`Esc` 可以用來從不同的模式回到普通模式。

`Esc` 也可以終止輸入了一半的命令。

當你不知道自己處於什麼狀態的時候，就按 `Esc` 鍵。

### 不小心按了 ctrl+s，結果卡死了

這個其實和 vim 冇有關係，`ctrl+s` 是讓 linux 終端暫停的命令。

用 `ctrl+q` 就可以恢複了。

如果你在查看服務器滾動的日誌的時候，就可以使用 `ctrl+s`
來讓日誌暫停下，方便查看。

## 把 vim 進程放到後臺

在 `vim` 的編輯界麵按 `ctrl+z`，會進入 `shell` 界麵。

可以使用 `jobs` 來查看。

使用 `fg` 來恢複 `vim` 界麵。

如果用 `jobs` 查看有多個後臺進程，
在 `bash` 中可以使用 `fg + number` 來恢複，
在 `zsh` 中可以使用 `fg + %number` 來恢複。

`number` 就是數字 1，2，3...

## 自動補全提示

```
ctrl+n
```

可以通過多次 `ctrl+n` 來不同的選項中切換。

## read 命令

read 命令用來讀取其他文件內容到當前 buffer，
或者是讀取其他命令的輸出到當前 buffer。

```
:help :read
:r[ead] [++opt] [name]
:r
:re
:read
```

`:read !ls` 讀取 `ls` 命令的輸出到光標所在位置。

`:0r !ls` 讀取 `ls` 命令的輸出到文檔的最開頭。

`:r !pwd` 獲取當前路徑。

**獲取其他終端的路徑：**

> echo $PWD > /tmp/a
> :read /tmp/a

## 重複執行上一個命令

在你執行完一個命令之後，按 `.` 這個鍵則會再次執行這個命令。

`.` 前麵也可以加數字，比如 `2.` 表示再執行兩次上一個命令。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

