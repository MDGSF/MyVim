# tmux + vim 搭建开发环境

## 目录结构

```
.
├── doc (文档目录)
├── script (脚步目录)
├── vim_backup (~/.vim 备份目录)
├── install.sh (安装脚本)
├── LICENSE
├── README.md
├── tmux.conf (~/.tmux.conf 备份文件)
├── vimrc (~/.vimrc 备份文件，我自己使用的)
├── vimrc_basic (~/.vimrc 备份文件，包含一些常用的插件)
├── vimrc_simple (~/.vimrc 备份文件，不包含插件，只使用 vim 自带的配置)
├── vimtutor_ch.sh (启动中文版 vimtutor)
├── vimtutor_ch.txt (中文版 vimtutor)
└── vimtutor.txt (英文版 vimtutor)
```

## 文档

* [使用说明](#使用说明)
* [tmux 文档](doc/README_tmux.md)
* [vim 文档](doc/README_vim.md)
    * [vim 基础配置介绍](doc/README_vim_basicsetting.md)
    * [vim 模式](doc/README_vim_mode.md)
    * [vim 打开、退出](doc/README_vim_openclose.md)
    * [vim 移动光标](doc/README_vim_movecursor.md)
    * [vim 查找文本](doc/README_vim_search.md)
    * [vim 修改文本](doc/README_vim_modify.md)
    * [vim 替换文本](doc/README_vim_substitute.md)
    * [vim 命令行](doc/README_vim_cmdline.md)
    * [vim 其他注意点](doc/README_vim_miscellanes.md)
    * [vim 窗口](doc/README_vim_panel.md)
    * [vim 常用插件](doc/README_vim_plugin.md)
    * [vim tab 使用介绍](doc/README_vim_tab.md)
    * [vimtutor 30分钟入门 vim](doc/README_vim_tutor.md)

## 使用说明

### 先安装 vim 和 tmux

```bash
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install xclip
```

### 如何你愿意使用和我一样的配置

那你只需要把仓库克隆到你本地，然后复制下配置文件即可。

```bash
git clone https://github.com/MDGSF/MyVim.git
cd MyVim
```

#### 手动复制

```bash
mkdir ~/.vim
cp -arf ./vim_backup/* ~/.vim
cp -arf ./vimrc_basic ~/.vimrc
cp -arf ./tmux.conf ~/.tmux.conf
```

#### 使用 install.sh 脚本复制

我已经把这几行复制命令放到了 `install.sh` 脚本中了，
直接执行就会复制到你的环境中去了。

### 如果你想要自己定制属于自己的配置

那你可以先 **fork** 该仓库，然后再把你自己的仓库克隆到本地，
然后修改成你自己想要的配置，再提交到你自己的仓库中就可以了。

