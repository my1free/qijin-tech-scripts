#!/bin/bash

# 注意!!!!!看这里，看这里!!!!!
# 不要执行这个脚本，执行也没用。在任何需要此脚本的地方添加代码:
# source config.sh 

# @Reference: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# @Reference: https://askubuntu.com/questions/528928/how-to-do-underline-bold-italic-strikethrough-color-background-and-size-i
# Color
# no color
NC='\033[0m'
# white color
WHITE='\033[1;37m'
# black color
BLACK='\033[0;30m'
# red color
RED='\033[0;31m'
# light red color
LIGHT_RED='\033[1;31m'
# green color
GREEN='\033[0;32m'
# light green color
LIGHT_GREEN='\033[1;32m'
# blue color
BLUE='\033[0;34m'
# light blue color
LIGHT_BLUE='\033[1;34m'
LB=$LIGHT_BLUE
# cyan color
CYAN='\033[01;36m'
# purple color
PURPLE='\033[0;35m'
# light purple color
LIGHT_PURPLE='\033[1;35m'
# light gray color
LIGHT_GRAY='\033[0;37m'
# dark gray
DARK_GRAY='\033[1;30m'
# yellow color
YELLOW='\033[1;33m'


# bold
# BOLD=$(tput bold)
PLAIN='\033[0m'
P=$PLAIN
BOLD='\033[1m'
B=$BOLD
ITALIC='\033[3m'
I=$ITALIC
UNDERLINE='\033[4m'
U=$UNDERLINE
# reset 
NORMAL=$(tput sgr0)
# add underline
UNDERLINE=$(tput smul)
# remove underline
REMOVE_UNDERLINE=$(tput rmul)

RB=$RED$BOLD


INFO="${LB}[INFO]"
SUCCESS="${YELLOW}[SUCCESS]"
V=$SUCCESS
WARNING="${YELLOW}[WARNING]"
WARN=$WARNING
ERROR="${RED}[ERROR]"
ERR=$RB

h1=${RED}${BOLD}

tab1="    "
tab2=$tab1$tab1
tab3=$tab2$tab1

function import()
{
    if [ $# -lt 1 ];then
        echo "$ERR illegal import synax"
        echo "$tab1 Usage: import [script]"
        exit 1
    fi
    classpath=("." "kit" "shell_kit" "shellkit")
    script=$1
    find=false
    for path in ${classpath[@]};do
        file=$path/$script
        if [ -f $file ];then
            source $file
            find=true
            break
        fi
    done
    if [ $find = false ];then
        echo "ERR $script not found"
    fi
}

#echo "$WARNING asdfad"
#echo "$INFO asdf"
#echo "$ERROR $BOLD adsf $NORMAL asdf"
#echo "$(bold adfasdf)"
#echo "$B bold $P asdf"
