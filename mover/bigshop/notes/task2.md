# Task 2 - coin

### 构建、发布
```bash
sui client publish --gas-budget=200000000
# 得到packageid: 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717
# My coin TreasuryCap: 0xbbb29d182cd7fc028d4a73f90d4740fcb584a834f3b03e5d53d27508f11a5a4d
# Faucet coin TreasuryCap: 0x7a5af20456720a49aef8ca67c56f0a0daafecbd38bb53946aadd7fd1cc648bb3
# Faucet coin Wallet: 0xa1e9da8c9269d115fa387ee0c4be09820c8dae2590abb210649c508bca29b830

# 铸造my coin发给自己
sui client call --function mint --module mycoin --package 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717 --args 0xbbb29d182cd7fc028d4a73f90d4740fcb584a834f3b03e5d53d27508f11a5a4d 1000000000000 0x4970bab85a4fc98770f0d765793b9589cc68de321886ca9afe5add5c6dc3cc30 --gas-budget 50000000

# 铸造测试币到公共钱包
sui client call --function mint --module faucet_coin --package 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717 --args 0x7a5af20456720a49aef8ca67c56f0a0daafecbd38bb53946aadd7fd1cc648bb3 0xa1e9da8c9269d115fa387ee0c4be09820c8dae2590abb210649c508bca29b830 1000000000000 --gas-budget 50000000

# 从测试币钱包领水
sui client call --function faucet --module faucet_coin --package 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717 --args 0xa1e9da8c9269d115fa387ee0c4be09820c8dae2590abb210649c508bca29b830 --gas-budget 50000000

# 发送mycoin给大佬地址
sui client transfer --object-id 0x5c8e8490e8934c90bcc4466373d6b1b76cba3788ea36a1b60ef1dca142b02c88 --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

```