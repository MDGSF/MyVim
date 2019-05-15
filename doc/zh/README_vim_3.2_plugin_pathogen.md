# 插件 vim-pathogen

[vim-pathogen 官网](https://github.com/tpope/vim-pathogen)

插件 `pathogen` 其实只是管理了 vim 的 `runtimepath`。

`runtimepath` 是一系列的目录，vim 会自动到 `runtimepath`
定义的目录下面去查找插件。可以使用 `:help runtimepath` 查看。

在 Linux 下面，`runtimepath` 默认的目录如下：

```
$HOME/.vim
$VIM/vimfiles
$VIMRUNTIME
$VIM/vimfiles/after
$HOME/.vim/after
```

也就是说我们只要把插件放到上面的任意一个目录下面，就能使用。
大部分时候，我们都是使用 `$HOME/.vim` 这个目录。

你可以使用命令 `:set runtimepath?` 来查看当前的 `runtimepath` 有哪些目录。

如果你安装的时候，使用了 `./install_basic_vimrc.sh`，
那么 `runtimepath` 就只有默认的。在我的系统上如下：

```
runtimepath=~/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim81,/usr/local/share/vim/vimfiles/after,~/.vim/after
```

如果你安装的时候，使用了 `./install_awesome_vimrc.sh`，
那么 `runtimepath` 就只有比较多。因为 `awesome` 这个版本
包含了很多的插件。不理解的话没关系，先继续往下看。

### vim 会到每个 runtimepath 目录下去查找如下内容

```
filetype.vim	filetypes by file name |new-filetype|
scripts.vim	filetypes by file contents |new-filetype-scripts|
autoload/	automatically loaded scripts |autoload-functions|
colors/	color scheme files |:colorscheme|
compiler/	compiler files |:compiler|
doc/		documentation |write-local-help|
ftplugin/	filetype plugins |write-filetype-plugin|
indent/	indent scripts |indent-expression|
keymap/	key mapping files |mbyte-keymap|
lang/		menu translations |:menutrans|
menu.vim	GUI menus |menu.vim|
pack/		packages |:packadd|
plugin/	plugin scripts |write-plugin|
print/	files for printing |postscript-print-encoding|
spell/	spell checking files |spell|
syntax/	syntax files |mysyntaxfile|
tutor/	files for vimtutor |tutor|
```

网上下载的插件，一般都有若干个如上的目录，我们只要直接解压了，
放到 `~/.vim` 目录下就可以了。但是这样的话，就会很乱，因为不同的
插件，是会有相同的目录的。那要怎么办呢？

很简单，每个插件单独一个目录就好了，然后把每个插件的目录全部添加到
`runtimepath` 就可以了。但是我们手动一个个插件目录去添加到 `runtimepath` 又
很麻烦，于是 `vim-pathogen` 出现了，只要我们把 **插件目录** 放到指定的目录下，
`vim-pathogen` 就会自动把 **插件目录** 添加到 `runtimepath`。

### vim-pathogen 是如何管理插件的？

在执行了 `./install_awesome_vimrc.sh` 之后，我们打开 `~/.vimrc` 看下：

```
set runtimepath+=/home/huangjian/.MyVim

source /home/huangjian/.MyVim/vimrcs/basic.vim
source /home/huangjian/.MyVim/vimrcs/filetypes.vim
source /home/huangjian/.MyVim/vimrcs/plugins_config.vim
source /home/huangjian/.MyVim/vimrcs/plugins_cscope_maps.vim
source /home/huangjian/.MyVim/vimrcs/extended.vim
source /home/huangjian/.MyVim/vimrcs/terminal.vim

try
source /home/huangjian/.MyVim/my_configs.vim
catch
endtry
```

可以看到，我们把目录 `~/.MyVim` 加入到了 `runtimepath`，
因为在目录 `~/.MyVim` 下有一个 `autoload` 目录，里面放着插件 `pathogen.vim`。
目录 `autoload` 下的插件会在 vim 启动的时候被自动加载，因为我们需要用 `pathogen`
来管理其他的插件，所以我们需要先加载 `pathogen.vim` 这个插件。

然后我们调用了 `source extensionXXX.vim` 这样的命令，
这是把一个 vimrc 配置文件拆成多个来写，方便管理。

在 `~/.MyVim/vimrcs/plugins_config.vim` 里面，我们可以看到如下内容：

```
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#infect('~/.vim/bundle/{}')
call pathogen#helptags()
```

变量 `s:vim_runtime` 其实就是目录 `~/.MyVim`。
然后我们用 `pathogen#infect()` 函数指定了几个目录，只要插件下载之后
放到这几个目录下，插件的目录就会被自动添加到 `runtimepath` 下，只要添加
到了 `runtimepath` 下，vim 就能找到该插件。

这里 `pathogen` 指定的几个目录为：

* `~/.MyVim/sources_forked`
* `~/.MyVim/sources_non_forked`
* `~/.MyVim/my_plugins`
* `~/.vim/bundle`

那上面的几个目录有区别吗？答案是：没有。你可以
把下载好的插件放到任意一个目录下都可以。

这个时候，你可以再次执行下 `:set runtimepath?` 看看
你的 `runtimepath`，你就理解为什么那么多个目录了。

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> [上一章](README_vim_3.1_plugin.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

