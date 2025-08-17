#!/bin/bash
# mainnet

# 翻轉遊戲環境變數設定檔
export PACKAGE_ID="0x27305acaa54be52c868c3792c6845a3d15953e3023e25242bee4e3ddf78d1ce3"

# 請在部署後更新以下物件 ID
export FLIPGAME_ID="0xfb6f1a91015d5e0f24374416b4be154cd21bb0c8b924a735ab81a50793f41c17"      # FlipGame 物件 ID
export ADMIN_ID="0x80fb347797711927703cbee628f0a6ec4f6197acec7c2f3d5f31a9079e9e3825"         # Admin 物件 ID
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
