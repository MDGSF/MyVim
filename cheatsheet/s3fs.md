# s3fs

```sh
# 安装
sudo apt install s3fs

# 把密钥写入文件
echo <access-key>:<secret-key> > ${HOME}/.passwd-s3fs

# 在后台运行
s3fs cdn ~/minio/cdn -o passwd_file=${HOME}/.passwd-s3fs,use_path_request_style,url=https://minio.yttsp.com:9000

# 在前台运行，输出日志
s3fs cdn ~/minio/cdn -o passwd_file=${HOME}/.passwd-s3fs,use_path_request_style,url=https://minio.yttsp.com:9000  -o dbglevel=info -f -o curldbg

# 卸载
sudo umount -f ~/minio/cdn
```
