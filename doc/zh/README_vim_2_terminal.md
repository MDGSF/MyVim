# Vim 集成终端

在 `vim 8` 中集成了一个终端。

```
:help terminal
```

## 水平打开终端

```
:[range]ter[minal] [options] [command]
:ter
:terminal
```

## 垂直打开终端

```
:vertical terminal
:vert ter
```

## 退出终端

```
exit
ctrl+D
```

## 在不同窗口之间切换

```
ctrl+w w
ctrl+w h,j,k,l
```

添加映射之后可以使用：

```
ctrl+h,j,k,l
```

## 终端下切换到命令行模式

```
ctrl+w shift+:
```

## 终端下的两种模式

```
:help Terminal-mode
```

终端有两种模式：

1. Terminal-Job
2. Terminal-Normal

终端打开时默认为 `Terminal-Job` 模式，
按 `ctrl+w shift+n` 切换为 `Terminal-Normal` 模式。

`Terminal-Normal` 模式下按 `i` 或者 `a` 切换为 `Terminal-Job` 模式。

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

