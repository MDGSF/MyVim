# debug

```sh
sudo ktctl connect --kubeconfig ~/.kube/config --namespace default
.\ktctl.exe connect --kubeconfig config --namespace default
```

```sh
kubectl run mybusybox -i --tty --image busybox:latest --command -- sh
kubectl exec mybusybox -i --tty -- sh

kubectl run my-mc -i --tty --image minio/mc:latest --command -- bash
kubectl exec my-mc -i --tty -- sh

kubectl run mydbg -i --tty --image mydbg:latest --command -- bash
kubectl exec mydbg -i --tty -- bash
```

```sh
# 上传本地文件到指定 pod 的指定路径下
kubectl cp localfile.txt my-namespace/my-pod:/app/data/
# 如果一个 pod 中有多个容器，还需要指定容器。
kubectl cp localfile.txt my-namespace/my-pod:/app/data/ -c my-container

kubectl cp localfile.txt default/mydbg:/
```

