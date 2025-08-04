#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.testnet.sh"

echo "=== 進階 Coin 切割操作 ==="
echo "Package ID: $PACKAGE_ID"

# 預設切割金額和數量
DEFAULT_SPLIT_AMOUNT="10000000"
DEFAULT_COUNT="1"

# 檢查是否提供了 coin ID 參數
if [ -z "$1" ]; then
    echo "使用方式: $0 <COIN_ID> [AMOUNT] [COUNT]"
    echo "範例:"
    echo "  $0 0x123abc... 10000000 1      # 切割一個 10000000 的 coin"
    echo "  $0 0x123abc... 5000000 3       # 切割三個 5000000 的 coin"
    echo "  $0 0x123abc...                 # 使用預設值切割一個 10000000 的 coin"
    echo ""
    echo "說明: 將指定的 coin 切割出指定數量和金額的新 coin"
    exit 1
fi

COIN_ID="$1"
SPLIT_AMOUNT="${2:-$DEFAULT_SPLIT_AMOUNT}"  # 切割金額
COUNT="${3:-$DEFAULT_COUNT}"                # 切割數量

echo "原始 Coin ID: $COIN_ID"
echo "每個新 coin 金額: $SPLIT_AMOUNT"
echo "切割數量: $COUNT"
echo ""

# 檢查原始 coin 的餘額
echo "檢查原始 coin 餘額..."
sui client object "$COIN_ID"

echo ""

# 檢查是否所有切割的 coin 金額都相同
# 如果是，可以使用更簡單的 --count 參數
echo "切割 $COUNT 個金額為 $SPLIT_AMOUNT 的 coin"
echo ""
echo "執行 coin 切割..."

# 建立 amounts 參數陣列
AMOUNTS_ARGS=""
for ((i=1; i<=COUNT; i++)); do
    AMOUNTS_ARGS="$AMOUNTS_ARGS --amounts $SPLIT_AMOUNT"
done

# 使用多個 --amounts 參數的方式
sui client split-coin \
    --coin-id "$COIN_ID" \
    $AMOUNTS_ARGS \
    --gas-budget 10000000

echo ""
echo "切割完成！"
echo "已從原始 coin 中切割出 $COUNT 個金額為 $SPLIT_AMOUNT 的新 coin"
echo "請檢查交易結果以獲取新 coin 的 ID"
