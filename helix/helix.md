# helix

<https://helix-editor.com/>

配置文件 `~/.config/helix/config.toml`，也可以用 `:config-open` 来打开。
配置文件也可以单独放在项目里面：`${project}/.helix/config.toml`。

语言配置文件 `~/.config/helix/languages.toml` 或者是 `${project}/.helix/languages.toml`。

默认的 runtime 目录 `~/.config/helix/runtime`，可以从 github 的 release 上面下载，
然后放到这个目录下面。也可以通过 `export HELIX_RUNTIME=~/path/to/runtime` 来设置。

## 常用操作

### open and quit

```sh
# save file
:w
# quit helix
:q
# force quit
:q!
```

### open tutor

```sh
:tutor
```

### move cursor

```sh
hjkl # cursor move left down up right

gg # cursor jump to file start
ge # cursor jump to file end
gs # cursor jump to line start
gl # cursor jump to line end
w # cursor move to next word end.
b # cursor move to prev word start.

ctrl+d # move cursor down quickly
ctrl+u # move cursor up quickly
```

### open multi file

```sh
<space> + f # open file picker
<space> + shift + F # open file picker at current working directory
<space> b # open buffer picker
```

### mode change

```sh
<Esc> # enter normal mode

i # enter insert mode, insert before cursor
a # enter insert mode, insert after cursor
o # enter insert mode, begin a new line below current line
shift+O # enter insert mode, begin a new line above current line

v # enter selection mode
x # select cursor line
```

### others

```sh
zz # move cursor line to window's middle

d # used to delete
u # undo
```

