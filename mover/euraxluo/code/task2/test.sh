#!/bin/bash

# 检查是否传递了 -h 参数
if [[ "$@" =~ "-h" ]]; then
    # 输出 sui move call 的帮助信息
    sui client call -h  | sed 's/sui client call/test.sh/g'
    exit
fi

# 执行 sui client call 命令并捕获输出
out=$(sui client call $@)

if [ $? -eq 0 ]; then
    # 打印命令输出
    echo "$out"
else
    # 打印命令输出
    echo "$out"
    # 命令执行失败，输出错误信息并退出脚本
    echo "Error: sui client call failed."
    exit 1
fi


# 使用 sed 来提取所有的对象ID
object_ids=$(echo "$out" | sed -n '/Created Objects/,/Mutated Objects/ { /ObjectID:/ {s/ObjectID: //p} }'| awk '{print $3}')


echo ""
echo "──────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo ""


echo "Package Created Objects:"
# 打印提取出的对象ID
echo "$object_ids"

echo ""
echo "──────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo ""

# 使用 sed 来提取所有的 Owner 地址信息
owner_addresses=$(echo "$out" | sed -n '/Balance Changes/,/Owner: Account Address/ {s/.*(\(.*\) )/\1/p}'|awk '{print $1}')
echo "Package Caller Addresses:"
echo "$owner_addresses"

echo ""
echo "──────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo ""
