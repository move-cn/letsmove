#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.testnet.sh"

echo "=== Coin 資訊查詢 ==="

# 檢查是否提供了 coin ID 參數
if [ -z "$1" ]; then
    echo "使用方式: $0 <COIN_ID>"
    echo "範例: $0 0x123abc..."
    echo "說明: 查詢指定 coin 的詳細資訊"
    exit 1
fi

COIN_ID="$1"

echo "查詢 Coin ID: $COIN_ID"
echo ""

echo "=== Coin 物件詳細資訊 ==="
sui client object "$COIN_ID"

echo ""
echo "=== 查詢完成 ==="
