# Vim 如何使用幫助文檔

## 打開幫助文檔

```
:help
```

`:help usr_02.txt` 打開幫助文檔 `usr_02.txt`。

在幫助文檔中，高亮的單詞是超鏈接，把光標移動到上麵，
然後可以使用 `ctrl+]` 跳轉，使用 `ctrl+o` 跳轉回來。

## 查看特定主題幫助文檔

```
:help {subject}
```

> * `:help x` 獲取命令 `x` 的幫助文檔。
> * `:help deleting` 獲取如何刪除文本命令。

## 查看啟動參數

> * `:help arguments` 獲取啟動 vim 時的參數文檔。
> * `:help -t` 查看 `-t` 參數。

## 查看不同模式下的命令

要查看插入模式下的命令，需要加前綴 `i_`

> * `:help CTRL-H` 查看普通模式下的命令 `CTRL-H`
> * `:help i_CTRL-H` 查看插入模式下的命令 `CTRL-H`

`:help index`  查看不同模式下的所有命令。

## 查看配置參數(options)

需要使用單引號

`:help 'number'` 查看行號相關文檔。

`:help options.txt` 打開配置相關文檔。

## 查看特殊按鍵

需要用尖括號

`:help i_<Up>` 查看插入模式下的向上鍵。

`:help key-notation` 查看常見的特殊按鍵。

## 查看錯誤信息

```
E37: No write since last change (use ! to override)
```

可以使用 `:help E37` 來查看錯誤 `E37` 的詳細信息。

## 其他

`:help pattern.txt` 打開模式匹配相關文檔。

`:help registers` 查看寄存器相關文檔。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.8_buffer.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

