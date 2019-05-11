# vim 窗口

## 水平新增一个窗口

```
:help split
:[N]sp[lit] [++opt] [+cmd] [file]
:sp
:split
```

## 垂直新增一个窗口

```
:[N]vs[plit] [++opt] [+cmd] [file]
:vsplit
:vs
```

## 水平新增一个空白窗口

```
:[N]new [++opt] [+cmd]
:new
```

## 垂直新增一个空白窗口

```
:[N]vne[w] [++opt] [+cmd] [file]
:vne
:vnew
```

## 交换左右两个窗口

```
ctrl+w+x
```

## 光标在不同的窗口之间切换

```
ctrl+w+w
```

## 光标快速在不同窗口之间切换

分别是上下左右四个方向。

```
ctrl+h
ctrl+j
ctrl+k
ctrl+l
```

需要在配置文件中增加映射：

```
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
```

## 调整窗口大小

### 方法一

直接用鼠标拖动，这个最简单。

### 方法二

`ctrl+w -` 将当前窗口高度减小一行。

`ctrl+w -` 要怎么按？先按 `ctrl+w`，然后放开 `ctrl`，再按 `-`。

**注意：**Ubuntu 下 `ctrl -` 会缩小整个终端，要用 `ctrl shift +` 来放大。

```
CTRL-W [N] -	减少当前窗口高度 N 行 (N 默认为 1)
CTRL-W [N] +	增加当前窗口高度 N 行 (N 默认为 1)
CTRL-W [N] <	减少当前窗口宽度 N 行 (N 默认为 1)
CTRL-W [N} >	增加当前窗口宽度 N 行 (N 默认为 1)
```

### 方法三

```
:resize -10   高度大小减10
:resize +10   高度大小加10
:resize 10    高度大小设置为10

:vertical resize -10   宽度大小减10
:vertical resize +10   宽度大小加10
:vertical resize 10    宽度大小设置为10
```

### 其他

`ctrl+w =` 将每个窗口的大小设置为一样

`ctrl+w shift+-` 将当前水平窗口最大化

`ctrl+w shift+|` 将当前垂直窗口最大化

* * *

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

