#!/bin/bash

# 從 Transaction Digest 查詢 Object 信息的腳本

if [ $# -eq 0 ]; then
    echo "用法: $0 <TRANSACTION_DIGEST>"
    echo ""
    echo "範例: $0 ABC123...XYZ"
    echo ""
    echo "或者使用互動模式運行此腳本"
    echo ""
    read -p "請輸入 Transaction Digest: " TX_DIGEST
else
    TX_DIGEST=$1
fi

if [ -z "$TX_DIGEST" ]; then
    echo "錯誤: 請提供 Transaction Digest"
    exit 1
fi

echo "查詢 Transaction: $TX_DIGEST"
echo "================================"

echo ""
echo "1. 完整交易信息:"
sui client tx-block "$TX_DIGEST"

echo ""
echo "2. 交易中創建的 Objects (JSON 格式):"
sui client tx-block --json "$TX_DIGEST" | jq '.objectChanges[] | select(.type == "created")'

echo ""
echo "3. 只顯示創建的 Objects 的 ID 和類型:"
sui client tx-block --json "$TX_DIGEST" | jq '.objectChanges[] | select(.type == "created") | {objectId: .objectId, objectType: .objectType}'

echo ""
echo "4. 查詢 TreasuryCap Objects:"
sui client tx-block --json "$TX_DIGEST" | jq '.objectChanges[] | select(.type == "created" and (.objectType | contains("TreasuryCap"))) | {objectId: .objectId, objectType: .objectType}'

echo ""
echo "5. 查詢 Shared Objects:"
sui client tx-block --json "$TX_DIGEST" | jq '.objectChanges[] | select(.type == "created" and .owner == "Shared") | {objectId: .objectId, objectType: .objectType}'

echo ""
echo "6. 查詢 Package Objects (如果這是 publish 交易):"
sui client tx-block --json "$TX_DIGEST" | jq '.objectChanges[] | select(.type == "published") | {packageId: .packageId}'

echo ""
echo "7. 所有 Object 變更 (創建、修改、刪除):"
sui client tx-block --json "$TX_DIGEST" | jq '.objectChanges[] | {type: .type, objectId: .objectId, objectType: .objectType, owner: .owner}'

echo ""
echo "如果您需要查詢特定 object 的詳細信息，請使用:"
echo "sui client object <OBJECT_ID>"
