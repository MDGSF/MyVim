# vim 修改文本

前面两章介绍的**光标移动**和**文本查找**都是在普通模式下进行的，
这一章介绍的修改文本需要在插入模式下进行。

在普通模式下按 `i` 就可以进入插入模式，在插入模式下可以输入文本。

按 `<Esc>` 可以回到普通模式，在普通模式下移动光标。

更多模式相关的见 [vim 模式](README_vim_2_mode.md)。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_22.gif" alt="vim_1.4_modify_22.gif" />
</details>

请多多练习这个操作，直到你熟悉了为止：按 `i` 进入插入模式，输入文本，
按 `<Esc>` 返回普通模式，移动光标位置。再按 `i` 进入插入模式....

## 删除光标所在的字符

在普通模式下，直接按 `x`，删除字符，并把删除掉的字符放到 vim 的缓冲区中。

```
x
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_01.gif" alt="vim_1.4_modify_01.gif" />
</details>

## 删除单词 de

从光标所在位置一直删除到光标所在的单词的最末尾。

如果光标位于单词的开头，就会删除整个单词。

```
de
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_02.gif" alt="vim_1.4_modify_02.gif" />
</details>

## 删除单词 dw

从光标所在位置一直删除到光标所在的单词下一个单词的最开头。

如果光标位于单词的开头，就会删除整个单词。

```
dw
```

`d3w` 删除 3 个连续的单词。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_03.gif" alt="vim_1.4_modify_03.gif" />
</details>

## 从光标所在位置删除到当前行末尾

```
d$
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_04.gif" alt="vim_1.4_modify_04.gif" />
</details>

## 从光标所在位置删除到文档末尾

```
d shift+G
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_05.gif" alt="vim_1.4_modify_05.gif" />
</details>

## 从光标所在位置删除到文档开头

```
dgg
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_06.gif" alt="vim_1.4_modify_06.gif" />
</details>

## 删除行

`dd` 删除当前行

`4dd` 删除 4 行

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_07.gif" alt="vim_1.4_modify_07.gif" />
</details>

## 删除括号中的内容，包括括号

```
d%
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_08.gif" alt="vim_1.4_modify_08.gif" />
</details>

## 复制

`yy` 复制当前行到缓冲区。

先按 `v` 进入 VISUAL 模式，选中文本，再按 `y` 可以复制指定
内容到缓冲区。

## 粘贴

`p` 粘贴缓冲区中的内容到光标所在位置后面。

`shift+P` 粘贴缓冲区中的内容到光标所在位置前面。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_09.gif" alt="vim_1.4_modify_09.gif" />
</details>

## 合并

`shift+J` 把光标所在行的下一行添加到当前行的末尾。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_10.gif" alt="vim_1.4_modify_10.gif" />
</details>

## 快速交换前后两个字符

```
xp
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_11.gif" alt="vim_1.4_modify_11.gif" />
</details>

## 快速交换上下两行

```
ddp
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_12.gif" alt="vim_1.4_modify_12.gif" />
</details>

## 修改光标所在的字母

`rx` 把光标所在的字母修改为 `x`。

`ra` 把光标所在的字母修改为 `a`。

`rb` 把光标所在的字母修改为 `b`。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_13.gif" alt="vim_1.4_modify_13.gif" />
</details>

## 删除光标所在位置直到单词末尾，并进入插入模式

```
ce
cw
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_14.gif" alt="vim_1.4_modify_14.gif" />
</details>

## 删除光标所在位置直到当前行末尾，并进入插入模式

```
c$
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_15.gif" alt="vim_1.4_modify_15.gif" />
</details>

## 大小写转换

`shift+~` 把光标所在的字母，大写变小写，小写变大写。
如果在 VISUAL 模式下选中了字符串，再按 `shift+~`，则会
把每个字母大小写互换。

`gu` 把选中的字符串转换为小写。

`gU` 把选中的字符串转换为大写。

`gU` 按键方式：先按一下 `g`，然后放开，再按 `shift+U`。

`guu` 把当前行全部变成小写。

`gUU` 把当前行全部变成大写。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_16.gif" alt="vim_1.4_modify_16.gif" />
</details>

## 删除每行末尾空白字符

```
:%s/\s\+$//e
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_17.gif" alt="vim_1.4_modify_17.gif" />
</details>

## 删除所有空行

```
:g/^$/d
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_18.gif" alt="vim_1.4_modify_18.gif" />
</details>

## 批量插入多行

1. `ctrl+v` 进入 `VISULA BLOCK` 模式。
2. `h,j,k,l` 方向键进行选择。
3. `shift+I` 插入。
4. `Esc` 插入完成。

这个可以用来注释多行代码。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_19.gif" alt="vim_1.4_modify_19.gif" />
</details>

## 批量删除多行

1. `ctrl+v` 进入 `VISULA BLOCK` 模式。
2. `h,j,k,l` 方向键进行选择。
3. `d` 将选中的部分全部删除。

这个可以将多行注释删除。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_20.gif" alt="vim_1.4_modify_20.gif" />
</details>

## 批量插入多行末尾

1. `ctrl+v` 进入 `VISULA BLOCK` 模式。
2. `h,j,k,l` 方向键进行选择。
3. `shift+$`。
3. `shift+A` 插入。
4. `Esc` 插入完成。

这个可以用来给每行加上句号。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_21.gif" alt="vim_1.4_modify_21.gif" />
</details>

## 取消

`u` 用来取消之前的操作。比如删除了太多了，用 `u` 来恢复。

## 重做

`ctrl+r` 用来重做被 `u` 取消掉的操作。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.4_modify_23.gif" alt="vim_1.4_modify_23.gif" />
</details>

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_vim_1.3_search.md)
>
> [下一章](README_vim_1.5_substitute.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

