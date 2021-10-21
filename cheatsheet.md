# cheatsheet

## find查找

```sh
删除当前目录，子目录下的所有 target 目录
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

复制文件 sil.tar.gz 到当前目录
ossutil cp oss://minieye-anno/test/sil.tar.gz .

复制目录 one 到当前目录，包括 one
ossutil cp -r oss://minieye-anno/test/tasks/one .

复制目录 one 到当前目录，不包括 one，只复制 one 目录下的文件和子目录
ossutil cp -r oss://minieye-anno/test/tasks/one/ .
```

## obs

## aws s3

## git

```sh
git 使用代理
export ALL_PROXY="socks5://127.0.0.1:1080"

git clone git@git.minieye.tech:huangjian/demo.git
git clone https://git.minieye.tech/huangjian/demo.git
git clone git@github.com:MDGSF/RustPractice.git
git clone https://github.com/MDGSF/RustPractice.git
git push
git pull

创建一个新的分支，并且切换到新的分支
git checkout -b newbranch

切换到 branchname 对应的分支
git checkout branchname

合并 branchname 分支到当前分支
git merge branchname

查看当前分支状态
git status | git st | gst

git diff

git remote -v
origin  https://github.com/MDGSF/RPractice.git (fetch)
origin  https://github.com/MDGSF/RPractice.git (push)

git remote rm origin
git remote add origin https://github.com/MDGSF/RPractice.git
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

docker build -t myubuntu16 .

在 docker 中使用 firefox
export DISPLAY=:0
xhost +
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  firefox
xhost -

在 docker 中运行 mysql
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

