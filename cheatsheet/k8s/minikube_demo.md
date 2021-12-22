# minikube demo

```sh
minikube version
minikube start

# kubectl action resource
# kubectl get - 列出资源
# kubectl describe - 显示有关资源的详细信息
# kubectl logs - 打印 pod 和其中容器的日志
# kubectl exec - 在 pod 中的容器上执行命令


# 查看版本号
kubectl version
# 查看集群信息
kubectl cluster-info
# 查看 nodes 列表
kubectl get nodes

# 创建一个 delpoyment
# 名字是 kubernetes-bootcamp
# 使用镜像 gcr.io/google-samples/kubernetes-bootcamp:v1
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
# 查看 deployments 列表
kubectl get deployments

# 启动 proxy，在 host 和 kubernetes cluster 之间
# 会监听在 http://localhost:8001
kubectl proxy
# 查看 proxy 的版本
curl http://localhost:8001/version
# 获取 pod 名字
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
# 根据 pod 名字查看 pod 信息
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/

# 查看 pods 列表
kubectl get pods
# 查看 pods 详细信息
kubectl describe pods
# 启动 proxy
kubectl proxy
# 获取 pod 名字
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
# 根据 pod 名字查看 pod 的输出
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
# 根据 pod 名字查看日志输出
kubect logs $POD_NAME
# 在 pod 里面的唯一 container 里面执行命令 env
kubectl exec $POD_NAME -- env
# 进入 pod 里面的唯一 container 的 bash 终端
kubectl exec -ti $POD_NAME -- bash


# 应用外部可见
# 查看 pods 列表
kubectl get pods
# 查看 services 列表
kubectl get services
# 创建一个 service，名字是 kubernetes-bootcamp
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
# 再次查看 services 列表
kubectl get services
# 查看 kubernetes-bootcamp 这个 service 的详细信息
kubectl describe services/kubernetes-bootcamp
# 获取 kubernetes-bootcamp 这个 service 的对外 port 端口号
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
# 从外部访问服务
curl $(minikube ip):$NODE_PORT

# 查看 deployment 详细信息
kubectl describe deployment
# 根据标签查询 pods 列表
kubectl get pods -l app=kubernetes-bootcamp
# 根据标签查询 services 列表
kubectl get services -l app=kubernetes-bootcamp
# 获取 pod 名字
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
# 给 pod 添加标签
kubectl label pods $POD_NAME version=v1
# 查看 pod 详细信息
kubectl describe pods $POD_NAME
# 根据标签查询 pods 列表
kubectl get pods -l version=v1

# 根据标签删除 service
kubectl delete service -l app=kubernetes-bootcamp
# 查询 services 列表
kubectl get services
# 从外部访问服务，删掉 service 之后就没法访问了
curl $(minikube ip):$NODE_PORT


# 应用可扩展
# 查看 deployments 列表
kubectl get deployments
# 查看 Deployment 创建的 ReplicaSet
# ReplicaSet 名字的格式 [DEPLOYMENT-NAME]-[RANDOM-STRING]
kubectl get rs
# 扩展 kubernetes-bootcamp 这个 deployment 为 4 个副本
kubectl scale deployments/kubernetes-bootcamp --replicas=4
# 再次查看 deployments 列表
kubectl get deployments
# 查看下 pods 列表
kubectl get pods -o wide
# 查看 kubernetes-bootcamp 这个 deployment 的详细信息
kubectl describe deployments/kubernetes-bootcamp
# 查看 kubernetes-bootcamp 这个 service 的详细信息
kubectl describe services/kubernetes-bootcamp
# 获取 kubernetes-bootcamp 这个 service 的对外 port 端口号
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
# 从外部访问服务，因为有4个副本，所以每次访问都会被自动分配到不同的副本上
curl $(minikube ip):$NODE_PORT
# 把 kubernetes-bootcamp 这个 deployment 的副本修改为 2
kubectl scale deployments/kubernetes-bootcamp --replicas=2
# 再次查看 deployments 列表
kubectl get deployments
# 查看下 pods 列表，可以看到只有两个 pod 了
kubectl get pods -o wide


# 应用更新
# 查看 deployments 列表
kubectl get deployments
# 查看 pods 列表
kubectl get pods
# 查看 pods 的详细信息
kubectl describe pods
# 更新 kubernetes-bootcamp 这个 deployments 的 image 镜像
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
# 查看 pods 列表
kubectl get pods
# 查看 kubernetes-bootcamp 这个 service 的详细信息
kubectl describe services/kubernetes-bootcamp
# 获取 kubernetes-bootcamp 这个 service 的对外 port 端口号
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
# 从外部访问服务
curl $(minikube ip):$NODE_PORT
# ?? 看着像是查看下是不是更新成功了
kubectl rollout status deployments/kubernetes-bootcamp
# 查看 pods 的详细信息
kubectl describe pods

# 更新了一个错误的 v10 不存在的版本
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10
kubectl get deployments
kubectl get pods
kubectl describe pods
kubectl rollout undo deployments/kubernetes-bootcamp # 回退版本
kubectl get pods
kubectl describe pods
```

