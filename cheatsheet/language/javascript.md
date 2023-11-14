# javascript nodejs

```sh
# 使用 nvm 进行版本管理
# https://github.com/nvm-sh/nvm
nvm ls

# 安装指定版本到全局环境
https://github.com/nodesource/distributions
```

## npm

```sh
npm init
npm install xxx
npm --registry https://registry.npm.taobao.org install
npm --registry https://registry.npm.taobao.org install xxx
```

## cnpm

- https://github.com/cnpm/cnpm
- https://npmmirror.com/

```sh
npm install cnpm -g --registry=https://registry.npmmirror.com

echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npmmirror.com \
       --cache=$HOME/.npm/.cache/cnpm \
       --disturl=https://npmmirror.com/mirrors/node \
       --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc

cnpm install xxx
```

