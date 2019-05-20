#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath

cd $ProjectPath

echo "set runtimepath+=${ProjectPath}

source $ProjectPath/vimrcs/basic.vim
source $ProjectPath/vimrcs/filetypes.vim
source $ProjectPath/vimrcs/plugins_config.vim
source $ProjectPath/vimrcs/plugins_cscope_maps.vim
source $ProjectPath/vimrcs/extended.vim
source $ProjectPath/vimrcs/terminal.vim

try
source $ProjectPath/my_configs.vim
catch
endtry" > ~/.vimrc

echo "Installed the Vim configuration successfully!"
