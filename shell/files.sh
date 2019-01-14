#!/bin/bash

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
}

# 从一个全路径中截取文件名部分
# Usage: sh get_file_name [full_path]
# Example: sh get_file_path /home/test/mm.txt
# Output: mm.txt
function get_file_name()
{
}

# 去除文件的后缀。
# Usage: remove_file_suffix [file]
# Example: remove_file_suffix test.java
# Output: test
function remove_file_suffix()
{
}
