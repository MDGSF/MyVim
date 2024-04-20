#!/usr/bin/env bash

# 定义私有仓库地址和命名空间
registry_url="myregistry:5000"
namespace="myorg"

# 检查是否传入了一个参数
if [ $# -ne 1 ]; then
    echo "Usage: $0 <public_image>:<tag>"
    exit 1
fi

# 获取公共镜像名称及标签
public_image=$1

# 解析出公共镜像的名称和标签
image_name=$(echo $public_image | cut -d ':' -f 1)
image_tag=$(echo $public_image | cut -d ':' -f 2-)

# 如果没有提供标签，默认为 latest
if [ -z "$image_tag" ]; then
    image_tag="latest"
fi

# 私有镜像的完整名称
private_image="$registry_url/$namespace/$image_name:$image_tag"

# 拉取公共镜像
echo "Pulling public image..."
docker pull "$public_image"

# 重新标记镜像
echo "Tagging the image for your private registry..."
docker tag "$public_image" "$private_image"

# 登录私有仓库（如果私有仓库需要登录）
# 注：这里的 username 和 password 需要替换为你实际的登录凭证
# 或者你可以提前通过 `docker login` 登录
#echo "Logging into your private registry..."
#docker login $registry_url -u <username> -p <password>

# 推送镜像到私有仓库
echo "Pushing the image to your private registry..."
docker push "$private_image"

echo "Done."
