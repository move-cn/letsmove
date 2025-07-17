#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/test_env.sh"

echo "=== 查詢自己發行的 Coin Objects ==="
echo ""

# 獲取當前活躍地址
ACTIVE_ADDRESS=$(sui client active-address 2>/dev/null)
echo "當前活躍地址: $ACTIVE_ADDRESS"
echo ""

echo "=== 方法 1: 查詢當前錢包擁有的所有物件 ==="
echo "執行: sui client objects"
echo ""

# 查詢當前錢包的所有物件
sui client objects 2>/dev/null | while IFS= read -r line; do
    # 檢查是否包含 coin 相關資訊
    if echo "$line" | grep -i "coin" >/dev/null; then
        echo "找到 Coin: $line"
    fi
done

echo ""
echo "=== 方法 2: 查詢特定地址擁有的 Coin Objects ==="
echo "查詢地址: $ACTIVE_ADDRESS"
echo ""

# 使用 JSON 格式查詢並篩選 coin
sui client objects --json 2>/dev/null | jq -r '.[] | select(.data.type | test("coin::Coin")) | "Object ID: " + .data.objectId + " | Type: " + .data.type + " | Owner: " + .data.owner.AddressOwner' 2>/dev/null || {
    echo "JSON 解析失敗，使用基本方法"
    sui client objects 2>/dev/null | grep -i "coin"
}

echo ""
echo "=== 方法 3: 查詢已知的 JACK_751_FAUCET_COIN ==="
echo "已知的 JACK_751_FAUCET_COIN 物件:"
echo "1. 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72"
echo "2. 0x03bd7ee9cff497347bb9c269ccf8fc0fd6e28fa63d0073f61c8361476c8511e6"
echo ""

# 驗證已知的 coin
for coin_id in "0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72" "0x03bd7ee9cff497347bb9c269ccf8fc0fd6e28fa63d0073f61c8361476c8511e6"; do
    echo "查詢 Coin: $coin_id"
    result=$(sui client object "$coin_id" 2>&1)
    if echo "$result" | grep -q "does not exist"; then
        echo "❌ Coin 不存在或已被使用"
    else
        echo "✅ Coin 存在"
        # 提取餘額資訊
        balance=$(echo "$result" | grep -o "balance.*[0-9]\+" | head -1)
        owner=$(echo "$result" | grep -A 3 "owner" | grep "AddressOwner" | head -1)
        echo "  餘額: $balance"
        echo "  擁有者: $owner"
    fi
    echo "---"
done

echo ""
echo "=== 方法 4: 查詢所有 Coin 類型 ==="
echo "常見的 Coin 類型:"
echo "- SUI Coin: 0x2::coin::Coin<0x2::sui::SUI>"
echo "- JACK_751_FAUCET_COIN: 0x2::coin::Coin<{package_id}::jack_751_faucet_coin::JACK_751_FAUCET_COIN>"
echo ""

echo "=== 查詢 SUI Coins ==="
sui client objects --json 2>/dev/null | jq -r '.[] | select(.data.type | test("0x2::sui::SUI")) | "SUI Coin ID: " + .data.objectId + " | Balance: " + (.data.content.fields.balance // "N/A" | tostring)' 2>/dev/null || {
    echo "無法查詢 SUI coins"
}

echo ""
echo "=== 使用說明 ==="
echo "1. 使用 'sui client objects' 查看所有擁有的物件"
echo "2. 使用 'sui client object <OBJECT_ID>' 查看特定物件詳情"
echo "3. 查看物件的 'type' 欄位確認是否為 coin"
echo "4. 查看物件的 'balance' 欄位確認餘額"
echo ""
echo "如果要查詢其他地址的 coins:"
echo "sui client objects <ADDRESS>"
