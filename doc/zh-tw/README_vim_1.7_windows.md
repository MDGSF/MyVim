# vim 窗口

## 水平新增一個窗口

```
:help split
:[N]sp[lit] [++opt] [+cmd] [file]
:sp
:split
```

## 垂直新增一個窗口

```
:[N]vs[plit] [++opt] [+cmd] [file]
:vsplit
:vs
```

## 水平新增一個空白窗口

```
:[N]new [++opt] [+cmd]
:new
```

## 垂直新增一個空白窗口

```
:[N]vne[w] [++opt] [+cmd] [file]
:vne
:vnew
```

## 交換左右兩個窗口

```
ctrl+w+x
```

## 光標在不同的窗口之間切換

```
ctrl+w+w
```

## 光標快速在不同窗口之間切換

分彆是上下左右四個方向。

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

## 調整窗口大小

### 方法一

直接用鼠標拖動，這個最簡單。

### 方法二

`ctrl+w -` 將當前窗口高度減小一行。

`ctrl+w -` 要怎麼按？先按 `ctrl+w`，然後放開 `ctrl`，再按 `-`。

**注意：**Ubuntu 下 `ctrl -` 會縮小整個終端，要用 `ctrl shift +` 來放大。

```
CTRL-W [N] -	減少當前窗口高度 N 行 (N 默認為 1)
CTRL-W [N] +	增加當前窗口高度 N 行 (N 默認為 1)
CTRL-W [N] <	減少當前窗口寬度 N 行 (N 默認為 1)
CTRL-W [N} >	增加當前窗口寬度 N 行 (N 默認為 1)
```

### 方法三

```
:resize -10   高度大小減10
:resize +10   高度大小加10
:resize 10    高度大小設置為10

:vertical resize -10   寬度大小減10
:vertical resize +10   寬度大小加10
:vertical resize 10    寬度大小設置為10
```

### 其他

`ctrl+w =` 將每個窗口的大小設置為一樣

`ctrl+w shift+-` 將當前水平窗口最大化

`ctrl+w shift+|` 將當前垂直窗口最大化

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.6_tab.md)
>
> [下一章](README_vim_1.8_buffer.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

