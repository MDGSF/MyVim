#!/usr/bin/env bash

set -e

ScriptPath=$(cd `dirname $0` && pwd)
ProjectPath=$ScriptPath

cp -arf $ProjectPath/tmuxconfs/tmux.conf ~/.tmux.conf

