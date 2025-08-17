#!/bin/baexport RANDOM_ID="0x8"     # Sui 隨機數物件 ID（testnet 上是 0x8）h
# testnet

# 翻轉遊戲環境變數設定檔
export PACKAGE_ID="0xf93faed227c04480854d7745eea5051585e8ee5ea626c302920216b36a56a5e8"

# 請在部署後更新以下物件 ID
export FLIPGAME_ID="0xcb75a7005177533aa3d1b5382b0fad3ae45472c1a8590dabc13c023ec5046f53"      # FlipGame 物件 ID
export ADMIN_ID="0xb32c93856837634e9ad97b51deca0d4d7a67b859942ae59573d080e4a1d4301e"         # Admin 物件 ID
export RANDOM_ID="0x8"     # Sui 隨機數物件 ID（通常是固定的 0x8）

# ------------------end tesntet------------------

# 預設金額設定
export DEFAULT_DEPOSIT_AMOUNT="1000"
export DEFAULT_PLAY_AMOUNT="100"
export DEFAULT_WITHDRAW_AMOUNT="500"

echo "環境變數已設定："
echo "Package ID: $PACKAGE_ID"
echo "FlipGame ID: $FLIPGAME_ID"
echo "Admin ID: $ADMIN_ID"
echo "Random ID: $RANDOM_ID"
