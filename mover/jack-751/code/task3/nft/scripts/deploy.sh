#!/bin/bash

# 部署包到 Sui 網路
# 載入環境變數
source "$(dirname "$0")/env.sh"

echo "=== 部署 NFT 包 ==="
echo "網路: $NETWORK"
echo "Gas 預算: $GAS_BUDGET"
echo ""

# 切換到項目根目錄
cd "$(dirname "$0")/.."

echo "🚀 開始部署包..."

# 執行部署
DEPLOY_OUTPUT=$(sui client publish --gas-budget "$GAS_BUDGET" --json)

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 包部署成功！"
    echo ""
    
    # 提取包 ID
    PACKAGE_ID=$(echo "$DEPLOY_OUTPUT" | jq -r '.objectChanges[] | select(.type == "published") | .packageId')
    
    if [ "$PACKAGE_ID" != "null" ] && [ "$PACKAGE_ID" != "" ]; then
        echo "📦 包 ID: $PACKAGE_ID"
        echo ""
        echo "請將以下行複製到 scripts/env.sh 文件中："
        echo "export PACKAGE_ID=\"$PACKAGE_ID\""
        echo ""
        echo "然後可以使用以下命令："
        echo "  ./scripts/mint_nft.sh \"NFT名稱\" \"圖片URL\""
        echo "  ./scripts/transfer_nft.sh <NFT_OBJECT_ID> <接收者地址>"
    fi
    
    # 顯示完整輸出供參考
    echo ""
    echo "=== 完整部署輸出 ==="
    echo "$DEPLOY_OUTPUT"
else
    echo ""
    echo "❌ 包部署失敗！"
    exit 1
fi
