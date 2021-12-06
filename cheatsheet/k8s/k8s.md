# k8s

https://yeasy.gitbook.io/docker_practice/

## 常用命令

### 删除资源

```sh
kubectl delete TYPE RESOURCE -n NS  删除指定名称空间内的指定资源
kubectl delete TYPE --all -n NS  删除指定名称空间内的指定类型的所有资源
kubectl delete all -n NS 删除指定名称空间内的所有资源
kubectl delete all --all 删除所有名称空间内的所有资源
```

## 标签

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

## Kubenetes零基础快速入门

### kubectl

```sh
kubectl -h

kubectl create -f nginx.yaml
kubectl get nodes
kubectl get services # 列出所有的服务
kubectl get pods # 列出所有的pod
kubectl get pods -o wide # 以比较详细的方式列出当前命名空间中的pod
kubectl describe pods/nginx-xxx # 显示指定pod的详细信息
kubectl exec -it my-nginx-xxx -- /bin/bash # 在指定名字的容器中执行/bin/bash
kubectl exec nginx-controller-xxx -- ls # 在容器中执行 ls 命令
# 该命令用来创建一个应用。与kubectl create命令不同，在该命令中，所有的选项可以通过命令行指定。
kubectl run --image=nginx nginx-app --port=8080
kubectl delete pods/nginx-xxx # 删除指定名字的pod
```

### kubeadm

kubeadm是Kubernetes官方主推的用于快速安装Kubernetes集群的命令行工具。

```sh
kubeadm config: 指定初始化集群时使用的配置文件
kubeadm init: 初始化master节点
kubeadm join: 初始化node节点并加入集群
kubeadm reset: 重置当前节点，包括master节点和node节点
```

### Deployment

#### 什么是Deployment
Deployment的中文意思为部署、调度，它是在Kubernetes的版本1.2中新增加的一个核心概念。Deployment的实现为用户管理Pod提供了一种更为便捷的方式。用户可以通过在Deployment中描述所期望的集群状态，Deployment会将现在的集群状态在一个可控的速度下逐步更新成所期望的集群状态。与Replication
Controller基本一样，Deployment主要职责同样是为了保证Pod的数量和健康。Deployment的绝大部分的功能与Replication
Controller完全一样，因此，用户可以将Deployment看作是升级版的Replication
Controller。
与Replication Controller相比，除了继承Replication
Controller的全部功能之外，Deployment还有以下新的特性：
事件和状态查看：可以查看Deployment的升级详细进度和状态。
回滚：当升级Pod镜像或者相关参数的时候发现问题，可以使用回滚操作回滚到上一个稳定的版本或者指定的版本。
版本记录：每一次对Deployment的操作，都能保存下来，给予后续可能的回滚使用。
暂停和启动：对于每一次升级，都能够随时暂停和启动。
多种升级方案：主要包括重建，即删除所有已存在的Pod，重新创建新的Pod；滚动升级，即采用逐步替换的策略来升级Pod，Pod的滚动升级方案可以支持更多的附加参数。

#### Deployment与ReplicaSet
说到ReplicaSet对象，还是不得不提Replication Controller。在Kubernetes
v1.16之前，只有Replication
Controller对象，它的主要作用是确保Pod以用户指定的副本数运行，即如果有容器异常退出，Replication
Controller会自动创建新的Pod来替代，而异常多出来的容器也会自动回收。可以说，通过Replication
Controller，Kubernetes实现了集群的高可用性。
在新版本的Kubernetes中，建议使用ReplicaSet来取代Replication
Controller。ReplicaSet跟ReplicationController没有本质的不同，只是名字不一样，并且ReplicaSet支持集合式的选择器，而Replication
Controller只支持等式选择器。
虽然ReplicaSet也可以独立使用，但是Kubernetes并不建议用户直接操作ReplicaSet对象。而是通过更高层次的对象Deployment来自动管理ReplicaSet，这样就无需担心跟其他机制的不兼容问题，比如ReplicaSet不支持滚动更新，但Deployment支持，并且Deployment还支持版本记录、回滚、暂停升级等高级特性。这意味着用户几乎不会有机会去直接管理ReplicaSet。

#### 注意
用户不该手动管理由Deployment创建的ReplicaSet，否则就“篡越”了Deployment的职责。

#### 示例

```sh
kubectl get deployments
kubectl get replicaset
kubectl get pods
```

### DaemonSet

### Job

