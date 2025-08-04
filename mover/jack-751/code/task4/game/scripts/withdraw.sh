#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/test_env.sh"

echo "=== 提款操作（僅限管理員）==="
echo "Package ID: $PACKAGE_ID"
echo "FlipGame ID: $FLIPGAME_ID"
echo "Admin ID: $ADMIN_ID"

# 檢查必要的環境變數是否已設定
if [ -z "$PACKAGE_ID" ] || [ -z "$FLIPGAME_ID" ] || [ -z "$ADMIN_ID" ]; then
    echo "錯誤: 請確認 test_env.sh 中的環境變數已正確設定"
    exit 1
fi

# 檢查是否提供了金額參數
AMOUNT="${1:-$DEFAULT_WITHDRAW_AMOUNT}"  # 如果沒提供金額，使用預設值

echo "提款金額: $AMOUNT"
echo ""

echo "執行提款..."
sui client call \
    --package "$PACKAGE_ID" \
    --module "game" \
    --function "withdraw" \
    --args "$FLIPGAME_ID" "$ADMIN_ID" "$AMOUNT" \
    --gas-budget 10000000

echo "提款完成！"
