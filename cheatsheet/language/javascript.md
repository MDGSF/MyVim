# javascript nodejs

```sh
# 使用 nvm 进行版本管理
# https://github.com/nvm-sh/nvm
nvm ls

# 安装指定版本到全局环境
https://github.com/nodesource/distributions
```

## npm

- 已经过期的源
  - https://npm.taobao.org
  - https://registry.npm.taobao.org
- 淘宝最新源
  - https://npmmirror.com
  - https://registry.npmmirror.com

```sh
npm init
npm install xxx
npm --registry https://registry.npmmirror.com install
npm --registry https://registry.npmmirror.com install xxx

# 查询源
npm config get registry
# 设置淘宝源
npm config set registry https://registry.npmmirror.com
# 设置官方源
npm config set registry https://registry.npmjs.org
```

## yarn

```sh
# 安装 yarn
npm install -g yarn --registry=https://registry.npmmirror.com

# 查询源
yarn config get registry
# 更换国内源
yarn config set registry https://registry.npmmirror.com
# 恢复官方源
yarn config set registry https://registry.yarnpkg.com
# 删除注册表
yarn config delete registry
```

## cnpm

- https://github.com/cnpm/cnpm
- https://npmmirror.com/

```sh
npm install -g cnpm --registry=https://registry.npmmirror.com

echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npmmirror.com \
       --cache=$HOME/.npm/.cache/cnpm \
       --disturl=https://npmmirror.com/mirrors/node \
       --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc

cnpm install xxx
```

