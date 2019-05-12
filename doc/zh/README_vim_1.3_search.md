# vim 查找文本

## 向下查找光标所在的单词

```
shift+*
```

## 向上查找光标所在的单词

```
shift+#
```

## 向下查找

直接按 `/`，然后输入要查找的字符串。

```
/searchstring
```

然后按 `n` 不断向下查找，按 `shift+n` 向上查找。

## 向上查找

直接按 `?`，然后输入要查找的字符串。

```
?searchstring
```

然后按 `n` 不断向上查找，按 `shift+n` 向下查找。

## 查找选中的字符串

### 方法一

按 `v` 进入 `VISUAL` 模式，然后选择字符串，按 `y` 复制。

然后按 `/` 进入搜索模式。

按 `ctrl+r shift+"` 粘贴缓冲区的内容到搜索区域。

### 方法二

选择好字符串之后，直接按 `*` 向下查找，按 `#` 向上查找。

需要在配置文件中增加如下配置：

```
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
```

## f 和 F 单行搜索命令

`f` 是向后查找，`F` 是向前查找。

`fs` 在光标所在行搜索字母 `s`。

`fa` 在光标所在行搜索字母 `a`。

`f1` 在光标所在行搜索数字 `1`。

`f2` 在光标所在行搜索数字 `2`。

## 重复 f 搜索命令

第一次使用 `f` 来搜索之后，相同的查找就可以使用分号 `;`。

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

## 取消查找之后的高亮

很多时候，在查找到你想要的位置之后，就不需要高亮了。

这时候就可以通过 `先按逗号，再按回车` 来取消掉高亮。

需要在配置文件中加上如下映射：

```
map <silent> <leader><cr> :noh<cr>
```

* * *

按 `gg` 回到文档顶部。

将光标移动到下面的文件名上，执行 `gf` 跳转。

[目录](README.md)

[上一章](README_vim_1.2_move_cursor.md)

[下一章](README_vim_1.3_search.md)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

