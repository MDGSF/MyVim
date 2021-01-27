#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath

cd $ProjectPath

echo "set runtimepath+=${ProjectPath}

source $ProjectPath/vimrcs/basic.vim
source $ProjectPath/vimrcs/small.vim
" > ~/.vimrc

cp $ProjectPath/editorconfig ~/.editorconfig

mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.swp
mkdir -p ~/.vim/.undo

echo "Installed small Vim successfully!"
