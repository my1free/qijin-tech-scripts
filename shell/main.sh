#!/bin/bash

source shellkit/config.sh
import files.sh
import base.sh

#lsdir .
array=("test" "a" "bbb")
if  array_contains $array "a" ;then
    echo "in"
else
    echo "not in"
fi

