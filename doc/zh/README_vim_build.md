# Vim 编译

## vim 8 编译

到 [Github Vim](https://github.com/vim/vim) 上下载最新版本的 Vim。

`vim 8` 需要 gcc 7 以上的版本。

执行 `./configure -h | vim -` 查看编译选项。

```
sudo apt-get build-dep vim-gnome
sudo apt-get install ruby-dev
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev
```

```
./configure \
--enable-luainterp=yes \
--enable-perlinterp=yes \
--enable-python3interp=yes \
--enable-rubyinterp=yes \
--enable-cscope \
--enable-terminal \
--with-features=huge \
LDFLAGS=-fno-lto
```

编译的过程中有着各种各样的问题，我这里给出我编译好的版本：

[链接](https://pan.baidu.com/s/1RNzhsRmLowCOoT9mR1SZZg) 提取码: jez4

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

