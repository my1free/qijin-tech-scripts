#!/bin/bash

# �г�ĳ��Ŀ¼�µ������ļ���������Ŀ¼�µ��ļ�
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

# ��һ��ȫ·���н�ȡ���ļ������·��
# Usage: sh get_file_path [full_path]
# Example: sh get_file_path /home/test/mm.txt
# Output: /home/test/
function get_file_path()
{
}

# ��һ��ȫ·���н�ȡ�ļ�������
# Usage: sh get_file_name [full_path]
# Example: sh get_file_path /home/test/mm.txt
# Output: mm.txt
function get_file_name()
{
}

# ȥ���ļ��ĺ�׺��
# Usage: remove_file_suffix [file]
# Example: remove_file_suffix test.java
# Output: test
function remove_file_suffix()
{
}
