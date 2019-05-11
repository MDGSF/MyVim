# vim 打开、退出

## 打开 vim

```
vim
```

## 打开 file.txt

```
vim file.txt
```

## 打开多个文件

```
vim file1.txt file2.txt
```

## 以标签页的方式打开多个文件

```
vim -p file1.txt file2.txt
```

## 水平打开多个窗口

```
vim -o file1.txt file2.txt file3.txt ...
```

## 垂直打开多个窗口

```
vim -O file1.txt file2.txt file3.txt ...
```

## 对比文件

```
vim -d file1.txt file2.txt file3.txt ...
vimdiff file1.txt file2.txt file3.txt ...
```

## 退出 vim

```
:q
```

## 强制退出

如果修改了文件，不想保存

```
:q!
```

## 保存

```
:w
```

## 强制保存

```
:w!
```

`<leader>w` 也可以保存，在配置文件中增加映射。

```
nmap <leader>w :w!<cr>
```

## 以超级用户身份保存

```
:W （大写字母W）
```

需要在配置中增加映射。

```
command W w !sudo tee % > /dev/null
```

## 保存并退出

```
:wq
```

## 保存内容到 filename.txt 并退出

```
:wq filename.txt
```

## 退出多个文件

```
:qa
```

## 强制退出多个文件

```
:qa!
```

## 优雅的退出

如果文件有修改，则先保存之后，再退出。

如果文件没有修改，则直接退出。

```
:x
```

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

