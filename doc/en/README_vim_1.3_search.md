# vim 查找文本

## 查找光标所在的单词

`shift+*` 向下查找完整的单词，`/\<keyword\>`。

`shift+#` 向上查找完整的单词

`g*` 按键方式 `g shift+*`，向下查找，可以是其他单词的一部分，`/keyword`。

`g#` 按键方式 `g shift+#`，向上查找，可以是其他单词的一部分。

`gd` 和 `*` 查找类似，不过会尝试略过注释，不过应该不会真的去分析语法，可能对于 C
语言支持的比较好，其他的文件的话，使用起来应该就和 `*` 是差不多的，而 `*` 就
只是单纯的文本查找。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_01.gif" alt="vim_1.3_search_01.gif" />
</details>

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_02.gif" alt="vim_1.3_search_02.gif" />
</details>

## 向下查找

直接按 `/`，然后输入要查找的字符串。

```
/searchstring
```

然后按 `n` 不断向下查找，按 `shift+n` 向上查找。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_03.gif" alt="vim_1.3_search_03.gif" />
</details>

## 向上查找

直接按 `?`，然后输入要查找的字符串。

```
?searchstring
```

然后按 `n` 不断向上查找，按 `shift+n` 向下查找。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_04.gif" alt="vim_1.3_search_04.gif" />
</details>

## 查找选中的字符串

### 方法一

按 `v` 进入 `VISUAL` 模式，然后选择字符串，按 `y` 复制。

然后按 `/` 进入搜索模式。

按 `ctrl+r shift+"` 粘贴缓冲区的内容到搜索区域。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_05.gif" alt="vim_1.3_search_05.gif" />
</details>

### 方法二

选择好字符串之后，直接按 `*` 向下查找，按 `#` 向上查找。

需要在配置文件中增加如下配置：

```
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_06.gif" alt="vim_1.3_search_06.gif" />
</details>

## 查找时区分大小写

```
:set noignorecase
```

## 查找时不区分大小写

```
:set ignorecase
```

或者在要查找的字符串后面加上 `\c` 也是可以的：

```
/searchstring\c
```

## 查找完整单词

```
/\<searchstring\>
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_07.gif" alt="vim_1.3_search_07.gif" />
</details>

## 取消查找之后的高亮

很多时候，在查找到你想要的位置之后，就不需要高亮了。

这时候就可以通过 `:noh` 取消高亮。

还可以通过 `先按逗号，再按回车` 来取消掉高亮。
这个需要在配置文件中加上如下映射：

```
map <silent> <leader><cr> :noh<cr>
```

还有一种方法可以取消高亮，那就是随便搜索一个不存在的字符串，我估计应该也有人这么使用。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_1.3_search_08.gif" alt="vim_1.3_search_08.gif" />
</details>

## f 和 F 单行搜索命令

`f` 是向后查找，`F` 是向前查找。

`fs` 在光标所在行搜索字母 `s`。

`fa` 在光标所在行搜索字母 `a`。

`f1` 在光标所在行搜索数字 `1`。

`f2` 在光标所在行搜索数字 `2`。

## 重复 f 搜索命令

第一次使用 `f` 来搜索之后，相同的查找就可以使用分号 `;`。

`;` 是继续向当前方向查找下一个字母。

`,` 是向当前相反方向查找。

## t 和 T 单行搜索命令

`t` 和 `f` 几乎相同，`f` 在查找到字母之后，光标会定位在查找到的字母上，
而 `t` 会把光标定位在查找到的字母的前一个字母上。

那 `t` 查找有什么用呢？

`yt,` 可以从光标所在位置一直复制到逗号，但是不包括逗号。

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_vim_1.2_move_cursor.md)
>
> [下一章](README_vim_1.4_modify.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

