# Vim 宏錄製

```
:help record
```

`q{0-9a-zA-Z"}` 開始錄製到寄存器 `{0-9a-zA-Z"}`

`q` 停止錄製。

### 例子

把下麵的函數返回值全部改為 `int`，並且給每行末尾加上分號。

```
void encrypt_text(char *text, int bytes)
void decrypt_text(char *text, int bytes)
void process_text(char *text, int bytes)
void another_important_function(int bytes, double precision)
```

1. 光標移動到第一行的最開頭。
2. `qa` 開始錄製到寄存器 `a`。
3. `cw` 刪除 `void` 並進入插入模式。
4. 輸入 `int`，然後按 `<Esc>` 返回普通模式。
5. `shift+a` 在第一行末尾進入插入模式。
6. 輸入 `;`，然後按 `<Esc>` 返回普通模式。
7. 按 `0` 返回第一行行首。
8. `q` 停止錄製。

1. 光標移動到第二行。
2. 輸入 `@a` 對第二行應用寄存器 `a` 中錄製的宏。
3. 光標移動到第三行。
4. 輸入 `@@` 對第三行應用上一次使用的宏。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

