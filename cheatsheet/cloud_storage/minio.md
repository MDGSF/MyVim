# minio

- <https://min.io/>
- mc: <https://min.io/docs/minio/linux/reference/minio-mc.html>
- gosdk: <https://min.io/docs/minio/linux/developers/go/minio-go.html>
- k8s: <https://min.io/docs/minio/kubernetes/upstream/index.html>

```sh
# 在 k8s 集群里面运行 mc 容器
kubectl run my-mc -i --tty --image minio/mc:latest --command -- bash
# 连接到 my-mc 这个 pod 里面
kubectl exec my-mc -i --tty -- bash
# mc 连接到 minio server
mc alias set myminio http://127.0.0.1:9000 <user> <password>
# 查看 minio 信息
mc admin info myminio
# 查看 buckets and objects
mc ls myminio
mc ls myminio/mcaptest

# 创建一个叫 new_bucket_name 名字的 bucket
mc mb myminio/new_bucket_name

# 下载到本地
mc get myminio/mcaptest/aa.mcap test.mcap
# 查看文件信息
mc stat myminio/mcaptest/aa.mcap
# 生成一个下载链接
mc share download myminio/mcaptest/aa.mcap
# 下载并保存到文件中，指定 range 范围 [0, 1024)
curl -o test.mcap_0_1024 -r 0-1023 <url>
# 上传文件
mc put local_file remote_dir
mc put test.mcap myminio/mcaptest/
# 查看请求日志
mc admin trace -v -a --path mcaptest/NuScenes-v1.0-mini-scene-0061.mcap myminio > log.txt


# 管理和部署 minio 到 k8s 上面.
kubectl minio version
kubectl minio -h
# 查看 minio-operator 这个 namespace 下面的所有资源
kubectl --namespace minio-operator get all
# 把 minio 的一个端口映射到本地电脑，可以通过网页打开。
kubectl minio proxy

# 获取 minio 服务的端口号
kubectl get svc/console -n minio-operator -o json | jq -r '.spec.ports'
# 获取用于登录 minio console 的 token
kubectl get secret/console-sa-secret -n minio-operator -o json | jq -r '.data.token' | base64 -d
```

