#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath/..

if [ ! -d "$ProjectPath/tmp" ];then
  mkdir -p $ProjectPath/tmp
fi

cp -arf vimtutor_ch.txt $ProjectPath/tmp/vimtutor_ch.txt

vim $ProjectPath/tmp/vimtutor_ch.txt
