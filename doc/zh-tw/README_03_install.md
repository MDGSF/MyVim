# Vim 安裝說明

該文檔中的所有操作都是在 ubuntu 16.04 LTS 下進行的，自帶 vim 7 版本。

如果你的操作係統恰好也是 Linux，或者是 OS X 的話，都是自帶 vim
的，不需要安裝。Windows 係統需要上網自行下載安裝。

## 先安裝 vim

```bash
sudo apt-get install vim vim-scripts vim-gtk vim-gnome
```

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

* * *

[目錄](README.md)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

