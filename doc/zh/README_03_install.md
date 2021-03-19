# Vim 安装说明

该文档中的所有操作都是在 ubuntu 16.04 LTS 下进行的，自带 vim 7 版本。

如果你的操作系统恰好也是 Linux，或者是 OS X 的话，都是自带 vim
的，不需要安装。Windows 系统需要上网自行下载安装。

## 先安装 vim

```bash
sudo apt-get install vim
```

## 增加 Vim Features

用 `vim --version` 可以看到 vim Features list。

打开 vim 之后，用 `:version` 也可以看到。

前面的 **加号** 表示当前的 vim 支持该特性， **减号** 表示不支持。

```
Huge version with GTK2 GUI.  Features included (+) or not (-):
+acl               +digraphs          +lispindent        +persistent_undo   +textobjects
+arabic            +dnd               +listcmds          +postscript        +textprop
+autocmd           -ebcdic            +localmap          +printer           +timers
+autochdir         +emacs_tags        -lua               +profile           +title
-autoservername    +eval              +menu              -python            +toolbar
+balloon_eval      +ex_extra          +mksession         +python3           +user_commands
+balloon_eval_term +extra_search      +modify_fname      +quickfix          +vartabs
+browse            -farsi             +mouse             +reltime           +vertsplit
++builtin_terms    +file_in_path      +mouseshape        +rightleft         +virtualedit
+byte_offset       +find_in_path      +mouse_dec         +ruby              +visual
+channel           +float             -mouse_gpm         +scrollbind        +visualextra
+cindent           +folding           -mouse_jsbterm     +signs             +viminfo
+clientserver      -footer            +mouse_netterm     +smartindent       +vreplace
+clipboard         +fork()            +mouse_sgr         +startuptime       +wildignore
+cmdline_compl     +gettext           -mouse_sysmouse    +statusline        +wildmenu
+cmdline_hist      -hangul_input      +mouse_urxvt       -sun_workshop      +windows
+cmdline_info      +iconv             +mouse_xterm       +syntax            +writebackup
+comments          +insert_expand     +multi_byte        +tag_binary        +X11
+conceal           +job               +multi_lang        -tag_old_static    -xfontset
+cryptv            +jumplist          -mzscheme          -tag_any_white     +xim
+cscope            +keymap            +netbeans_intg     -tcl               +xpm
+cursorbind        +lambda            +num64             +termguicolors     +xsmp_interact
+cursorshape       +langmap           +packages          +terminal          +xterm_clipboard
+dialog_con_gui    +libcall           +path_extra        +terminfo          -xterm_save
+diff              +linebreak         -perl              +termresponse
```

有的特性默认是不开启的，比如说 `clipboard` 剪切板，可以用下面的命令安装支持。

`clipboard` 这个很重要，从浏览器复制数据到 vim 的时候，就需要用到这个，
见 [vim,shell,tmux,浏览器之间互相复制数据](README_vim_2_copydata.md)。

```bash
sudo apt-get install vim-scripts vim-gtk vim-gnome
```

但是像 `python3` 这种应该就需要自己编译，详细见 [Vim 编译](README_vim_4_build.md)。

## 安装 vim 配置文件

这一步是所有人都需要执行的。**vim** 环境是以 [amix/vimrc](https://github.com/amix/vimrc) 为模板进行修改的。你只需要把仓库克隆到你本地，然后执行下安装脚本即可。

```bash
git clone https://github.com/MDGSF/MyVim.git ~/.MyVim
cd ~/.MyVim
```

目录下有两个安装脚本 `install_awesome_vimrc.sh` 和 `install_basic_vimrc.sh`。

`install_basic_vimrc.sh` 只有一些最基础的配置。

`install_small_vimrc.sh` 只有一些最基础的配置，和几个常用的插件，
插件放在 sources_small 目录下（建议使用）。

`install_awesome_vimrc.sh` 会带有许多常用的插件。

如果使用 `install_awesome_vimrc.sh` 安装之后，有插件报错了，
那就使用 `install_basic_vimrc.sh` 或 `install_small_vimrc.sh`
来安装基本的版本就好了。

**如果你想要自己定制属于自己的配置**

那你可以先 **fork** 该仓库，然后再把你自己的仓库克隆到本地，
然后修改成你自己想要的配置，再提交到你自己的仓库中就可以了。

## 配色方案

安装好了之后，建议先修改配色方案。

[vim 配色方案](README_vim_2_colorscheme.md)

* * *

[目录](README.md)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

