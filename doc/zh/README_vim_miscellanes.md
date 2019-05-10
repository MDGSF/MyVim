# vim 其他注意点

## Esc

`Esc` 可以用来从不同的模式回到普通模式。

`Esc` 也可以终止输入了一半的命令。

当你不知道自己处于什么状态的时候，就按 `Esc` 键。

## 取消 undo

```
u
```

## 重做 redo

```
ctrl+r
```

### 不小心按了 ctrl+s，结果卡死了

这个其实和 vim 没有关系，`ctrl+s` 是让 linux 终端暂停的命令。

用 `ctrl+q` 就可以恢复了。

如果你在查看服务器滚动的日志的时候，就可以使用 `ctrl+s`
来让日志暂停下，方便查看。

## 把 vim 进程放到后台

在 `vim` 的编辑界面按 `ctrl+z`，会进入 `shell` 界面。

可以使用 `jobs` 来查看。

使用 `fg` 来恢复 `vim` 界面。

如果用 `jobs` 查看有多个后台进程，
在 `bash` 中可以使用 `fg + number` 来恢复，
在 `zsh` 中可以使用 `fg + %number` 来恢复。

`number` 就是数字 1，2，3...

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>
