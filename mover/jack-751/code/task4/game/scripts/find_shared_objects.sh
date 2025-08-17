#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/test_env.sh"

echo "=== 查詢 Shared Objects ==="
echo ""

echo "方法 1: 查詢已知的遊戲相關 Shared Objects"
echo "FlipGame Object (Shared): $FLIPGAME_ID"
echo "Random Object (Shared): $RANDOM_ID"
echo ""

echo "方法 2: 通過交易歷史查詢自己創建的 Shared Objects"
echo "執行: sui client tx-block --help"
echo ""

echo "方法 3: 查詢特定 Shared Object 詳細資訊"
if [ -n "$FLIPGAME_ID" ]; then
    echo "查詢 FlipGame 詳細資訊:"
    sui client object "$FLIPGAME_ID" 2>/dev/null || echo "無法查詢 FlipGame 物件"
fi

echo ""
if [ -n "$RANDOM_ID" ]; then
    echo "查詢 Random 詳細資訊:"
    sui client object "$RANDOM_ID" 2>/dev/null || echo "無法查詢 Random 物件"
fi

echo ""
echo "方法 4: 查詢所有已知的系統 Shared Objects"
echo "Clock Object: 0x6"
echo "Random Object: 0x8 (需要確認)"
echo ""

# 嘗試查詢一些常見的 shared object IDs
echo "=== 驗證常見 Shared Objects ==="
for id in "0x6" "0x8" "0x9"; do
    echo "查詢 $id:"
    result=$(sui client object "$id" 2>/dev/null | grep -E "(objType|owner)" | head -2)
    if [ -n "$result" ]; then
        echo "$result"
    else
        echo "無法查詢或不存在"
    fi
    echo "---"
done

echo ""
echo "=== 建議的查詢方法 ==="
echo "1. 使用 sui client object <OBJECT_ID> 查詢特定物件"
echo "2. 檢查物件的 owner 欄位，如果是 'Shared' 就是 shared object"
echo "3. 從部署交易記錄中找到創建的 shared objects"
echo "4. 使用 sui client tx-block <DIGEST> 查詢交易詳情"
