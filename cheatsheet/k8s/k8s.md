# k8s

## 资源

https://kubernetes.io/docs/reference/kubectl/cheatsheet/
https://yeasy.gitbook.io/docker_practice/

## kubectl get

```sh
kubectl version # 查看版本号
kubectl cluster-info # 查看集群信息

kubectl get nodes
kubectl get deployments
kubectl get pods
kubectl get pods --show-labels # 查询 pods 的时候，显示标签
kubectl get services
kubectl get jobs
kubectl get replicasets
kubectl get replicasets <replicaset_name> -o yaml | less
kubectl get ing/ingress # 获取 Ingress 信息
```

## kubectl delete

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

```sh
# 常用标签
tie: front, back
env: test, dev, gray, prod
```

```sh
# 查看 pod 的标签
kubectl get pods --show-labels
# 添加标签
kubectl label pods <pod_name> key=value
# 更新标签
kubectl label pods <pod_name> key=value --overwrite
# 删除标签
kubectl label pods <pod_name> key-

# 根据标签筛选 pod
kubectl get pods --show-labels -l key=value

# 根据标签筛选 pod，筛选出 env=test 并且 tie=front 的 pod，逗号表示与的关系
kubectl get pods --show-labels -l env=test,tie=front
# 根据标签筛选 pod，筛选出 env=test 或者 env=dev 的 pod
kubectl get pods --show-labels -l 'env in (test, dev)'
```

## annotate 注解

```sh
# 查看 pod 的注解
kubectl get pods <pod_name> -o yaml | less
# 添加注解
kubectl annotate pods <pod_name> key=value
```

## job

```sh
# 根据 job 名字获取所有的 pods
kubectl get pods --selector=job-name=bash-for-loop
kubectl get pods --selector=job-name=bash-for-loop -o json
kubectl get pods -l job-name=bash-for-loop -o yaml | less
```

