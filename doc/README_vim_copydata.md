# vim,shell,tmux,浏览器之间互相复制数据

## vim 不同窗口之间互相复制

按 `v` 进入 VISUAL 模式，选择文本，按 `y` 复制，按 `p` 粘贴。

## 复制 vim 数据到 vim 的命令行模式

按 `v` 进入 VISUAL 模式，选择文本，按 `y` 复制

按 `:` 进入命令行模式，按 `ctrl+r shift+"` 粘贴数据到 `:` 后面。

## 复制 vim 数据到 vim 的搜索模式

按 `v` 进入 VISUAL 模式，选择文本，按 `y` 复制

按 `/` 进入搜索模式，按 `ctrl+r shift+"` 粘贴数据到 `/` 后面。

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

## 浏览器上复制粘贴

1. 通过 `PRIMARY` 剪切板，选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，`ctrl+c` 复制，`ctrl+v` 粘贴。

## 复制浏览器数据到 shell 终端

1. 通过 `PRIMARY` 剪切板，鼠标选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，`ctrl+c` 复制，`ctrl+shift+v` 或者 `shift+insert` 粘贴。

## 复制 shell 终端数据到浏览器

1. 通过 `PRIMARY` 剪切板，鼠标选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，鼠标选择文本，鼠标右键复制，`ctrl+v` 粘贴。

注意：在终端是不能使用 `ctrl+c` 来复制的，因为 `ctrl+c` 在终端是用来停止程序运行的。

## 复制浏览器数据到 tmux 终端

1. 无法通过 `PRIMARY` 剪切板。
2. 通过 `CLIPBOARD` 剪切板，`ctrl+c` 复制，`ctrl+shift+v` 或者 `shift+insert` 粘贴。

## 复制 tmux 终端数据到浏览器

1. `ctrl+b [` 进入复制模式，通过 hjkl 来上下左右移动光标。
2. 按空格开始复制，按回车结束复制。
3. `ctrl+b c` 复制。
4. 在浏览器中用 `ctrl+v` 粘贴。

## tmux 终端之间互相复制粘贴

1. `ctrl+b [` 进入复制模式，通过 hjkl 来上下左右移动光标。
2. 按空格开始复制，按回车结束复制。
3. `ctrl+b ]` 粘贴。

## 复制 vim 数据到浏览器

1. 通过 `PRIMARY` 剪切板，选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，`"+y` 复制，`ctrl+v` 粘贴。

注意：`"+y` 要怎么按？先按着 `shift` 键不放，然后按 `"` 键，再按 `+`
键，然后放开 `shift` 键，再按 `y` 键。

## 复制浏览器数据到 vim

1. 通过 `PRIMARY` 剪切板，选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，`ctrl+c` 复制，`"+p` 粘贴。

## 复制 vim 数据到 shell

1. 通过 `PRIMARY` 剪切板，选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，`"+y` 复制，`ctrl+shift+v` 或者 `shift+insert` 粘贴。

## 复制 shell 数据到 vim

1. 通过 `PRIMARY` 剪切板，选择文本，然后用鼠标中键粘贴。
2. 通过 `CLIPBOARD` 剪切板，鼠标选择文本，鼠标右键复制，`"+p` 粘贴。

## vim 和 tmux 之间互相复制数据

如果 vim 是在 tmux 中打开的，可以直接使用 [tmux 终端之间互相复制粘贴](#tmux 终端之间互相复制粘贴)。

在 vim 中粘贴的时候需要进入插入模式。

