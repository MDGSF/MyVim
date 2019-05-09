# tmux + vim 搭建开发环境

* [English](README_en.md)
* [中文文档](README.md)

## 目录结构

```
.
├── autoload (vim 启动的时候会自动加载这个目录中的插件)
├── doc (文档目录)
├── sources_forked (插件目录)
├── sources_non_forked (插件目录)
├── tmuxconfs (tmux.conf 备份目录)
├── vimrcs (vimrc 备份目录)
├── vimtutor (vimtutor 备份目录)
├── install_awesome_vimrc.sh (vim Awesome 版安装脚本)
├── install_basic_vimrc.sh (vim basic 版安装脚本)
├── install_tmux_conf.sh (tmux 安装脚本)
├── LICENSE
└── README.md
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
    * [vim 常用快捷键映射](doc/README_vim_mapping_common_used.md)
    * [vim 配色方案](doc/README_vim_colorscheme.md)
    * [vim 标签页介绍](doc/README_vim_tab.md)
    * [vim,shell,tmux,浏览器之间互相复制数据](doc/README_vim_copydata.md)
    * [vimtutor 30分钟入门 vim](doc/README_vim_tutor.md)
    * [vim 映射介绍](doc/README_vim_mapping_introduction.md)
    * [vim 其他资源](doc/README_vim_resource.md)

## 使用说明

**vim** 环境来自 [amix/vimrc](https://github.com/amix/vimrc)

### 先安装 vim 和 tmux

```bash
sudo apt-get install vim vim-scripts vim-gtk vim-gnome
sudo apt-get install tmux
sudo apt-get install xclip
```

### 如何你愿意使用和我一样的配置

那你只需要把仓库克隆到你本地，然后复制下配置文件即可。

```bash
git clone https://github.com/MDGSF/MyVim.git ~/.MyVim
cd ~/.MyVim
```

#### 安装 tmux 配置文件

```
./install_tmux_conf.sh
```

#### 安装高级定制版 vim

```
./install_awesome_vimrc.sh
```

#### 安装基本版 vim

```
./install_basic_vimrc.sh
```

### 如果你想要自己定制属于自己的配置

那你可以先 **fork** 该仓库，然后再把你自己的仓库克隆到本地，
然后修改成你自己想要的配置，再提交到你自己的仓库中就可以了。

## License

MyVim is licensed under the MIT License.

