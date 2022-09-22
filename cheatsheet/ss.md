# shadowsocks

```sh
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
sslocal -c ~/opt/shadowsocks.json

shadowsocks.json 格式：
{
  "server": "服务器IP地址",
  "server_port": 服务器端口号,
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "password": "密码",
  "timeout":300,
  "method":"chacha20-ietf-poly1305 或 aes-256-cfb",
  "fast_open": false
}

export ss=192.168.2.102:1080
export https_proxy=http://$ss http_proxy=http://$ss all_proxy=socks5://$ss
```

