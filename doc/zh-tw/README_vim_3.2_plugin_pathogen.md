# 插件 vim-pathogen

[vim-pathogen 官網](https://github.com/tpope/vim-pathogen)

插件 `pathogen` 其實隻是管理了 vim 的 `runtimepath`。

`runtimepath` 是一係列的目錄，vim 會自動到 `runtimepath`
定義的目錄下麵去查找插件。可以使用 `:help runtimepath` 查看。

在 Linux 下麵，`runtimepath` 默認的目錄如下：

```
$HOME/.vim
$VIM/vimfiles
$VIMRUNTIME
$VIM/vimfiles/after
$HOME/.vim/after
```

也就是說我們隻要把插件放到上麵的任意一個目錄下麵，就能使用。
大部分時候，我們都是使用 `$HOME/.vim` 這個目錄。

你可以使用命令 `:set runtimepath?` 來查看當前的 `runtimepath` 有哪些目錄。

如果你安裝的時候，使用了 `./install_basic_vimrc.sh`，
那麼 `runtimepath` 就隻有默認的。在我的係統上如下：

```
runtimepath=~/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim81,/usr/local/share/vim/vimfiles/after,~/.vim/after
```

如果你安裝的時候，使用了 `./install_awesome_vimrc.sh`，
那麼 `runtimepath` 就隻有比較多。因為 `awesome` 這個版本
包含了很多的插件。不理解的話冇關係，先繼續往下看。

### vim 會到每個 runtimepath 目錄下去查找如下內容

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

網上下載的插件，一般都有若干個如上的目錄，我們隻要直接解壓了，
放到 `~/.vim` 目錄下就可以了。但是這樣的話，就會很亂，因為不同的
插件，是會有相同的目錄的。那要怎麼辦呢？

很簡單，每個插件單獨一個目錄就好了，然後把每個插件的目錄全部添加到
`runtimepath` 就可以了。但是我們手動一個個插件目錄去添加到 `runtimepath` 又
很麻煩，於是 `vim-pathogen` 出現了，隻要我們把 **插件目錄** 放到指定的目錄下，
`vim-pathogen` 就會自動把 **插件目錄** 添加到 `runtimepath`。

### vim-pathogen 是如何管理插件的？

在執行了 `./install_awesome_vimrc.sh` 之後，我們打開 `~/.vimrc` 看下：

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

可以看到，我們把目錄 `~/.MyVim` 加入到了 `runtimepath`，
因為在目錄 `~/.MyVim` 下有一個 `autoload` 目錄，裡麵放著插件 `pathogen.vim`。
目錄 `autoload` 下的插件會在 vim 啟動的時候被自動加載，因為我們需要用 `pathogen`
來管理其他的插件，所以我們需要先加載 `pathogen.vim` 這個插件。

然後我們調用了 `source extensionXXX.vim` 這樣的命令，
這是把一個 vimrc 配置文件拆成多個來寫，方便管理。

在 `~/.MyVim/vimrcs/plugins_config.vim` 裡麵，我們可以看到如下內容：

```
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#infect('~/.vim/bundle/{}')
call pathogen#helptags()
```

變量 `s:vim_runtime` 其實就是目錄 `~/.MyVim`。
然後我們用 `pathogen#infect()` 函數指定了幾個目錄，隻要插件下載之後
放到這幾個目錄下，插件的目錄就會被自動添加到 `runtimepath` 下，隻要添加
到了 `runtimepath` 下，vim 就能找到該插件。

這裡 `pathogen` 指定的幾個目錄為：

* `~/.MyVim/sources_forked`
* `~/.MyVim/sources_non_forked`
* `~/.MyVim/my_plugins`
* `~/.vim/bundle`

那上麵的幾個目錄有區彆嗎？答案是：冇有。你可以
把下載好的插件放到任意一個目錄下都可以。

這個時候，你可以再次執行下 `:set runtimepath?` 看看
你的 `runtimepath`，你就理解為什麼那麼多個目錄了。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_3.1_plugin.md)
>
> [下一章](README_vim_3.3_plugin_cscope.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

