#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.testnet.sh"

echo "=== Coin 切割操作 ==="
echo "Package ID: $PACKAGE_ID"

# 預設切割金額
DEFAULT_SPLIT_AMOUNT="10000000"

# 檢查是否提供了 coin ID 參數
if [ -z "$1" ]; then
    echo "使用方式: $0 <COIN_ID> [AMOUNT]"
    echo "範例: $0 0x123abc... 10000000"
    echo "說明: 將指定的 coin 切割出指定金額的新 coin"
    exit 1
fi

COIN_ID="$1"
SPLIT_AMOUNT="${2:-$DEFAULT_SPLIT_AMOUNT}"  # 如果沒提供金額，使用預設值 10000000

echo "原始 Coin ID: $COIN_ID"
echo "切割金額: $SPLIT_AMOUNT"
echo ""

# 檢查原始 coin 的餘額
echo "檢查原始 coin 餘額..."
sui client object "$COIN_ID"

echo ""
echo "執行 coin 切割..."
sui client split-coin \
    --coin-id "$COIN_ID" \
    --amounts "$SPLIT_AMOUNT" \
    --gas-budget 10000000

echo ""
echo "切割完成！"
echo "新的 coin 已從原始 coin 中切割出來"
echo "請檢查交易結果以獲取新 coin 的 ID"
