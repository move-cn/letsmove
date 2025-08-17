#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/test_env.sh"

echo "=== 存款操作 ==="
echo "Package ID: $PACKAGE_ID"
echo "FlipGame ID: $FLIPGAME_ID"

# 檢查必要的環境變數是否已設定
if [ -z "$PACKAGE_ID" ] || [ -z "$FLIPGAME_ID" ]; then
    echo "錯誤: 請確認 test_env.sh 中的環境變數已正確設定"
    exit 1
fi

# 檢查是否提供了代幣 ID 參數
if [ -z "$1" ]; then
    echo "使用方式: $0 <COIN_ID> [AMOUNT]"
    echo "範例: $0 0x123abc... 1000"
    exit 1
fi

COIN_ID="$1"
AMOUNT="${2:-$DEFAULT_DEPOSIT_AMOUNT}"  # 如果沒提供金額，使用預設值

echo "代幣 ID: $COIN_ID"
echo "存款金額: $AMOUNT"
echo ""

echo "執行存款..."
sui client call \
    --package "$PACKAGE_ID" \
    --module "game" \
    --function "deposit" \
    --args "$FLIPGAME_ID" "$COIN_ID" "$AMOUNT" \
    --gas-budget 10000000

echo "存款完成！"
