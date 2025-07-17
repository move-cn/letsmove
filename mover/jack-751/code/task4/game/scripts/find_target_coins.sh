#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# 設定要查詢的地址
TARGET_ADDRESS="${1:-0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3}"

echo "查詢地址: $TARGET_ADDRESS"
echo ""

echo "=== 查詢該地址擁有的所有物件 ==="
sui client objects --owner "$TARGET_ADDRESS" 2>/dev/null | while IFS= read -r line; do
    if echo "$line" | grep -i "jack_751_faucet_coin" >/dev/null; then
        echo "找到 JACK_751_FAUCET_COIN: $line"
        # 提取 Object ID
        object_id=$(echo "$line" | grep -o "0x[a-fA-F0-9]\{64\}" | head -1)
        if [ -n "$object_id" ]; then
            echo "Object ID: $object_id"
            echo "查詢詳細資訊..."
            sui client object "$object_id" 2>/dev/null
            echo "---"
        fi
    fi
done

echo ""
echo "=== 已知的 JACK_751_FAUCET_COIN 物件 ID（從剛才的鑄造） ==="
echo "1. 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72"
echo "2. 0x03bd7ee9cff497347bb9c269ccf8fc0fd6e28fa63d0073f61c8361476c8511e6"
echo ""
echo "使用範例："
echo "./deposit.sh 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72 10000000"
echo "./play.sh true 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72 1000000"
