# Vim 安裝說明

該文檔中的所有操作都是在 ubuntu 16.04 LTS 下進行的，自帶 vim 7 版本。

如果你的操作係統恰好也是 Linux，或者是 OS X 的話，都是自帶 vim
的，不需要安裝。Windows 係統需要上網自行下載安裝。

## 先安裝 vim

```bash
sudo apt-get install vim
```

## 增加 Vim Features

用 `vim --version` 可以看到 vim Features list。

打開 vim 之後，用 `:version` 也可以看到。

前麵的 **加號** 表示當前的 vim 支持該特性， **減號** 表示不支持。

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

有的特性默認是不開啟的，比如說 `clipboard` 剪切板，可以用下麵的命令安裝支持。

`clipboard` 這個很重要，從瀏覽器複製數據到 vim 的時候，就需要用到這個，
見 [vim,shell,tmux,瀏覽器之間互相複製數據](README_vim_2_copydata.md)。

```bash
sudo apt-get install vim-scripts vim-gtk vim-gnome
```

但是像 `python3` 這種應該就需要自己編譯，詳細見 [Vim 編譯](README_vim_4_build.md)。

## 安裝 vim 配置文件

這一步是所有人都需要執行的。**vim** 環境是以 [amix/vimrc](https://github.com/amix/vimrc) 為模板進行修改的。你隻需要把倉庫克隆到你本地，然後執行下安裝腳本即可。

```bash
git clone https://github.com/MDGSF/MyVim.git ~/.MyVim
cd ~/.MyVim
```

目錄下有兩個安裝腳本 `install_awesome_vimrc.sh` 和 `install_basic_vimrc.sh`。

`install_basic_vimrc.sh` 隻有一些最基礎的配置。

`install_awesome_vimrc.sh` 會帶有一些常用的插件（建議安裝）。

如果使用 `install_awesome_vimrc.sh` 安裝之後，有插件報錯了，
那就使用 `install_basic_vimrc.sh` 來安裝基本的版本就好了。

**如果你想要自己定製屬於自己的配置**

那你可以先 **fork** 該倉庫，然後再把你自己的倉庫克隆到本地，
然後修改成你自己想要的配置，再提交到你自己的倉庫中就可以了。

## 配色方案

安裝好了之後，建議先修改配色方案。

[vim 配色方案](README_vim_2_colorscheme.md)

* * *

[目錄](README.md)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

