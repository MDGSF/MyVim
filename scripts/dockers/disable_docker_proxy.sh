#!/usr/bin/env bash

set -e

rm -rf /etc/systemd/system/docker.service.d/http-proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker
