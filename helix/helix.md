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
# open file
hx <filename>
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
w # cursor move forward to before the beginning of the next word.
e # cursor move forward to the end of the current word.
b # cursor move backward to the beginning of the current word.

ctrl+d # scroll down
ctrl+u # scroll up

ctrl+o # cursor jump to previous position
```

### open multi file

```sh
<space> + f # open file picker
<space> + shift + F # open file picker at current working directory
<space> b # open buffer picker
:bp # switch to next buffer
```

### mode change

```sh
# normal mode
# key is `<Esc>`

# Insert mode
i # enter insert mode, insert before cursor
a # enter insert mode, insert after cursor
o # enter insert mode, add a new line below current line
shift+O # enter insert mode, add a new line above current line
shift+I # enter insert mode, insert at the start of the line
shift+A # enter insert mode, insert at the end of the line

# view mode
# key is `z`

# Select mode
v # enter selection mode
x # select cursor line
; # deselect, cancel selected text without moving cursor

# match mode
# key is `m`

# command mode
# key is `:`

# window mode
# key is `ctrl+w`

# space mode
# key is `<space>`

# goto mode
# key is `g`
```

### split window

```sh
# vertical split
:vsplit (:vs)
:split-new (:vnew)
# horizontal split
:hsplit (:hs,:sp)
:hsplit-new (:hnew)

ctrl+w ctrl+w # Jump to next window
ctrl+w ctrl+h # Jump to left split
ctrl+w ctrl+l # Jump to right split
ctrl+w ctrl+k # Jump to above split
ctrl+w ctrl+j # Jump to below split
```

### search in file

```sh
/ # search forward
? # search backward
n # go to next search match
N # go to previous search match
```

### multi cursor

```sh
C # duplicate cursor
, # remove the second cursor
```

### search in selection

```sh
# after select text
s # can be used to search in selected text
```

### format

```sh
# format code manually
:format
```

### others

```sh
zz # align view center

# 1. delete the character at the cursor
# 2. delete all selected text
d 

c # change the current selection

u # undo
shift+U # redo

y # copy
p # paste
<space> + y # copy to system clipboard
<space> + p # paste from system clipboard

# show current filename
: ctrl+r shift+%
```

