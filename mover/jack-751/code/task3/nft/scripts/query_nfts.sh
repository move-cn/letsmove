#!/bin/bash

# 查詢擁有的 NFT
# 載入環境變數
source "$(dirname "$0")/env.sh"

# 獲取參數
ADDRESS="$1"

# 如果沒有提供地址，使用當前活躍地址
if [ -z "$ADDRESS" ]; then
    ADDRESS=$(sui client active-address)
    echo "使用當前活躍地址: $ADDRESS"
else
    echo "查詢地址: $ADDRESS"
fi

echo ""
echo "=== 查詢 NFT ==="
echo "地址: $ADDRESS"
echo "網路: $NETWORK"
echo ""

echo "🔍 查詢擁有的物件..."

# 查詢擁有的物件
sui client objects --owner "$ADDRESS" --json | jq -r '
.[] | 
select(.data.type | contains("MyNFT")) | 
{
  objectId: .data.objectId,
  version: .data.version,
  type: .data.type,
  content: .data.content
}'
