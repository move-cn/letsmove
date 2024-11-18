# 0x2 是coinpackage的地址
# --type-args 是我们自己合约的package id
# --args 第一个参数是treasurycpa的object id

## testnet
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x4c5e927d8dd0fe7bc37cfbca401376d6ccc300f6b79cf40f19a1cf329c521dd2::whn_coin::WHN_COIN' \
  --args 0x19e69a05953b0e065ebcd6a9705db902c21ac97f2bc14eb364ea79a889978d0c 10000 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203


## mainnet
sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0xd12d0dbe5c01f8ec8aff8b62d440b3b5c7ef9330e55878c3ee30381694ba57ef::whn_coin::WHN_COIN' \
  --args 0x402453b966e86168290e1f01b8c0fdaa92f6ea009258282ccbc33e873ddaba0c 10000 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203
