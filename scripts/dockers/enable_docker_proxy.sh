#!/usr/bin/env bash

set -e

ScriptPath=$(cd "$(dirname "$0")" && pwd)
mkdir -p /etc/systemd/system/docker.service.d
cp -arf $ScriptPath/http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
sudo systemctl daemon-reload
sudo systemctl restart docker

