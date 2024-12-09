# 0x2 是coinpackage的地址
# --type-args 是我们自己合约的package id
# --args 第一个参数是treasurycpa的object id

## testnet
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x5bedaf1084a9f6a7c98a205ca56550c75bb13376cc34c07fc3c5bddc6b17d813::whn_coin::WHN_COIN' \
  --args 0xbbe765228d36c58cbdfa1cd3ab90ac11ba280866fd5dbe3e1cad15f5571f5316 10000 0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91


## mainnet
sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0xd12d0dbe5c01f8ec8aff8b62d440b3b5c7ef9330e55878c3ee30381694ba57ef::whn_coin::WHN_COIN' \
  --args 0x402453b966e86168290e1f01b8c0fdaa92f6ea009258282ccbc33e873ddaba0c 10000 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203
