#!/usr/bin/env bash

# 更新当前目录下，包括子目录中所有文件的时间为当前时间。
find . -exec touch {} \;

# 更新当前目录下，包括子目录中所有文件的所有者
sudo chown -R dev:dev *
