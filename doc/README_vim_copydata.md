# vim 复制数据

## vim 不同窗口之间互相复制

## 复制 vim 数据到命令行模式

## 复制 vim 数据到搜索模式

## 操作系统剪切板

[How can I copy text to the system clipboard from Vim?](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim)

大部分的 Linux 和 UNIX-like 操作系统都有两个独立的剪切板：

**PRIMARY 剪切板**：

这个剪切板你只要用鼠标选中了文本，就会被自动复制到这个剪切板中（叫 copy-on-select），然后用鼠标的中键就可以复制。

在 vim 中，你只要在 VISUAL 模式下选中了文本，也会自动复制到这个剪切板中。

这个剪切板不是很好用，因为你鼠标一不小心就选中了其他的文本，剪切板中的内容就改变了。

**CLIPBOARD 剪切板**：

`ctrl+c` 用来复制

`ctrl+v` 用来粘贴

**OS X** 和 **Windows** 操作系统只有一个剪切板，就是 **CLIPBOARD**。

vim 有两个特殊的寄存器对应着这两个剪切板：

`*` 对应着 `PRIMARY` 剪切板

`+` 对应着 `CLIPBOARD` 剪切板

```
"*y 复制数据到 PRIMARY 剪切板，其实选中了就复制了，根本用不着这个
"*p 粘贴 PRIMARY 剪切板的数据
"+y 复制数据到 CLIPBOARD 剪切板
"+p 粘贴 CLIPBOARD 剪切板的数据
```

## 复制 vim 数据到操作系统剪切板

## 复制操作系统剪切板数据到 vim

## 复制 vim 数据到 shell

## 复制 shell 数据到 vim

