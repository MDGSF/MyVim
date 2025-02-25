#!/usr/bin/env bash

set -xe

pip download \
  --no-cache-dir \
  --dest="~/pypi" \
  --index=https://mirrors.aliyun.com/pypi/simple \
  --retries=100 \
  --timeout=86400 \
  $1
