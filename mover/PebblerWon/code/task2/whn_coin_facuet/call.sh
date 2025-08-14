# 0x2 是coinpackage的地址
# --type-args 是我们自己合约的package id
# --args 第一个参数是treasurycpa的object id

# testnet package id: 0x4c5e927d8dd0fe7bc37cfbca401376d6ccc300f6b79cf40f19a1cf329c521dd2
## mainnet facuet address 1
sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x498edfc9e864d78d244315e514569ae842cb26c14cea75acb55224f74e933bbd::whn_coin::WHN_COIN' \
  --args 0xcbd304d44a70d5a080b02b514122f9ca58d7e1481450377ac448d672dad0bbd9 10000 0x60364db3c6fa7128433ad62ce4e32649443a999ab6b54bdcbaf14194ec1a6203

## mainnet facuet address 2

sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x498edfc9e864d78d244315e514569ae842cb26c14cea75acb55224f74e933bbd::whn_coin::WHN_COIN' \
  --args 0xcbd304d44a70d5a080b02b514122f9ca58d7e1481450377ac448d672dad0bbd9 10000 0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91
