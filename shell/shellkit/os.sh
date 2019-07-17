#!/bin/bash

source config.sh

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

top_n_by_mem 10 
