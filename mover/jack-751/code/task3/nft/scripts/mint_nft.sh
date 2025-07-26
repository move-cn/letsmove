#!/bin/bash

# 載入環境變數
source "$(dirname "$0")/env.sh"

# 檢查必要參數
if [ "$PACKAGE_ID" = "YOUR_PACKAGE_ID_HERE" ]; then
    echo "❌ 錯誤: 請先在 env.sh 中設定正確的 PACKAGE_ID"
    exit 1
fi

# 獲取參數
NFT_NAME="$1"
IMAGE_URL="$2"

# 檢查參數是否提供
if [ -z "$NFT_NAME" ] || [ -z "$IMAGE_URL" ]; then
    echo "使用方法: $0 <NFT_NAME> <IMAGE_URL>"
    echo ""
    echo "例子:"
    echo "  $0 \"My First NFT\" \"https://example.com/image.png\""
    echo "  $0 \"Jack's NFT\" \"https://avatars.githubusercontent.com/u/81602637?v=4\""
    exit 1
fi

echo "=== 鑄造 NFT ==="
echo "NFT 名稱: $NFT_NAME"
echo "圖片 URL: $IMAGE_URL"
echo "包地址: $PACKAGE_ID"
echo "網路: $NETWORK"
echo ""

# 執行 mint_nft 函數
echo "🚀 開始鑄造 NFT..."

sui client call \
    --package "$PACKAGE_ID" \
    --module "nft_demo" \
    --function "mint_nft" \
    --args "$NFT_NAME" "$IMAGE_URL" \
    --gas-budget "$GAS_BUDGET" \
    --json

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ NFT 鑄造成功！"
else
    echo ""
    echo "❌ NFT 鑄造失敗！"
    exit 1
fi
