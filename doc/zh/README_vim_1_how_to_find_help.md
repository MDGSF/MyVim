# Vim 如何使用帮助文档

## 打开帮助文档

```
:help
```

`:help usr_02.txt` 打开帮助文档 `usr_02.txt`。

在帮助文档中，高亮的单词是超链接，把光标移动到上面，
然后可以使用 `ctrl+]` 跳转，使用 `ctrl+o` 跳转回来。

## 查看特定主题帮助文档

```
:help {subject}
```

> * `:help x` 获取命令 `x` 的帮助文档。
> * `:help deleting` 获取如何删除文本命令。

## 查看启动参数

> * `:help arguments` 获取启动 vim 时的参数文档。
> * `:help -t` 查看 `-t` 参数。

## 查看不同模式下的命令

要查看插入模式下的命令，需要加前缀 `i_`

> * `:help CTRL-H` 查看普通模式下的命令 `CTRL-H`
> * `:help i_CTRL-H` 查看插入模式下的命令 `CTRL-H`

`:help index`  查看不同模式下的所有命令。

## 查看配置参数(options)

需要使用单引号

`:help 'number'` 查看行号相关文档。

`:help options.txt` 打开配置相关文档。

## 查看特殊按键

需要用尖括号

`:help i_<Up>` 查看插入模式下的向上键。

`:help key-notation` 查看常见的特殊按键。

## 查看错误信息

```
E37: No write since last change (use ! to override)
```

可以使用 `:help E37` 来查看错误 `E37` 的详细信息。

## 其他

`:help pattern.txt` 打开模式匹配相关文档。

`:help registers` 查看寄存器相关文档。

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_vim_1.8_buffer.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

