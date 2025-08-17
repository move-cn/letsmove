#!/bin/bash

# 設定環境變數
export PACKAGE_ID="0xd324003f9bd2409e139a24ac0ec2329a6a27e1da847e1dda3927bc78343e940f"

# 設定其他必要參數
TREASURY_CAP_ID="0x965fdac422b57497d1729afa478811c82f392d6ab96c15499d930dd704f62c4f"  # 請替換為實際的 TreasuryCap object ID
AMOUNT="10000000"  # 鑄造數量 (以 6 位小數計算，所以這是 1 個代幣)
RECIPIENT_ADDRESS="0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3"  # 請替換為接收地址

echo "正在呼叫 my_coin 的 mint 函數..."
echo "Package ID: $PACKAGE_ID"
echo "Amount: $AMOUNT"
echo "Recipient: $RECIPIENT_ADDRESS"

# 呼叫 sui client call 來執行 mint 函數
sui client call \
    --package $PACKAGE_ID \
    --module jack_751 \
    --function mint \
    --args $TREASURY_CAP_ID $AMOUNT $RECIPIENT_ADDRESS \
    --gas-budget 10000000

echo "Mint 函數呼叫完成！"
