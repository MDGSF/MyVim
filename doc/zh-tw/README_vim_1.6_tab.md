# vim 標簽頁介紹

## 在多個標簽頁中打開多個文件

```
vim -p file1 file2 file3
```

## 新建一個標簽頁

```
:help :tabnew
:[count]tabe[dit]
:[count]tabnew
:[count]tabnew {file}
```

```
:tabnew    在當前標簽頁後麵新建一個新的標簽頁
:+tabnew   在當前標簽頁的下一個標簽頁後麵新建一個新的標簽頁
:-tabnew   在當前標簽頁前麵新建一個新的標簽頁
:0tabnew   在最左邊建立一個新的標簽頁
:$tabnew   在最右邊建立一個新的標簽頁
```

添加映射 `map <leader>ti :tabnew<cr>` 之後，可以使用 `,ti`。

`:tabedit file1` 在新的標簽頁中打開 `file1` 文件。

`:tabnew file2` 在新的標簽頁中打開 `file2` 文件。

## 查看所有的標簽頁

```
:tabs
```

## 關閉除了當前標簽頁之外的所有標簽頁

```
:help :tabonly
:tabo[nly][!]
:{count}tabo[nly][!]
```

```
:tabonly    關閉除了當前標簽頁之外的所有標簽頁
:-tabonly   關閉除了當前標簽頁的前一個標簽頁之外的所有標簽頁
:+tabonly   關閉除了當前標簽頁的後一個標簽頁之外的所有標簽頁
:1tabonly   關閉除了第一個標簽頁之外的所有標簽頁
:$tabonly   關閉除了最後一個標簽頁之外的所有標簽頁
```

添加映射 `map <leader>to :tabonly<cr>` 之後，可以使用 `,to`。

## 關閉當前標簽頁

```
:help :tabclose
:tabc[lose][!]
:{count}tabc[lose][!]
:tabc[lose][!] {count}
```

```
:tabclose    關閉當前標簽頁
:-tabclose   關閉前一個標簽頁
:+tabclose   關閉後一個標簽頁
:1tabclose   關閉第一個標簽頁
:$tabclose   關閉最後一個標簽頁
```

添加映射 `map <leader>tc :tabclose<cr>` 之後，可以使用 `,tc`。

## 移動到下一個標簽頁

```
:tabn[ext] {count}
{count}gt
```

`gt` 跳轉到下一個標簽頁。

`2gt` 跳轉到第 2 個標簽頁。

`3gt` 跳轉到第 3 個標簽頁。

添加映射 `map <leader>tn :tabnext<cr>` 之後，可以使用 `,tn`。

## 移動到上一個標簽頁

```
:tabp[revious]
:tabN[ext]
gT
```

添加映射 `map <leader>tp :tabprev<cr>` 之後，可以使用 `,tp`。

## 移動到第一個標簽頁

```
:tabr[ewind]
:tabfir[st]
```

## 移動到最後一個標簽頁

```
:tabl[ast]
```

## 移動當前標簽頁

```
:tabm[ove] [N]
:[N]tabm[ove]
```

移動當前標簽頁到第 `N` 個標簽頁之後。

```
:-tabmove    當前標簽頁左移
:+tabmove    當前標簽頁右移

:0tabmove    當前標簽頁移動到最左邊
:tabmove 0   當前標簽頁移動到最左邊

:tabmove     當前標簽頁移動到最右邊
:$tabmove    當前標簽頁移動到最右邊
:tabmove $   當前標簽頁移動到最右邊
```

添加映射 `map <leader>tm :tabmove` 之後，可以使用 `,tm`。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.5_substitute.md)
>
> [下一章](README_vim_1.7_windows.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

