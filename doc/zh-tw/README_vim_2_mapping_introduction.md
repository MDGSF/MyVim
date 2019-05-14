# vim 映射介紹

|   遞歸   |   非遞歸     |   取消映射   | 模式                                     |
| -------- | ------------ | ------------ | ---------------------------------------- |
| `:map`   | `:noremap`   | `:unmap`     | Normal, Visual, Select, Operator-pending |
| `:nmap`  | `:nnoremap`  | `:nunmap`    | Normal                                   |
| `:vmap`  | `:vnoremap`  | `:vunmap`    | Visual and Select                        |
| `:smap`  | `:snoremap`  | `:sunmap`    | Select                                   |
| `:xmap`  | `:xnoremap`  | `:xunmap`    | Visual                                   |
| `:omap`  | `:onoremap`  | `:ounmap`    | Operator-pending                         |
| `:map!`  | `:noremap!`  | `:unmap!`    | Insert and Commnad-line                  |
| `:imap`  | `:inoremap`  | `:iunmap`    | Insert                                   |
| `:lmap`  | `:lnoremap`  | `:lunmap`    | Insert, Command-line, Lang-Arg           |
| `:cmap`  | `:cnoremap`  | `:cunmap`    | Command-line                             |
| `:tmap`  | `:tnoremap`  | `:tunmap`    | Terminal-Job                             |

### 建立取消映射

```
:nmap a i    把 a 映射為 i
:nunmap a    取消映射 a
```

### 遞歸與非遞歸的區彆

```
:nmap b i
:nmap a b
```

上麵的遞歸版本會將 `a` 和 `b` 都映射為 `i`，都是進入插入模式。

```
:nmap b i
:nnoremap a b
```

上麵的非遞歸版本會將 `b` 映射為 `i`，可以使用 `b` 來進入插入模式。
而將 `a` 映射為 `b`，跳轉到上一個單詞。

### 查看映射

`:cmap` 查看命令行模式下的映射。

`:nmap` 查看普通模式下的映射。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

