# vim 打开、退出

## 打开 vim

```
vim
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_01.gif" alt="vim_1.1_open_01.gif" />
</details>

## 打开 file.txt

```
vim file.txt
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_02.gif" alt="vim_1.1_open_02.gif" />
</details>

## 打开多个文件

```
vim file1.txt file2.txt
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_03.gif" alt="vim_1.1_open_03.gif" />
</details>

## 以标签页的方式打开多个文件

```
vim -p file1.txt file2.txt
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_04.gif" alt="vim_1.1_open_04.gif" />
</details>

## 水平打开多个窗口

```
vim -o file1.txt file2.txt file3.txt ...
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_05.gif" alt="vim_1.1_open_05.gif" />
</details>

在不同的窗口之间移动光标可以使用 `ctrl+h,j,k,l`。
和窗口相关的其它知识点会在 [vim 窗口](README_vim_1.7_windows.md) 那一章介绍。

## 垂直打开多个窗口

```
vim -O file1.txt file2.txt file3.txt ...
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_05.gif" alt="vim_1.1_open_05.gif" />
</details>

## 对比文件

```
vim -d file1.txt file2.txt file3.txt ...
vimdiff file1.txt file2.txt file3.txt ...
```

详细见 [vimdiff](README_vim_2_vimdiff.md) 那一章。

## 退出 vim

```
:q
```

## 强制退出

如果修改了文件，不想保存

```
:q!
```

## 保存当前文件

```
:w
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_07.gif" alt="vim_1.1_open_07.gif" />
</details>

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

## 保存全部文件

```
:wa
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

`:q` 只是关闭当前窗口，`:qa` 可以把所有的窗口都关闭。

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

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_08.gif" alt="vim_1.1_open_08.gif" />
</details>

## 另存为

`:saveas newfilename.txt` 另存为 `newfilename.txt` 并开始编辑新的这个 `newfilename.txt`。

`:w newfilename.txt` 把当前文件另存一份副本 `newfilename.txt`，并继续编辑原文件。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.1_open_09.gif" alt="vim_1.1_open_09.gif" />
<img src="../../images/vim_1.1_open_10.gif" alt="vim_1.1_open_10.gif" />
</details>

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_02_how_to_use_this_document.mdmd)
>
> [下一章](README_vim_1.2_move_cursor.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

