#!/usr/bin/bash

[ $(id -u) -gt 0 ] && echo "请用root用户执行此脚本" && exit 1

IPADDR=$(ifconfig eth0 | grep "inet" | grep "netmask" | awk '{print $2}')
osVersion=$(lsb_release -d | awk -F ':' '{print $NF}' | xargs)
VERSION="2021-11-22"

