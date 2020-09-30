#!/bin/bash

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

# A=("path" "get" "put")
# if [ $(contains "${A[@]}" "get") == "y" ]; then
#     echo "contains one"
# fi
