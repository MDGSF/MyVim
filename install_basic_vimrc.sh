#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath

cat $ProjectPath/vimrcs/basic.vim > ~/.vimrc
echo "Installed the Vim configuration successfully!"

