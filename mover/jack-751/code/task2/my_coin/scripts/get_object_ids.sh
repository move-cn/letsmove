#!/bin/bash

# todo: fix
# 設定環境變數
export PACKAGE_ID="0xfb82d1fac97c46ca3f478548eae488264042473b9082f88b6096f9492b0ceb08"
export TXID="6Rjuhtm6JdeotPXLmqdmdCsFj2STUqWsSg6XTWXAcjyU"

#0x2::coin::TreasuryCap<0xfb82d1fac97c46ca3f478548eae488264042473b9082f88b6096f9492b0ceb08::jack_751_faucet_coin::JACK_751_FAUCET_COIN>
export TREASURY_CAP_ID_JACK_751_FAUCET_COIN="0x0bdd7a568aaf28fdac0be2014ca8306cace4f75b7cf2db198a19e4df170239df"

#0x2::coin::TreasuryCap<0xfb82d1fac97c46ca3f478548eae488264042473b9082f88b6096f9492b0ceb08::jack_751::JACK_751>
export TREASURY_CAP_ID_JACK_751="0x8fd8d200a07c1cdc3682428e50188fb14ac30dc2ae6c615ddaed814e5f0dcabb"


echo ""
echo "查詢您的錢包地址:"
ADDRESS=$(sui client active-address)
echo "您的錢包地址為: $ADDRESS"




# echo ""
# echo "2. 查詢特定類型的 TreasuryCap objects:"
# echo "   對於 JACK_751_COIN TreasuryCap (owned objects):"
# sui client objects $ADDRESS --json | jq '.[] | select(.data.type | contains("TreasuryCap") and contains("JACK_751_COIN")) | {objectId: .data.objectId, type: .data.type}'

# echo ""
# echo "   對於 JACK_751_FAUCET_COIN TreasuryCap (shared objects):"
# echo "   查詢 shared TreasuryCap objects:"
# sui client objects --json | jq '.[] | select(.data.type | contains("TreasuryCap") and contains("JACK_751_FAUCET_COIN")) | {objectId: .data.objectId, type: .data.type}'

# echo ""
# echo "3. 查詢所有 shared objects (包含您的 faucet coin TreasuryCap):"
# sui client objects --json | jq '.[] | select(.data.owner == "Shared") | {objectId: .data.objectId, type: .data.type}'

# echo ""
# echo "4. 使用 sui client object 查詢特定 object 詳細信息："
# echo "   用法: sui client object <OBJECT_ID>"

# echo ""
# echo "5. 從 Transaction Digest 查詢 objects:"
# echo "   用法: sui client transaction <TRANSACTION_DIGEST>"
# echo "   範例: sui client transaction --json <TRANSACTION_DIGEST> | jq '.objectChanges'"
# echo ""
# echo "   如果您有 transaction digest，請輸入以下命令查詢創建的 objects:"
# echo "   sui client transaction --json <TRANSACTION_DIGEST> | jq '.objectChanges[] | select(.type == \"created\") | {objectId: .objectId, objectType: .objectType}'"

# echo ""
# echo "6. 查詢最近的交易 (可能包含您的 publish 交易):"
# echo "   sui client transactions --from-address $ADDRESS --limit 10"



# echo ""
# echo "請從上面的輸出中複製相應的 Object ID 並更新 mint 腳本中的參數。"
