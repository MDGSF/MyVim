# python

```sh
# 创建虚拟环境 .env
python -m venv .env
source .env/bin/activate
deactivate

# 创建虚拟环境 myenv
python -m venv myenv
source myenv/bin/activate
deactivate

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

```sh
# pipenv
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pipenv

# 修改源，在 Pipfile 中添加如下内容
[[source]]
url = "https://pypi.tuna.tsinghua.edu.cn/simple"
verify_ssl = true
name = "tsinghua"


# 查看帮助文档
pipenv -h
# 检测当前项目对应的虚拟环境是否存在，不存在则自动创建项目所需要的环境
pipenv shell
# 虚拟环境安装包
pipenv install
列出本地工程的路径：pipenv --where
列出虚拟环境路径：pipenv --venv
```

```sh
# pyenv
# https://github.com/pyenv/pyenv
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
pip list --format=freeze > requirements.txt

# 清华源
https://pypi.tuna.tsinghua.edu.cn/simple
# 中国科学技术大学
https://pypi.mirrors.ustc.edu.cn/simple
```

```sh
# 升级 pip
python -m pip install --upgrade pip
python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip

# 清华源设为默认
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```
