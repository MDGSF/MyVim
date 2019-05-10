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

