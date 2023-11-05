# docker

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

docker save d1:v1.0.0 -o d1_v1.0.0.tar

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

## docker-compose

```sh
# 查看帮助文档
docker-compose -h

# 启动
docker-compose up -d
# 重启
docker-compose restart
# 关闭
docker-compose down
# 查看运行状态
docker-compose ls
```



