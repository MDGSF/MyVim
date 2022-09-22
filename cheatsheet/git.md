# git

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


# 查看本地分支
git branch

# 查看远程分支
git branch -r

# 删除本地分支
git branch -d local_test
git branch -D local_test

# 删除远程分支
git branch -r -d origin/huangjian_test
git push origin :huangjian_test

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

## 大文件 git lfs

```sh
git lfs install
git lfs clone git@bitbucket.org:tpettersen/Atlasteroids.git
git lfs pull

# track all .ogg files in any directory
git lfs track "*.ogg"
# track files named music.ogg in any directory
git lfs track "music.ogg"
# track all files in the Assets directory and all subdirectories
git lfs track "Assets/"
# track all files in the Assets directory but not subdirectories
git lfs track "Assets/*"

# list all track
git lfs track
```

