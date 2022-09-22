#!/usr/bin/env bash

export ss=192.168.2.102:1080
export https_proxy=http://$ss http_proxy=http://$ss all_proxy=socks5://$ss
