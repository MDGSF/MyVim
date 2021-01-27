#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath

cat $ProjectPath/vimrcs/basic.vim > ~/.vimrc

mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.swp
mkdir -p ~/.vim/.undo

echo "Installed the Vim configuration successfully!"

