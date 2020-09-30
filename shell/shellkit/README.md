## 语法增强
### 判断数组中是否包含某个元素
```bash
A=("path" "get" "put")
if [ $(contains "${A[@]}" "get") == "y" ]; then
    echo "contains one"
fi
```

## 文件 && 文件夹
#### 递归展示某个目录下所有文件
Example:
```bash
lsdir .
```
Output:
```
./README.md
./all.sh
./main.sh
./shellkit/base.sh
./shellkit/config.sh
./shellkit/files.sh
./shellkit/os.sh
./shellkit/syntax.sh
```
