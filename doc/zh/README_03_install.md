# Vim 安装说明

该文档中的所有操作都是在 ubuntu 16.04 LTS 下进行的，自带 vim 7 版本。

如果你的操作系统恰好也是 Linux，或者是 OS X 的话，都是自带 vim
的，不需要安装。Windows 系统需要上网自行下载安装。

## 先安装 vim

```bash
sudo apt-get install vim vim-scripts vim-gtk vim-gnome
```

## 安装 vim 配置文件

这一步是所有人都需要执行的。**vim** 环境是以 [amix/vimrc](https://github.com/amix/vimrc) 为模板进行修改的。你只需要把仓库克隆到你本地，然后执行下安装脚本即可。

```bash
git clone https://github.com/MDGSF/MyVim.git ~/.MyVim
cd ~/.MyVim
```

目录下有两个安装脚本 `install_awesome_vimrc.sh` 和 `install_basic_vimrc.sh`。

`install_basic_vimrc.sh` 只有一些最基础的配置。

`install_awesome_vimrc.sh` 会带有一些常用的插件（建议安装）。

如果使用 `install_awesome_vimrc.sh` 安装之后，有插件报错了，
那就使用 `install_basic_vimrc.sh` 来安装基本的版本就好了。

**如果你想要自己定制属于自己的配置**

那你可以先 **fork** 该仓库，然后再把你自己的仓库克隆到本地，
然后修改成你自己想要的配置，再提交到你自己的仓库中就可以了。

* * *

[目录](README.md)

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

