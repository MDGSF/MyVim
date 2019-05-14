# Vim 集成終端

在 `vim 8` 中集成了一個終端。

```
:help terminal
```

## 水平打開終端

```
:[range]ter[minal] [options] [command]
:ter
:terminal
```

## 垂直打開終端

```
:vertical terminal
:vert ter
```

## 退出終端

```
exit
ctrl+D
```

## 在不同窗口之間切換

```
ctrl+w w
ctrl+w h,j,k,l
```

添加映射之後可以使用：

```
ctrl+h,j,k,l
```

## 終端下切換到命令行模式

```
ctrl+w shift+:
```

## 終端下的兩種模式

```
:help Terminal-mode
```

終端有兩種模式：

1. Terminal-Job
2. Terminal-Normal

終端打開時默認為 `Terminal-Job` 模式，
按 `ctrl+w shift+n` 切換為 `Terminal-Normal` 模式。

`Terminal-Normal` 模式下按 `i` 或者 `a` 切換為 `Terminal-Job` 模式。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

