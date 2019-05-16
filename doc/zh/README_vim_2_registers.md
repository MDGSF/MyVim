# Vim 寄存器

`:help registers` 查看寄存器相关帮助文档。

`:reg` 查看当前寄存器状态。

## 一共有 10 类寄存器

1. The unnamed register ""
2. 10 numbered registers "0 to "9
3. The small delete register "-
4. 26 named registers "a to "z or "A to "Z
5. three read-only registers ":, "., "%
6. alternate buffer register "#
7. the expression register "=
8. The selection and drop registers "*, "+ and "~
9. The black hole register "_
10. Last search pattern register "/

## Unnamed register

```
""
```

最近的一次复制或者删除操作（`d`, `c`, `s`, `x`, `y`），
数据都会保存到这个寄存器 `""` 中。

## Numbered registers

```
"0 to "9
```

一共 10 个数字寄存器。

寄存器 `"0` 保存最近一次复制的数据。

寄存器 `"1` 保存最近一次删除的数据。

每次删除的时候，寄存器 `"1` 的数据移动到寄存器 `"2`，
`"1` -> `"2`, `"2` -> `"3`, ...,  `"8` -> `"9`，
然后寄存器 `"9` 的数据丢弃。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_2_registers_01.gif" alt="vim_2_registers_01.gif" />
</details>

## Small delete register

```
"-
```

行内删除的数据会被保存到寄存器 `"-` 中。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_2_registers_02.gif" alt="vim_2_registers_02.gif" />
</details>

## Named registers

```
"a to "z
"A to "Z
```

一共 26 个字母寄存器，这是给我们用户使用的。

小写字母将文本存储到寄存器中。

大写字母将文本添加到寄存器末尾。

`"aY` 将当前行存储到寄存器 `"a` 中，而 `"AY` 将当前行添加到寄存器 `"a` 的末尾。

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_2_registers_03.gif" alt="vim_2_registers_03.gif" />
</details>

## Selection registers

```
"*
"+
```

这两个是剪切板寄存器。

详细见 [vim,shell,tmux,浏览器之间互相复制数据](README_vim_2_copydata.md)

## Last search pattern register

```
"/
```

当你通过 `/` 或者 `?` 之类的命令执行了搜索，搜索的文本就会被保存到该寄存器。

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

