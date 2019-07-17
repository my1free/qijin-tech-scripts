#!/bin/bash

function array_contains()
{
    param_count=$#
    if [ $param_count -lt 2 ];then
        echo "${h1}[function: array_contains] ${NORMAL}two paramters required."
        echo "${tab1}Usage: ${UNDERLINE}array_contains [array] [value] ${REMOVE_UNDERLINE}"
        echo "${tab2}array: the array of values" 
        echo "${tab2}value: check whether this value is in the array"
        exit 1
    fi
    array=$1
    for i in ${array[@]};do
        echo $i
    done
    value=$2
    echo $value
    if [[ " ${array[@]} " =~ " ${value} " ]];then
        return 0
    fi
    return 1
}

