#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/test_env.sh"

echo "=== 開始遊戲 ==="
echo "Package ID: $PACKAGE_ID"
echo "FlipGame ID: $FLIPGAME_ID"
echo "RANDOM_ID: $RANDOM_ID"
# 檢查必要的環境變數是否已設定
if [ -z "$PACKAGE_ID" ] || [ -z "$FLIPGAME_ID" ] || [ -z "$RANDOM_ID" ]; then
    echo "錯誤: 請確認 test_env.sh 中的環境變數已正確設定"
    exit 1
fi

# 檢查是否提供了必要參數
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "使用方式: $0 <GUESS> <COIN_ID> [AMOUNT]"
    echo "範例: $0 true 0x123abc... 100"
    echo "GUESS: true 或 false"
    exit 1
fi

GUESS="$1"       # 猜測結果：true 或 false
COIN_ID="$2"     # 代幣 ID
AMOUNT="${3:-$DEFAULT_PLAY_AMOUNT}"  # 如果沒提供金額，使用預設值

echo "猜測: $GUESS"
echo "代幣 ID: $COIN_ID"
echo "投注金額: $AMOUNT"
echo ""

echo "執行遊戲..."
sui client call \
    --package "$PACKAGE_ID" \
    --module "game" \
    --function "play" \
    --args "$FLIPGAME_ID" "$RANDOM_ID" "$GUESS" "$COIN_ID" "$AMOUNT" \
    --gas-budget 10000000

echo "遊戲完成！"
