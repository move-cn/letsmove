#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.testnet.sh"

echo "=== 最佳化 Coin 切割操作 ==="
echo "Package ID: $PACKAGE_ID"

# 預設切割金額
DEFAULT_SPLIT_AMOUNT="10000000"

# 檢查是否提供了 coin ID 參數
if [ -z "$1" ]; then
    echo "使用方式: $0 <COIN_ID> [AMOUNT1] [AMOUNT2] [AMOUNT3] ..."
    echo "範例:"
    echo "  $0 0x123abc... 10000000          # 切割一個 10000000 的 coin"
    echo "  $0 0x123abc... 5000000 3000000   # 切割一個 5000000 和一個 3000000 的 coin"
    echo "  $0 0x123abc... 1000000 1000000 1000000  # 切割三個 1000000 的 coin"
    echo ""
    echo "說明: 將指定的 coin 切割成指定金額的多個新 coin"
    exit 1
fi

COIN_ID="$1"
shift  # 移除第一個參數（COIN_ID）

# 如果沒有提供金額，使用預設值
if [ $# -eq 0 ]; then
    AMOUNTS=("$DEFAULT_SPLIT_AMOUNT")
else
    AMOUNTS=("$@")
fi

echo "原始 Coin ID: $COIN_ID"
echo "切割金額: ${AMOUNTS[*]}"
echo "切割數量: ${#AMOUNTS[@]}"
echo ""

# 檢查原始 coin 的餘額
echo "檢查原始 coin 餘額..."
sui client object "$COIN_ID"

echo ""
echo "執行 coin 切割..."

# 建立命令
CMD="sui client split-coin --coin-id $COIN_ID"
for amount in "${AMOUNTS[@]}"; do
    CMD="$CMD --amounts $amount"
done
CMD="$CMD --gas-budget 10000000"

echo "執行命令: $CMD"
echo ""

# 執行命令
eval $CMD

echo ""
echo "切割完成！"
echo "已從原始 coin 中切割出 ${#AMOUNTS[@]} 個新 coin"
echo "金額分別為: ${AMOUNTS[*]}"
echo "請檢查交易結果以獲取新 coin 的 ID"
