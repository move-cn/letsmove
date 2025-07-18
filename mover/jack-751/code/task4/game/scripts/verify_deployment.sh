#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/test_env.sh"

echo "=== 查詢遊戲部署交易和 Shared Objects ==="
echo ""

echo "Package ID: $PACKAGE_ID"
echo "當前設定的 FlipGame ID: $FLIPGAME_ID"
echo "Random ID: $RANDOM_ID"
echo ""

echo "=== 驗證 Random Object ==="
sui client object "$RANDOM_ID" | grep -E "(objType|owner)" | head -2

echo ""
echo "=== 查詢最近的交易來找到部署記錄 ==="
echo "執行: sui client gas"
echo ""

# 獲取當前活躍地址
ACTIVE_ADDRESS=$(sui client active-address 2>/dev/null)
echo "當前活躍地址: $ACTIVE_ADDRESS"

echo ""
echo "=== 建議的查詢步驟 ==="
echo "1. 查看部署交易的 digest 來找到創建的 shared objects"
echo "2. 使用 sui client tx-block <DIGEST> 查詢部署交易詳情"
echo "3. 在交易結果中找到 'Created Objects' 和 'Shared Objects'"
echo ""

echo "=== 測試 FlipGame Object ==="
if [ -n "$FLIPGAME_ID" ]; then
    echo "嘗試查詢 FlipGame: $FLIPGAME_ID"
    result=$(sui client object "$FLIPGAME_ID" 2>&1)
    if echo "$result" | grep -q "does not exist"; then
        echo "❌ FlipGame Object 不存在，需要重新部署或更新 ID"
    else
        echo "✅ FlipGame Object 存在"
        echo "$result" | grep -E "(objType|owner)" | head -2
    fi
else
    echo "❌ FlipGame ID 未設定"
fi

echo ""
echo "=== Testnet 上的系統 Shared Objects ==="
echo "Random Object: 0x8 (0x2::random::Random)"
echo "Clock Object: 0x6 (0x2::clock::Clock)"
echo "Bridge Object: 0x9 (0xb::bridge::Bridge)"
echo ""
echo "如果需要重新部署遊戲合約，請執行："
echo "sui client publish --gas-budget 100000000"
