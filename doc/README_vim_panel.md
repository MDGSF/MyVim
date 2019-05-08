# vim 窗口

## 水平新增一个窗口

```
:split
```

## 垂直新增一个窗口

```
:vsplit
:vs
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

