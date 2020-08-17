# vim 映射介绍

|   递归   |   非递归     |   取消映射   | 模式                                     |
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
:nmap a i    把 a 映射为 i
:nunmap a    取消映射 a
```

### 递归与非递归的区别

```
:nmap b i
:nmap a b
```

上面的递归版本会将 `a` 和 `b` 都映射为 `i`，都是进入插入模式。

```
:nmap b i
:nnoremap a b
```

上面的非递归版本会将 `b` 映射为 `i`，可以使用 `b` 来进入插入模式。
而将 `a` 映射为 `b`，跳转到上一个单词。

### 查看映射

`:cmap` 查看命令行模式下的映射。

`:nmap` 查看普通模式下的映射。

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

