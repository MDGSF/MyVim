# Vim 修改远程的文件

```
vim scp://remoteuser@remote_IP_or_hostname/relative/path/of/file
```

```
Host serverName
HostName 10.0.18.12
User dev-jian
Port 22
IdentityFile ~/.ssh/id_rsa
```

```
vim scp://dev-jian@serverName/test.txt
vim scp://serverName/test.txt
```

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

