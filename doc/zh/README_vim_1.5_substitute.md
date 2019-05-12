# vim 替换文本

把 `old` 替换为 `new`

```
:s/old/new/g
```

## 替换光标所在行的第一个 `old` 字符串

```
:s/old/new
```

## 替换光标所在行的所有 `old` 字符串

```
:s/old/new/g
```

## 替换指定行的所有 `old` 字符串

下面的两个 `#` 分别代表起始行和结束行

```
:#,#s/old/new/g
```

## 替换文档中的所有 `old` 字符串

```
:%s/old/new/g
```

## 替换文档中的所有 `old` 字符串

每一个替换都需要确认

```
:%s/old/new/gc
```

确认选项：

```
y: 替换这个匹配
n: 跳过这个匹配
a: 替换当前到文档末尾的所有匹配
q: 退出替换
l: 替换当前匹配，然后退出替换
```

## 替换时区分大小写

```
:%s/old/new/gcI
```

也可以先执行下 `:set noignorecase`

## 替换时不区分大小写

```
:%s/old/new/gci
```

也可以先执行下 `:set ignorecase`

在 `old` 后面加上 `\c` 也可以忽略大小写。

```
:%s/old\c/new/gc
```

## 替换时搜索完整单词

```
:%s/\<old\>/new/gc
```

* * *

按 `gg` 回到文档顶部。

将光标移动到下面的文件名上，执行 `gf` 跳转。

[目录](README.md)

[上一章](README_vim_1.4_modify.md)

[下一章](README_vim_1.4_modify.md)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

