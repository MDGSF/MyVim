# HTTP

## http benchmark

```sh
## HTTP性能测试
https://github.com/denji/awesome-http-benchmark
```

### ab 测试

```sh
# 安装工具
sudo apt-get install apache2-utils

# -n 1000 表示总的请求数量是 1000
# -c 10 表示并发请求数量是 10
ab -n 1000 -c 10 http://127.0.0.1:8080/hello

# 深度测试可以考虑 JMeter
```

### wrk

```sh
# 安装 wrk
# https://github.com/wg/wrk
sudo apt install wrk

# This runs a benchmark for 30 seconds, using 12 threads,
# and keeping 400 HTTP connections open
wrk -t12 -c400 -d30s http://127.0.0.1:8080
```

### rewrk

```sh
# https://github.com/lnx-search/rewrk
```

