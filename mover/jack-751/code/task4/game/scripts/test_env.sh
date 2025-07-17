#!/bin/bash

# 測試腳本 - 驗證所有腳本是否能正確載入環境變數

echo "=== 測試環境變數載入 ==="

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.mainnet.sh"

echo ""
echo "=== 環境變數檢查 ==="
echo "Package ID: ${PACKAGE_ID:-未設定}"
echo "FlipGame ID: ${FLIPGAME_ID:-未設定}"
echo "Admin ID: ${ADMIN_ID:-未設定}"
echo "Random ID: ${RANDOM_ID:-未設定}"
echo ""
echo "預設金額設定:"
echo "存款金額: ${DEFAULT_DEPOSIT_AMOUNT:-未設定}"
echo "遊戲金額: ${DEFAULT_PLAY_AMOUNT:-未設定}"
echo "提款金額: ${DEFAULT_WITHDRAW_AMOUNT:-未設定}"

echo ""
echo "=== 腳本使用範例 ==="
echo "存款: ./deposit.sh <COIN_ID> [AMOUNT]"
echo "遊戲: ./play.sh <GUESS> <COIN_ID> [AMOUNT]"
echo "提款: ./withdraw.sh [AMOUNT]"
echo ""
echo "實際範例:"
echo "./deposit.sh 0x123abc... 1000"
echo "./play.sh true 0x123abc... 100"
echo "./withdraw.sh 500"
