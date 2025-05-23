# cheatsheet

- language
  - python: `cheatsheet/language/python.md`
  - javascript: `cheatsheet/language/javascript.md`
  - csharp: `cheatsheet/language/csharp.md`

## Linux tools

- vim
- git, gcc, g++, gdb, cgdb, make, cmake
  - sudo apt install git gcc g++ make cmake
- hexyl：以 16 进制查看文件，很好看
  - <https://github.com/sharkdp/hexyl>
  - sudo apt install hexyl
- ripgrep：文件查找
  - <https://github.com/BurntSushi/ripgrep>
  - sudo apt install ripgrep
- tokei：统计代码行数
  - <https://github.com/XAMPPRocky/tokei>

## 终端快捷键

```sh
# 左右键：按字母左右移动光标
# ctrl + 左右键：按单词左右移动光标
# ctrl + a 光标移动到最开头
# ctrl + e 光标移动到最末尾
# ctrl + xx 在命令行首和光标之间移动

# ctrl + u 从光标处删除至命令行首
# ctrl + k 从光标处删除至命令行尾
# ctrl + w 从光标处删除至字首
# alt + backspace 和 ctrl + w 感觉差不多
# alt + d 从光标处删除至字尾
# ctrl + d 删除光标处的字符
# ctrl + h 删除光标前的字符

# ctrl + l 清屏
# clear 清屏

# ctrl + y 粘贴至光标前
# ctrl + shift + v 粘贴至光标前

# alt + c 从光标处更改为首字母大写的单词
# alt + u 从光标处更改为全部大写的单词
# ctrl + t 交换光标处和之前的字符
# alt + t 交换光标处和之前的单词

# ctrl + s 阻止屏幕输出
# ctrl + q 允许屏幕输出

# ctrl + r 逆向搜索历史记录
# ctrl + g 从历史搜索模式退出

# ctrl + z 挂起命令
# jobs 查看被挂起的命令
# fg 恢复命令

# !! 执行上一条命令
```

## 查看当前 shell

```sh
# 输出当前 shell 的名字
echo $0
```

## 切换为 bash

```sh
chsh -s /usr/bin/bash
```

## 从 bash 切换为 zsh

```sh
sudo apt install zsh

# 设置默认 shell 为 zsh
chsh -s /usr/bin/zsh
```

## oh my zsh

```
更新版本
omz update
```

## 获取 bash 版本号

```sh
# 方法一
bash --version

# 方法二
echo "${BASH_VERSION}"
```

## 查看 ubuntu 版本信息

```sh
# No LSB modules are available.
# Distributor ID: Ubuntu
# Description:    Ubuntu 20.04.3 LTS
# Release:        20.04
# Codename:       focal
lsb_release -a

# Linux DESKTOP-7ATE1QU 5.10.16.3-microsoft-standard-WSL2 #1 SMP Fri Apr 2 22:23:49 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
uname -a

# Linux
uname -s

# x86_64
uname -m
```

## 获取 IP 地址

```sh
# 这个在不同电脑上可能需要调整
ifconfig eth0 | grep "inet" | grep "netmask" | awk '{print $2}'

# 这个会同时返回多个 IP 地址
hostname -I
```

## 获取当前用户信息

```sh
# 获取当前用户信息
id

# 获取当前用户的 uid
id -u
```

## find查找

```sh
# 删除当前目录，子目录下的所有 target 目录
find . -name "target" -type d -print -exec rm -rf {} \;

# 查找并替换
find . -type f -exec sed -i 's/camera0/camera30/g' {} \;

# 在当前目录，子目录下查找所有以 sh 结尾的文件
find . -type f -name "*.sh"
find . -type f -name "*.sh" -exec ls -lh {} \;

# 对当前目录，子目录下的所有 sh 文件添加可执行权限
find . -type f -name "*.sh" -exec chmod a+x {} \;
```

## grep查找

```sh
-r 递归查找
-n 显示行号
-i 忽略大小写
-w 查找完整单词

指定查找文件的后缀类型
--include \*.h --include \*.cpp

grep -rn "text"
grep -rnw "text"
grep -rnw "PermanentDelete" --include \*.go
```

## ripgrep查找

```sh
cargo install ripgrep
rg -h

-i 忽略大小写
-w 查找完整单词

# 在当前目录下递归查找包含 foo 的行
rg foo

# 在当前目录下递归查找包含 foo 的行，忽略大小写
rg foo -i

# 在当前目录下递归查找包含 foo 的行，
# -w 查找完整单词
# -g '*.go' 指定文件后缀查找
rg foo -w -g '*.go'

# 在 utils.py 文件中查找包含 image 的行
rg image utils.py

# 在 src 目录下递归查找包含 image 的行
rg image src/

# 不包含 dir1 和 dir2 目录
rg pattern -g '!dir1/' -g '!dir2/'

# 反向查找，查找不包含 image 的行
rg -v image

# 查找以 We 开头的行
rg '^We' test.txt

# 按字面量查找，不使用正则表达式查找
rg -F '(test)'

# -g 参数可以多次使用
rg image -g '*.py'    # 指定文件类型查找
rg image -g '!*.py'   # 和上面的相反
```

## awk

```sh
# $0 整行文本
# $1 第 1 部分文本
# $2 第 2 部分文本
# $n 第 n 部分文本
# 默认应该是以空白字符作为分隔符
xxx | grep "xxx" | awk '{print $0}'

# -F 用来指定分隔符
awk -F '.' '{print $0}'
```

## sed

## du

```sh
# 查看当前目录下，每个子目录占用硬盘空间大小
du -h -d 1 | sort -h
```

## 重定向

```sh
# 0 标准输入 stdin
# 1 标准输出 stdout
# 2 标准错误输出 stderr

# 重定向标准输出到 log.txt 文件
# 那标准错误输出仍然是屏幕
exe > log.txt

# 把 input.txt 文件作为 exe 程序的标准输入
exe < input.txt

# 管道，把第一个程序的标准输出，重定向到第二个程序的标准输入
# 第一个程序的标准错误输出？好像还是屏幕
firstExe | secondExe
```

## 压缩 解压

```sh
把 xxx 压缩为 xxx.tar.gz
tar -zcvf xxx.tar.gz xxx

解压 xxx.tar.gz 到当前目录
tar -zxvf xxx.tar.gz

解压 xxx.tar.gz 到指定目录
tar -zxvf xxx.tar.gz -C /target_dir

解压 xxx.tar.xz 到当前目录
tar -xvJf xxx.tar.xz

解压 xxx.tar 到当前目录
tar -xvf xxx.tar

把 xxx 打包为 xxx.tar
tar -cvf xxx.tar xxx

解压 xxx.gz 到当前目录
gunzip xxx.gz

Zip command provides 10 levels of compression ( 0-9 ).
-6 is used as default compression level.
-0 is used for lowest level compression.
-9 is used for hightest level comression
把目录 xxx 压缩为 xxx.zip
zip -0 -r xxx.zip xxx
zip -r xxx.zip xxx

解压 xxx.zip 到当前目录
unzip xxx.zip

解压 xxx.zip 到 outputdir 目录
unzip -d outputdir xxx.zip
```

## 关机

```sh
# 立马关机
shutdown -h now

# 一分钟后自动关机，等价于 shutdown +1
shutdown

# 10分钟后自动关机
shutdown +10

# 指定在 14:09 这个时间点自动关机
shutdown 14:09

# 取消之前定义的shutdown任务
shutdown -c

# 立马重启
shutdown -r now

# 指定在 14:09 这个时间点自动重启
shutdown -r 14:15
```

## touch 命令

```sh
# 在当前目录下创建一个 text.txt 的文件
touch test.txt

# 在当前文件夹下创建 100 个文件：file1, file2, ..., file99, file100
touch file{1..100}
```

## dd 命令

```sh
# 创建一个 4G 大小的空文件
dd if=/dev/zero of=4G.txt count=4096 bs=1MB

# 创建一个 4G 大小的文件，里面都是随机字符
dd if=/dev/urandom of=4G.txt bs=1M count=4096
```

## ssh 登录

```sh
# 登录服务器
ssh username@ip_address

# ssh禁用密码登录和root用户登录
# 修改 /etc/ssh/sshd_config 文件
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
PermitRootLogin no
PermitRootLogin prohibit-password

# 重启服务
/etc/init.d/ssh reload
sudo systemctl reload ssh

# 公钥放到服务器上的 ~/.ssh/authorized_keys 中
```

## 用户组相关命令

```sh
# 查看所有用户组
cat /etc/group

# 创建用户组
sudo addgroup <groupname>

# 删除用户组
sudo delgroup <groupname>

# 用户组添加用户
sudo adduser <username> <groupname>

# 用户组移除用户
sudo deluser <username> <groupname>

# 查看用户组中的用户
cat /etc/group | grep <groupname>
getent group <groupname>
getent group <groupname> | awk -F: '{print $4}'
```

## 创建删除用户

```sh
# 创建用户前修改配置文件 /etc/adduser.conf
DIR_MODE=0750  表示用户HOME目录不允许其他用户查看

# 使用 /etc/adduser.conf 配置创建用户
sudo adduser <username>
# 指定参数创建用户
sudo adduser --home /home/<username> --shell /bin/bash <username>

# 删除用户及其 HOME 目录
# 删除用户的时候，对应的用户组也会一起被删除
sudo deluser --remove-home <username>
# 删除用户及其 HOME 目录，并备份 HOME 到当前目录
sudo deluser --remove-home --backup <username>
```

## 切换用户

```sh
# 切换到 root 用户
sudo su

# 切换到普通用户
su username

# 切换用户
sudo -iu username
```

## passwd 重置密码

```sh
passwd username
```

## sudoers

```sh
# 在 /etc/sudoers.d/ 目录下创建文件 admin，内容如下：
%admin ALL=(ALL) ALL

# 在 /etc/sudoers.d/ 目录下创建文件 s0，内容如下：
%s0 ALL=(s0:s0) NOPASSWD:ALL
```

## tree

```sh
# 以树状形式查看当前目录
tree

# 以树状形式查看 /opt/node 目录，只查看两个层级
tree -L 2 /opt/node
```

## vimdiff

```sh
# do - Get changes from other window into the current window.
# dp - Put the changes from current window into the other window.
# ]c - Jump to the next change.
# [c - Jump to the previous change.
# zo – open folded text
# zc – close folded text
```

## rsync 复制文件目录

```sh
# 这个工具复制速度似乎不是很快，感觉像是单线程在复制。

# -a 等价于 -rlptgoD
# -r 递归复制目录
# -v 显示复制的过程
# -l 同步软链接
# -H 同步硬链接
# -t 保留修改时间
# -z 传输数据的时候会对数据进行压缩
# -P 可以看到进度条
# --daemon 后台运行

# 把 source 目录下的文件包括子目录都复制到 destination 目录下
# 要记得在 source 后面加上 /，
# 如果没有加的话，会把 source 目录复制到 destination 目录下
rsync -rvlt source/ destination

rsync -avP source/ destination
```

## iperf 测试网络性能

```sh
# 安装 iperf
sudo apt-get install iperf3

# 启动服务端监听
iperf3 -s
# 启动客户端测试
iperf3 -c 127.0.0.1

# -c 指定 host，就是服务端的IP地址
# -t 指定测试时间长度（单位：秒），默认是测试 10 秒

# 测试 30 秒
iperf3 -c 127.0.0.1 -t 30
```

## ifstat 查看网卡进出流量

```sh
# 安装
sudo apt install ifstat

# 查看网卡进出流量
ifstat
```

## tcpdump 抓包

```sh
# 指定网卡，指定 IP 地址，保存到 log.cap 文件
sudo tcpdump -i eth0 host 192.168.1.233 -w log.cap
```

## lsof 命令

```sh
# 查看端口占用，网络连接，和 netstat 有点类似
lsof -i -Pn
```

## nc 命令

```sh
# 在本地启动一个 TCP 服务器
nc -l 127.0.0.1 1234
# TCP 客户端去连接本地的 TCP 服务器
nc 127.0.0.1 1234

# 在本地启动一个 TCP 服务器
# -k 保持连接
# -v verbose 日志输出
nc -kv -l 127.0.0.1 12345
# TCP 客户端去连接本地的 TCP 服务器
# 10000 是指定客户端的端口
# 12345 是服务端的端口
nc -v -p 10000 127.0.0.1 12345

# 启动一个远程 bash 终端，在服务端执行如下命令
rm -f /tmp/f; mkfifo /tmp/f
cat /tmp/f | /bin/sh -i 2>&1 | nc -l 127.0.0.1 1234 > /tmp/f
# 在客户端执行
nc 127.0.0.1 1234

# nc 命令局域网传文件。
```

## 挂载

```sh
挂载 nas 网盘到目录 /home/huangjian/Test/dataset
sudo mount -t cifs -o username=黄剑,password=xxxxxxxxx,uid=huangjian,_netdev,iocharset=utf8,vers=2.0,nofail //192.168.6.63/dataset /home/huangjian/Test/dataset

挂载虚拟机的 /mnt/share 目录和主机的 share 目录进行共享
sudo mount -t vboxsf share /mnt/share
```

## keychain

```text
添加 keychain，不用一直输密码
$ sudo apt install keychain
$ hostname

放入 ~/.zshrc
/usr/bin/keychain --nogui ~/.ssh/id_rsa
source $HOME/.keychain/[Put-Your-Hostname-Here]-sh
```

## pm2

```sh
# 查看列表
pm2 list

# 启动进程
pm2 start pm2.json

# 停止进程
pm2 stop name|id

# 删除进程
pm2 delete name|id

# 重新加载
pm2 reload name|id

# 重命名
pm2 restart <id> --name <newName>

# pm2 日志管理
# https://www.npmjs.com/package/pm2-logrotate
pm2 install pm2-logrotate
# 保留 7 份日志文件
pm2 set pm2-logrotate:retain 7
# 开启日志压缩
pm2 set pm2-logrotate:compress true
```

## load average 系统负载

```sh
# 可以用 top, uptime 命令获取到该信息，也可以读取 /proc/loadavg 文件
# 3 个数字表示过去 1 分钟，5 分钟，15 分钟的系统负载
load average: 0.00, 0.00, 0.00
```

## android

```sh
# 重新挂载系统路径为读写
mount -o rw,remount,rw /system
```

## ufw 防火墙

```sh
# 查看帮助文档
ufw --help
# 启用 ufw
ufw enable
# 禁用 ufw
ufw disable
# 查看状态
ufw status
# 允许IP地址172.18.225.45来源的流量访问端口6379
ufw allow from 172.18.225.45 to any port 6379
# 开放端口6379
sudo ufw allow 6379

# 查看 ufw 默认策略
ufw status verbose
# 修改 ufw 默认策略为 allow
ufw default allow
# 修改 ufw 默认策略为 deny
ufw default deny
```

## clang环境配置

```
export LLVM_HOME=/home/huangjian/opt/toolchains/clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-20.04/bin
export PATH=$PATH:$LLVM_HOME
```

## clangformat

```
clang-format -style=google -dump-config > .clang-format
find src/ -iname '*.h' -o -iname '*.cpp' -o -iname '*.c' | xargs clang-format -i
```

忽略部分代码：

```cpp
int formatted_code;
// clang-format off
   void    unformatted_code  ;
// clang-format on
void formatted_code_again;
```

## vim

```
# 关闭颜色
:syntax off

# 设置复制的时候不会缩进
:set paste
:set nopaste
```

## 镜像源

https://developer.aliyun.com/mirror/
https://mirrors.tuna.tsinghua.edu.cn/
https://mirrors.ustc.edu.cn/

## cert

```sh
# cacert.pem
# 下载地址：https://curl.se/docs/caextract.html

# 生成 rsa 私钥
openssl genrsa -out server.key 2048
# 生成私钥对应的公钥
openssl rsa -in server.key -pubout -out server.pubkey
# 生成证书
openssl req -new -x509 -key server.key -out server.crt -days 3650
# 查看证书内容
openssl x509 -in cacert.pem -noout -text
openssl x509 -in server.crt -noout -text
```

## ssh-gen

```sh
ssh-keygen -m PEM -t rsa -b 4096 -C "your.email@example.com"
ssh -T git@e.coding.net

# --global表示全局配置，不加则只对当前Git项目生效。
git config [--global] core.sshCommand "ssh -i /path/to/your/privateKey"
```

## ldd

```sh
# 复制依赖库
ldd test.exe | awk '{print $3}' | grep "^/" | xargs -d "\n" cp -t .
```

## 火焰图

```sh
# https://github.com/brendangregg/FlameGraph

# 采样 60 秒，采集频率 99 Hertz，[pid]就是要采集的进程 ID 号
perf record -F 99 -p [pid] -g -- sleep 60
perf script > out.perf
./stackcollapse-perf.pl out.perf > out.folded
./flamegraph.pl out.folded > out.svg
```

## 加密文件夹

```sh
# 加密
tar -zcvf - [dirname] | openssl aes256 -salt -k [password] | dd of=[dirname].bin
# 解密
dd if=[dirname].bin | openssl aes256 -d -k [password] | tar -zxf -
```

## WSL ping 不通 windows 主机

```sh
以管理员权限打开 powershell，执行下面命令：
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
```

## xlaunch

```sh
# 先更新apt-get
sudo apt-get update && sudo apt-get upgrade -y

# 安装XFCE桌面环境
sudo apt-get install xfce4 -y

# 将必要软件安装到XFCE桌面
sudo apt-get install xfce4-goodies -y

# xhost 命令
sudo apt-get install -y x11-xserver-utils

$ export DISPLAY=localhost:0
$ export DISPLAY=192.168.2.102:0
$ export DISPLAY=[xlaunch设备的IP地址]:0
$ xhost +
$ startxfce4
```

## iotop

查看哪些程序在对硬盘继续读写操作。

```sh
sudo apt install iotop
sudo iotop
```

## window powershell 设置环境变量

```sh
Set-Item -Path Env:https_proxy -Value "http://127.0.0.1:1080"
Set-Item -Path Env:http_proxy -Value "http://127.0.0.1:1080"
Set-Item -Path Env:all_proxy -Value "http://127.0.0.1:1080"
Get-ChildItem Env:
```

## cgdb

```sh
gdb 增强调试。
```

## PlantUML

<https://github.com/plantuml>

```sh
docker run -d -p 8080:8080 plantuml/plantuml-server:jetty
```

## trans 翻译

<https://github.com/soimort/translate-shell>

```sh
# 把任意语言翻译为 locale 语言
trans 你好
trans vorto
trans hello

# Translate a word into French
trans :fr word

# Translate a word into Chinese and Japanese
trans :zh+ja word

# English -> Chinese
trans en:zh "word processor"

# Chinese -> English
trans zh:en "你好"

# 默认使用 google 翻译
trans "你好"
# 使用 bing 翻译
trans "你好" -e bing
```


## vscode server

- 打开 vscode -> Help -> About, 找到 Commit
- 用下面连接下载
  - <https://update.code.visualstudio.com/commit:${commit_id}/server-linux-x64/stable>
- 上传 `vscode-server-linux-x64.tar.gz` 到服务器
- 创建目录：`mkdir -p ${HOME}/.vscode-server/bin/${commit_id}`
- 解压到上面的目录下: `tar -xzf vscode-server-linux-x64.tar.gz -C ${HOME}/.vscode-server/bin/${commit_id} --strip-components 1`
- `touch ${HOME}/.vscode-server/bin/${commit_id}/0`
