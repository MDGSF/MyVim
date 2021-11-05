# cheatsheet

## 获取 bash 版本号

```sh
# 方法一
bash --version

# 方法二
echo "${BASH_VERSION}"
```

## 从 bash 切换为 zsh

```sh
sudo apt install zsh

# 设置默认 shell 为 zsh
chsh -s /usr/bin/zsh
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

rg Rust 查找 Rust
rg Rust -i 忽略大小写

指定文件后缀查找
rg pcs-agent -w -g '*.go'
```

## 压缩 解压

```sh
把 xxx 压缩为 xxx.tar.gz
tar -zcvf xxx.tar.gz xxx

解压 xxx.tar.gz 到当前目录
tar -zxvf xxx.tar.gz


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

## dd 命令

```sh
# 创建一个 4G 大小的空文件
dd if=/dev/zero of=4G.txt count=4096 bs=1MB
```

## passwd 重置密码

```sh
passwd username
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

mysql -uhuangjian -p
select * from mysql.user;

格式化输出结果
select * from mysql.user\G

select * from table_name;
select count(*) from table_name;

" 把某个数据库的所有权限，授权给某个用户
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'%';
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
export ALL_PROXY="socks5://127.0.0.1:1080"

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
```

## javascript nodejs

```sh
# 使用 nvm 进行版本管理
# https://github.com/nvm-sh/nvm
nvm ls
```

## python

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

