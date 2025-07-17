#!/bin/bash

# 設定環境變數
export PACKAGE_ID="0xfb82d1fac97c46ca3f478548eae488264042473b9082f88b6096f9492b0ceb08"

# 設定其他必要參數
TREASURY_CAP_ID="0x0bdd7a568aaf28fdac0be2014ca8306cace4f75b7cf2db198a19e4df170239df"  # 請替換為實際的 TreasuryCap object ID
AMOUNT="100000000"  # 鑄造數量 (以 6 位小數計算，所以這是 1 個代幣)
=="0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3"  # 請替換為接收地址


# First, switch to the correct wallet address
sui client switch --address jack1
ADDRESS=$(sui client active-address)
echo "您的錢包地址為: $ADDRESS"

echo "正在呼叫 mint 函數..."
echo "Package ID: $PACKAGE_ID"
echo "Amount: $AMOUNT"
echo "Recipient: $RECIPIENT_ADDRESS"

# 呼叫 sui client call 來執行 mint 函數
sui client call \
    --package $PACKAGE_ID \
    --module jack_751_faucet_coin \
    --function mint \
    --args $TREASURY_CAP_ID $AMOUNT $RECIPIENT_ADDRESS \
    --gas-budget 10000000

echo "Mint 函數呼叫完成！"
#--------------------------------------------------------

# Second, switch back to the original wallet address
sui client switch --address jack2
ADDRESS=$(sui client active-address)
echo "您的錢包地址為: $ADDRESS"

echo "正在呼叫 mint 函數..."
echo "Package ID: $PACKAGE_ID"
echo "Amount: $AMOUNT"
echo "Recipient: $RECIPIENT_ADDRESS"

# 呼叫 sui client call 來執行 mint 函數
sui client call \
    --package $PACKAGE_ID \
    --module jack_751_faucet_coin \
    --function mint \
    --args $TREASURY_CAP_ID $AMOUNT $RECIPIENT_ADDRESS \
    --gas-budget 10000000

echo "Mint 函數呼叫完成！"
#--------------------------------------------------------
