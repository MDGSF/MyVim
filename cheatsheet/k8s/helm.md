# helm

```sh
# 添加一个 repo，指定 repo 的名字为 mysql-operator
helm repo add mysql-operator https://mysql.github.io/mysql-operator/

# 列出所有的 repo
helm repo list

# 更新 repo 信息
helm repo update

# 查看指定 repo 中的所有 charts 的版本
helm search repo mayastor --versions
helm search repo mysql-operator --versions

# 下载指定版本的 charts 到本地
helm pull mayastor/mayastor --version 2.5.0
helm pull mysql-operator/mysql-operator --version 2.1.2

# 下载 kafka 到本地
helm pull oci://registry-1.docker.io/bitnamicharts/kafka

# 安装指定的 charts
helm install my-mysql-operator mysql-operator/mysql-operator \
   --namespace mysql-operator --create-namespace
helm install my-mysql-operator ./mysql-operator-2.1.2 \
   --namespace mysql-operator --create-namespace
```

