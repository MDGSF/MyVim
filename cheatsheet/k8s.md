# k8s

```sh
# 根据 labels { key: value } 进行过滤

# key值等于environment并且value值等于production
# environment = production

# key值等于tier并且value值不等于fronted
# tier != fronted

# 过滤出位于production环境但非前端的资源对象
# 使用逗号分隔
# environment=production,tier!=fronted

# key值等于environment并且value值等于production或qa的资源对象
# environment in (production, qa)

# key值等于tier并且value值不等于fronted且backend的资源对象
# tier notin (fronted, backend)

# key值等于partition的资源对象，不需要检查value值
# partition

# 过滤出key值partition且不处于qa环境的资源对象
# partition,environment notin (qa)

# partition in (customerA, customerB),environment!=qa

# 定义客户端上下文
kubectl config set-context dev --namespace=development
kubectl config set-context prod --namespace=production
# 切换到你希望进行操作的namespace
kubectl config use-context dev
# 查看当前所处的上下文
kubectl config view
```

## minikube demo

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

## 每天5分钟玩转Kubernetes

Kubernetes运行容器（Pod）与访问容器（Pod）这两项任务分别由Controller和Service执行。

### Controller

Kubernetes通常不会直接创建Pod，而是通过Controller来管理Pod的。Controller中定义了Pod的部署特性，比如有几个副本、在什么样的Node上运行等。为了满足不同的业务场景，Kubernetes提供了多种Controller，包括Deployment、ReplicaSet、DaemonSet、StatefuleSet、Job等

（1）Deployment是最常用的Controller，比如在线教程中就是通过创建Deployment来部署应用的。Deployment可以管理Pod的多个副本，并确保Pod按照期望的状态运行。
（2）ReplicaSet实现了Pod的多副本管理。使用Deployment时会自动创建ReplicaSet，也就是说Deployment是通过ReplicaSet来管理Pod的多个副本的，我们通常不需要直接使用ReplicaSet。
（3）DaemonSet用于每个Node最多只运行一个Pod副本的场景。正如其名称所揭示的，DaemonSet通常用于运行daemon。
（4）StatefuleSet能够保证Pod的每个副本在整个生命周期中名称是不变的，而其他Controller不提供这个功能。当某个Pod发生故障需要删除并重新启动时，Pod的名称会发生变化，同时StatefuleSet会保证副本按照固定的顺序启动、更新或者删除。
（5）Job用于运行结束就删除的应用，而其他Controller中的Pod通常是长期持续运行。

### Services

Deployment可以部署多个副本，每个Pod都有自己的IP，外界如何访问这些副本呢？
答案是Service。
Kubernetes Service定义了外界访问一组特定Pod的方式。
Service有自己的IP和端口，Service为Pod提供了负载均衡。

### Namespace

如果有多个用户或项目组使用同一个Kubernetes
Cluster，如何将他们创建的Controller、Pod等资源分开呢？答案就是Namespace。

### 安装

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

```sh
# kubeadm 安装

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following
on each as root:

kubeadm join 172.31.9.32:6443 --token cvi0eu.gt3gnrvxroajt9ru \
  --discovery-token-ca-cert-hash sha256:212a77035fd2652d97b3905ac8bcb0cfbd2244a337c807d8ca3698a0637d943e
```


