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


function top_n_by_mem()
{
    param_count=$#
    if [ $param_count -lt 2 ];then
        echo "${h1}[function: top_n_by_mem] ${NORMAL}two paramters is required."
        echo "${tab1}Usage: ${UNDERLINE}top_n_by_mem [n] [user] ${REMOVE_UNDERLINE}"
        echo "${tab2}n: how many lines to show"
        echo "${tab2}user: which user to show"
        exit 1
    fi
    n=$1
    user=$2
    exit 0
    top -o +%MEM | grep ${user} | head -n 10 | awk -F' ' '{print $1}'
}
# =============== os ================

# =============== syntax ================
# 判断数组中是否包含某个元素
# Example: 
# A=("path" "get" "put")
# if [ $(contains "${A[@]}" "get") == "y" ]; then
#   do something when contains
# fi
function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}


# =============== file && directory ================

# 列出某个目录下的所有文件。包含子目录下的文件
# Usage: sh list_files.sh [path]
# Example: sh list_files.sh /home
# Output: user1 user2 user3
function lsdir()
{
    local dir=$1
    # TODO check $dir must be a directory, not a file
    for i in `ls $dir`;do
        if [ -d "$dir/$i" ] ;then
            lsdir $dir/$i
        else
            file=$dir/$i
            echo $file
        fi
    done
}

# 从一个全路径中截取除文件名外的路径
# Usage: sh get_file_path [full_path]
# Example: sh get_file_path /home/test/mm.txt
# Output: /home/test/
function get_file_path()
{
    param_count=$#
    if [ $param_count -lt 1 ];then
        echo "${h1}[function: delete] ${NORMAL}one paramter is required."
        echo "${tab1}Usage: ${UNDERLINE}delete [path/file] ${REMOVE_UNDERLINE}"
        exit 1
    fi
}

# 从一个全路径中截取文件名部分
# Usage: sh get_file_name [full_path]
# Example: sh get_file_path /home/test/mm.txt
# Output: mm.txt
function get_file_name()
{
    param_count=$#
    if [ $param_count -lt 1 ];then
        echo "${h1}[function: delete] ${NORMAL}one paramter is required."
        echo "${tab1}Usage: ${UNDERLINE}delete [path/file] ${REMOVE_UNDERLINE}"
        exit 1
    fi
}

# 去除文件的后缀。
# Usage: remove_file_suffix [file]
# Example: remove_file_suffix test.java
# Output: test
function remove_file_suffix()
{
    param_count=$#
    if [ $param_count -lt 1 ];then
        echo "${h1}[function: delete] ${NORMAL}one paramter is required."
        echo "${tab1}Usage: ${UNDERLINE}delete [path/file] ${REMOVE_UNDERLINE}"
        exit 1
    fi
}

# 删除文件或者文件夹
# Usage: delete [file/path]
# Example: delete test.java | delete hehe/
function delete()
{
    param_count=$#
    if [ $param_count -lt 1 ];then
        echo "${h1}[function: delete] ${NORMAL}one paramter is required."
        echo "${tab1}Usage: ${UNDERLINE}delete [path/file] ${REMOVE_UNDERLINE}"
        exit 1
    fi
    file_or_path=$1
    if [ -f $file_or_path ];then
        /bin/rm -f $file_or_path
    else
        /bin/rm -rf $file_or_path
    fi
}
