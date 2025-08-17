#!/bin/bash

# 載入環境變數
source "$(dirname "$0")/env.sh"

# 檢查必要參數
if [ "$PACKAGE_ID" = "YOUR_PACKAGE_ID_HERE" ]; then
    echo "❌ 錯誤: 請先在 env.sh 中設定正確的 PACKAGE_ID"
    exit 1
fi

# 獲取參數
NFT_OBJECT_ID="0xc5f4630d4a608a776055467b1f96f3ef8ad23f8c7dfbe9d9465af9d307d51e48"
RECIPIENT_ADDRESS="0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"

# 檢查參數是否提供
if [ -z "$NFT_OBJECT_ID" ] || [ -z "$RECIPIENT_ADDRESS" ]; then
    echo "使用方法: $0 <NFT_OBJECT_ID> <RECIPIENT_ADDRESS>"
    echo ""
    echo "例子:"
    echo "  $0 0x1234567890abcdef 0xabcdef1234567890"
    echo ""
    echo "提示:"
    echo "  - NFT_OBJECT_ID: 要轉移的 NFT 物件 ID"
    echo "  - RECIPIENT_ADDRESS: 接收者的地址"
    exit 1
fi

echo "=== 轉移 NFT ==="
echo "NFT 物件 ID: $NFT_OBJECT_ID"
echo "接收者地址: $RECIPIENT_ADDRESS"
echo "包地址: $PACKAGE_ID"
echo "網路: $NETWORK"
echo ""

# 執行 transfer_nft 函數
echo "🚀 開始轉移 NFT..."

sui client call \
    --package "$PACKAGE_ID" \
    --module "nft_demo" \
    --function "transfer_nft" \
    --args "$NFT_OBJECT_ID" "$RECIPIENT_ADDRESS" \
    --gas-budget "$GAS_BUDGET" \
    --json

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ NFT 轉移成功！"
else
    echo ""
    echo "❌ NFT 轉移失敗！"
    exit 1
fi
