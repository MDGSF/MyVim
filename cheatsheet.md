# cheatsheet

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

## nc 命令

```sh
# 在本地启动一个 TCP 服务器
nc -l 127.0.0.1 1234
# TCP 客户端去连接本地的 TCP 服务器
nc 127.0.0.1 1234

# 启动一个远程 bash 终端，在服务端执行如下命令
rm -f /tmp/f; mkfifo /tmp/f
cat /tmp/f | /bin/sh -i 2>&1 | nc -l 127.0.0.1 1234 > /tmp/f
# 在客户端执行
nc 127.0.0.1 1234
```

## ip 命令

```sh
# 主机: veth-a
# nstest: veth-b

# 创建一个名为nstest的network namespace
sudo ip netns add nstest
# 列出系统中已经存在的network namespace
sudo ip netns list
# 删除nstest
sudo ip netns delete nstest

# 在network namespace中执行一条命令：
# sudo ip netns exec <network namespace name> <command>

# 显示nstest namespace中的网卡信息
sudo ip netns exec nstest ip addr
# 启动一个nstest namespace的终端shell
sudo ip netns exec nstest bash

# 启动nstest namespace中的回环设备
sudo ip netns exec ip link set dev lo up

# 在主机上创建两张虚拟网卡veth-a和veth-b，可以通过 ip link 查看
sudo ip link add veth-a type veth peer name veth-b

# 将veth-b设备添加到nstest namespace中
sudo ip link set veth-b netns nstest

# 查看主机的网卡信息
ip link

# 查看nstest namespace的网卡信息
sudo ip netns exec nstest ip link

# 在主机上为veth-a配置IP并启动
sudo ip addr add 10.0.0.1/24 dev veth-a
sudo ip link set dev veth-a up

# 为nstest namespace中的veth-b配置IP并启动
sudo ip netns exec nstest ip addr add 10.0.0.2/24 dev veth-b
sudo ip netns exec nstest ip link set dev veth-b up

# 查看veth-a和veth-b之间的连通性
sudo ip route
ping 10.0.0.2
sudo ip netns exec nstest ping 10.0.0.1
```

```sh
# ns1: veth-a
# ns2: veth-b

# 创建两个network namespace
sudo ip netns add ns1
sudo ip netns add ns2
sudo ip netns list

# 创建veth pair设备veth-a, veth-b
sudo ip link add veth-a type veth peer name veth-b

# 将网卡分别放到两个network namespace中
sudo ip link set veth-a netns ns1
sudo ip link set veth-b netns ns2

# 启动两张网卡
sudo ip netns exec ns1 ip link set dev veth-a up
sudo ip netns exec ns2 ip link set dev veth-b up

# 分配IP
sudo ip netns exec ns1 ip addr add 10.0.0.1/24 dev veth-a
sudo ip netns exec ns2 ip addr add 10.0.0.2/24 dev veth-b

# 验证连通
sudo ip netns exec ns1 ping 10.0.0.2
sudo ip netns exec ns2 ping 10.0.0.1
```

## 数据库 MySQL

```sql
"mysql+mysqldb://用户名:密码@ip地址:端口号/databasename?charset=utf8mb4"
"mysql+mysqldb://huangjian:123456@localhost:3306/databasename?charset=utf8mb4"

mysql -uroot -p -h10.154.0.43 -P3341

mysql -uhuangjian -p
select * from mysql.user;

格式化输出结果
select * from mysql.user\G

select * from table_name;
select count(*) from table_name;

" 把某个数据库的所有权限，授权给某个用户
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'%';
```

## redis

```sh
./redis-cli -h 127.0.0.1 -p 6379
```

## 挂载

```sh
挂载 nas 网盘到目录 /home/huangjian/Test/dataset
sudo mount -t cifs -o username=黄剑,password=xxxxxxxxx,uid=huangjian,_netdev,iocharset=utf8,vers=2.0,nofail //192.168.6.63/dataset /home/huangjian/Test/dataset

挂载虚拟机的 /mnt/share 目录和主机的 share 目录进行共享
sudo mount -t vboxsf share /mnt/share
```

## oss

配置文件 ~/.ossutilconfig

```text
[Credentials]
endpoint=oss-cn-shenzhen.aliyuncs.com
accessKeyID=xxx
accessKeySecret=xxx
```

```sh
ossutil ls

# 复制文件 sil.tar.gz 到当前目录
ossutil cp oss://minieye-anno/test/sil.tar.gz .

# 复制目录 one 到当前目录，包括 one
ossutil cp -r oss://minieye-anno/test/tasks/one .

# 复制目录 one 到当前目录，不包括 one，只复制 one 目录下的文件和子目录
ossutil cp -r oss://minieye-anno/test/tasks/one/ .
```

## obs

## aws

```sh
# https://github.com/aws/aws-cli
# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html
# 安装方法：从 github 上面下载压缩包，解压后按照 README 的方法即可安装成功。
# s3：对象云存储，类似于 oss，obs
# ECR：Docker Registry，用来保存 Docker 镜像

# 上传本地的 docker 镜像到 aws
# https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html

```

## git

```sh
# git 使用代理

export https_proxy=http://127.0.0.1:1080 http_proxy=http://127.0.0.1:1080 all_proxy=socks5://127.0.0.1:1080

export ALL_PROXY="socks5://127.0.0.1:1080"

ALL_PROXY="socks5://127.0.0.1:1080" git clone https://xxx
ALL_PROXY="socks5://127.0.0.1:1080" git pull

git clone git@git.minieye.tech:huangjian/demo.git
git clone https://git.minieye.tech/huangjian/demo.git
git clone git@github.com:MDGSF/RustPractice.git
git clone https://github.com/MDGSF/RustPractice.git
git push
git pull

# 创建一个新的分支，并且切换到新的分支
git checkout -b newbranch

# 切换到 branchname 对应的分支
git checkout branchname

# 合并 branchname 分支到当前分支
git merge branchname

# 查看当前分支状态
git status | git st | gst

git diff

git remote -v
origin  https://github.com/MDGSF/RPractice.git (fetch)
origin  https://github.com/MDGSF/RPractice.git (push)

git remote rm origin
git remote add origin https://github.com/MDGSF/RPractice.git

# 查看所有 tag
git tag

# 添加新的标签
git tag <tagName>
git tag v1.0.0

# 将本地 tag 推送到服务器
git push --tags

# 从指定 tag 检出代码到新的 branch
git checkout -b <newBranchName> <tagName>

# 删除远程 tag
git push origin --delete tag <tagName>

# 删除本地 tag
git tag -d <tagName>

# 指定 commitID 打 tag
git tag <tagName> <commitID>

# 配置 git ls 命令，获取日志
git config --global alias.ls "log --color --graph --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Cblue %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit"

# 删除仓库下不在 git 管理下的文件
git clean -ffxd

# git 乱码问题
git config --global core.quotepath false
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
```

## Rust

```sh
# 在当前目录使用 nightly 版本的 rust
rustup override add nightly
```

## ruby

```sh
# 使用 rbenv 进行版本管理
# https://github.com/rbenv/rbenv
rbenv install -l
rbenv install 3.0.2
rbenv versions
rbenv global 3.0.2
rbenv global
rbenv local 2.7.4
rbenv local
rbenv rehash # 切换ruby版本之后必须执行这个命令

# 查看文档
# https://ruby-doc.org/
ri Array
ri Array.sort
ri Hash#each
ri Math::sqrt

# 执行 ruby 脚本
ruby hello.rb
# 启动交互式环境
irb

# 指定编码
ruby -E UTF-8 hello.rb
irb -E UTF-8

# 简化 irb 的输出结果
irb --simple-prompt

# https://mirror.tuna.tsinghua.edu.cn/help/rubygems/
# 添加 TUNA 源并移除默认源
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
# 列出已有源，应该只有 TUNA 一个
gem sources -l
# 使用以下命令替换 bundler 默认源
bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems

gem list # 列出本地已经安装的
gem search redis # 搜索远程
gem search -l sqlite # 搜索本地
gem install sqlite3 # 安装
```

## javascript nodejs

```sh
# 使用 nvm 进行版本管理
# https://github.com/nvm-sh/nvm
nvm ls

# 安装指定版本到全局环境
https://github.com/nodesource/distributions
```

## python

```sh
python -m venv .env
source .env/bin/activate
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

```sh
安装 conda，到清华源去下载 anaconda，并配置 conda 从清华源镜像下载
使用 conda 来安装不同版本的 python
conda create -n hello python=3.7.2
conda activate hello

再安装 virtualenv，使用 virtualenv 来管理不同项目的依赖
sudo apt install virtualenv

在项目工程目录下执行下面命令：
virtualenv --python=$(which python3) venv
source venv/bin/activate
pip install -r requirements.txt

pip 使用清华源
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package

生成 requirements.txt 文件
pip freeze > requirements.txt
```

## docker

```sh
docker --help
docker image ls | docker images
docker container ls | docker ps

docker run hello-world
docker run -it ubuntu bash

# docker run 带环境变量
docker run -it --rm -e TASK_COUNT=250 -e TASK_INDEX=0 render3d_v2

docker build -t myubuntu16 .
docker build --build-arg ALL_PROXY="socks5://172.26.96.1:1080" -t ruby-hello .

docker pull [选项] [Docker Registry 地址[:端口号]/]仓库名[:标签]

# export 用于容器，save 和 push 用于镜像
# export 和 import 会丢失历史，save 和 load 则不会
docker export # Export a container's filesystem as a tar archive
docker import # Import the contents from a tarball to create a filesystem image
docker save # Save one or more images to a tar archive
docker load # Load an image from a tar archive or STDIN
docker push
docker pull

# 重命名镜像
docker image tag old_name:latest new_name:latest
docker rmi old_name

# 数据卷
docker volume ls

# 创建了一个随机名字的 volume，并挂载到容器的 /data 目录下。
docker run -it --rm -v /data ubuntu bash

# 创建了一个指定名字的 volume，并挂载到容器的 /data 目录下。
docker volume create vol_simple
docker run -it --rm -v vol_simple:/data ubuntu bash

# 将宿主机上的目录 /home/huangjian/git 挂载到容器的 /data 目录下。
docker run -it --rm -v /home/huangjian/git:/data ubuntu bash

# 先创建一个作为数据共享的容器
# 然后再创建两个容器，使用第一个容器作为数据共享
docker run --name vol_data -v /data ubuntu echo "This is data-only container"
docker run -it --name vol_share1 --volumes-from vol_data ubuntu bash
docker run -it --name vol_share2 --volumes-from vol_data ubuntu bash

# docker run --rm
# --rm 会在容器停止时删除容器，和容器所挂载的 volume
# -v vol_simple:/containerdir    volume名字是vol_simple，可读写
# -v /container                  volume名字是随机ID，可读写
# -v /hostdir:/containerdir:ro   只读

# 备份 volume，挂载了两个 volume
# 第一个 volume：来自 vol_data 容器共享的 /data
# 第二个 volume：将宿主机的当前目录挂载到 /backup
docker run --rm --volumes-from vol_data -v $(pwd):/backup ubuntu tar cvf
/backup/data.tar /data

# 恢复 volume
docker run -it --name vol_bck -v /data ubuntu bash
docker run --rm --volumes-from vol_bck -v $(pwd):/backup ubuntu tar xvf
/backup/data.tar -C /


# docker 网络
docker network create backend
docker network create frontend
docker network ls
docker run -it --rm --name container1 --net backend busybox
docker run -it --rm --name container2 --net backend busybox
docker run -it --rm --name container3 --net frontend busybox
# 把 container2 加入 frontend 的网络中
docker network connect frontend container2

# 可以在 container1 里面执行 ping c2
docker network create isolated_nw
docker run -it --rm --net=isolated_nw --name=container1 --link container2:c2 busybox
docker run -it --rm --net=isolated_nw --name container2 busybox


# 删除 15 天前创建的，并且没有被使用的镜像
docker image prune -a --filter "until=$(date +'%Y-%m-%dT%H:%M:%S' --date='-15 days')"


# 在 docker 中使用 firefox
export DISPLAY=:0
xhost +
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  firefox
xhost -


# 在 docker 中运行 mysql
docker run -it --rm mysql:tag --verbose --help
docker run --name mysql5.7 -e MYSQL_ROOT_PASSWORD=1234567890 -d mysql:5.7.36
docker run --name mysql5.7 \
  -e MYSQL_ROOT_PASSWORD=1234567890 -d \
  -p 3306:3306 \
  mysql:5.7.36 \
  --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci


# 统计容器状态信息
docker stats
docker stats --no-stream

# 查看容器信息
docker inspect <containerID>
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

## 系统服务 systemd

```sh
# 去掉开机启动
systemctl disable pcs-agent

# 立刻停掉
systemctl stop pcs-agent
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

# 查看 ufw 默认策略
ufw status verbose
# 修改 ufw 默认策略为 allow
ufw default allow
# 修改 ufw 默认策略为 deny
ufw default deny
```

## sqlite

```sh
# 查看版本
sqlite3 --version
# 打开一个数据库
sqlite3 data.db
# 查看所有的表格，前面需要一个点
.tables
# 查询表格数据
select * from tablename;
```

## ab 测试

```sh
# 安装工具
sudo apt-get install apache2-utils

# -n 1000 表示总的请求数量是 1000
# -c 10 表示并发请求数量是 10
ab -n 1000 -c 10 http://127.0.0.1:8080/hello

# 深度测试可以考虑 JMeter
```

## clangformat

```
clang-format -style=google -dump-config > .clang-format
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

