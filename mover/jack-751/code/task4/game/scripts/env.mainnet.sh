#!/bin/bash
# mainnet

# 翻轉遊戲環境變數設定檔
export PACKAGE_ID=""

# 請在部署後更新以下物件 ID
export FLIPGAME_ID=""      # FlipGame 物件 ID
export ADMIN_ID=""         # Admin 物件 ID
export RANDOM_ID="0x8"     # Sui 隨機數物件 ID（通常是固定的 0x8）

# 預設金額設定
export DEFAULT_DEPOSIT_AMOUNT="1000"
export DEFAULT_PLAY_AMOUNT="100"
export DEFAULT_WITHDRAW_AMOUNT="500"

echo "環境變數已設定："
echo "Package ID: $PACKAGE_ID"
echo "FlipGame ID: $FLIPGAME_ID"
echo "Admin ID: $ADMIN_ID"
echo "Random ID: $RANDOM_ID"
