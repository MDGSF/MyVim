#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath/..

if [ ! -d "$ProjectPath/tmp" ];then
  mkdir -p $ProjectPath/tmp
fi

cp -arf tutor.zh_cn.utf-8 $ProjectPath/tmp/tutor.zh_cn.utf-8

vim $ProjectPath/tmp/tutor.zh_cn.utf-8

