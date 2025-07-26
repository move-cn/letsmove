#!/bin/bash

# 獲取所有物件
OBJECTS=$(sui client objects 2>/dev/null)

# 顯示所有物件
echo "$OBJECTS"

echo ""
echo "=== 篩選包含 JACK_751_FAUCET_COIN 的物件 ==="

# 篩選包含 JACK_751_FAUCET_COIN 的行
echo "$OBJECTS" | grep -i "jack_751_faucet_coin" || echo "未找到 JACK_751_FAUCET_COIN 物件"

echo ""
echo "=== 使用 JSON 格式查詢 ==="
echo "執行: sui client objects --json"
echo ""

# 嘗試 JSON 格式並篩選
sui client objects --json 2>/dev/null | jq -r '.[] | select(.data.type | test("JACK_751_FAUCET_COIN")) | "Object ID: " + .data.objectId + " | Type: " + .data.type + " | Balance: " + (.data.content.fields.balance // "N/A" | tostring)' 2>/dev/null || {
    echo "JSON 解析失敗，使用基本篩選方法"
    sui client objects 2>/dev/null | while read line; do
        if echo "$line" | grep -i "jack_751_faucet_coin" >/dev/null; then
            echo "找到: $line"
        fi
    done
}

echo ""
echo "=== 查詢完成 ==="
echo "提示: 找到的 Object ID 可以用於遊戲操作"
echo "範例: ./deposit.sh <COIN_OBJECT_ID> 10000000"
