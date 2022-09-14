# oss

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

