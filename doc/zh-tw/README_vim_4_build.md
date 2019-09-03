# Vim 編譯

## vim 8 編譯

到 [Github Vim](https://github.com/vim/vim) 上下載最新版本的 Vim。

`vim 8` 需要 gcc 7 以上的版本。

執行 `./configure -h | vim -` 查看編譯選項。

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

編譯的過程中有著各種各樣的問題，我這裡給出我編譯好的版本：

[鏈接](https://pan.baidu.com/s/1RNzhsRmLowCOoT9mR1SZZg) 提取碼: jez4

下載下來之後，直接執行 `make install` 就可以了，這個是在 `ubuntu 16.04` 下編譯的。

默認是安裝在 `/usr/local` 目錄下，如果需要修改的話，需要你自己編譯，
用 `./configure --prefix=/usr/local` 修改 `prefix` 這個參數就可以了。

還要記得把舊的備份下 `mv vim vim7`，然後建立一個新的軟鏈接 `ln -s vim8 vim`。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

