# vim 移动光标

如果你已经熟悉本章内容，可以按 `shift+G` 移动光标到文档底部进入下一章。

掌握了这一章的内容之后，就可以直接使用 vim 来阅读剩下的所有文档了。

移动光标时，vim 需要处于普通模式，看下左下角，如果有显示 `NORMAL`
说明就是普通模式，如果不是的话，只要按 `<Esc>` 键就会回到普通模式。
更多关于模式的知识点将在 [vim 模式](README_vim_2_mode.md) 那一章介绍。

## 上下左右移动光标

```
h, j, k, l
```

* h 光标向左移动一个字符
* j 光标向下移动一行
* k 光标向上移动一行
* l 光标向右移动一个字符

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_01.gif" alt="vim_1.2_move_cursor_01.gif" />
</details>

这 4 个按键将是你使用 vim 过程中使用得最多的 4 个键了，非常重要。
当然，你也可以使用方向键来移动光标，但是那实在是太慢了。

## 快速上下移动光标

```
ctrl+u
ctrl+d
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_02.gif" alt="vim_1.2_move_cursor_02.gif" />
</details>

## 光标移动到行首

```
:help 0    查看帮助文档
0          移动光标到当前行的第一个字符
<Home>     移动光标到当前行的第一个字符
shift+^    移动光标到当前行的第一个非空白字符
shift+B
```

`shift+B` 是在配置文件中添加了映射。

```
nnoremap B ^
```

## 光标移动到行末尾

```
shift+$
shift+E
```

`shift+E` 是在配置文件中添加了映射。

```
nnoremap E $
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_03.gif" alt="vim_1.2_move_cursor_03.gif" />
</details>

## 光标移动到最开头

```
gg
```

## 光标移动到最末尾

```
shift+G
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_04.gif" alt="vim_1.2_move_cursor_04.gif" />
</details>

## 光标移动到指定行

`:100 enter` 跳转到第 100 行

`100 shift+G` 跳转到第 100 行

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_05.gif" alt="vim_1.2_move_cursor_05.gif" />
</details>

## 查看当前处于第几行、第几列

```
ctrl+G
```

## 移动到下一个单词的开头

```
w
```

## 移动到单词的末尾

如果光标处于一个单词的末尾，`e` 就会把光标移动到下一个单词的末尾。

否则光标就会移动到当前单词的末尾。

```
e
```

## 移动到上一个单词的开头

如果光标处于一个单词的开头，`b` 就会把光标移动到上一个单词的开头。

否则光标就会移动到当前单词的开头。

```
b
```

## 把光标所在的行移动到屏幕正中间

```
zz
```

## 把光标所在的行移动到屏幕最上方

```
zt
```

## 把光标所在的行移动到屏幕最下方

```
zb
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_06.gif" alt="vim_1.2_move_cursor_06.gif" />
</details>

## 在括号之间跳转光标

如果光标处于括号上 `(), [], {}`，用 `%` 可以将光标移动到对应的另一半括号上。

> 你可以在下面代码上的 (),[],{} 字符上按 % 看看效果，多按几次直到你熟悉它为止。

```
func main() {
	num := ((1 + 2) * (4 - 3)) / 3
	fmt.Println("vim-go, num =", num)
}
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_07.gif" alt="vim_1.2_move_cursor_07.gif" />
</details>

## 移动光标到花括号

如果光标处于花括号中间，可以使用 `[{` 来跳转到 `{`，
可以使用 `]}` 来跳转到 `}`。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.2_move_cursor_08.gif" alt="vim_1.2_move_cursor_08.gif" />
</details>

## 移动光标到之前所在的位置

```
ctrl+o （小写字母o）
```

## 光标向后移动 2 个单词

```
2w
```

## 光标向后移动 3 个单词

```
3e
```

## 光标向下移动 10 行

```
10j
```

## 光标向上移动 10 行

```
10k
```

**注意：** 在命令前面加上数字 `N` 表示执行这个命令 `N` 次。

**最后，在进入下一章之前，请确保已经熟悉了本章的操作。
如果觉得操作还不太习惯，那就在该文档中多执行几次。**

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_vim_1.1_open_close.md)
>
> [下一章](README_vim_1.3_search.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

