**核心目标是创建一个 NFT Collection，并部署到主网**
1. `sui move new hstar_nft` 创建项目
2. 调用(testnet)
```bash
# mint nft
sui client call --function mint --module hstar_nft --package 0x229ae9880ffcca821525a39b2dbc5d8cc33ff3b754258f95ac1bfa5e86fa2463 --args "Hstar NFT" "hstar nft desc" "https://avatars.githubusercontent.com/u/4043284"  --gas-budget 5000000

# get nft info
sui client object 0x4af7574224a7acb047aa4d2c6fd4f6317b6d504a5c8703a7eddda9fac1c9fa4f

# transfer
sui client call --function transfer --module hstar_nft --package 0x229ae9880ffcca821525a39b2dbc5d8cc33ff3b754258f95ac1bfa5e86fa2463 --args 0x4af7574224a7acb047aa4d2c6fd4f6317b6d504a5c8703a7eddda9fac1c9fa4f 0x7456bc01b777214947ac935bad71f75a7b7b09352ad99877d15de56530df1408
```
3. 调用(mainnet)
```bash
# mint
sui client call --function mint --module hstar_nft --package 0x2fd04200daa26953880bea43e140694fe02c030f9a44bc2f97b50ca3dde6ee8f --args "Hstar NFT" "hstar nft desc" "https://avatars.githubusercontent.com/u/4043284"  --gas-budget 5000000

# transfer
sui client call --function transfer --module hstar_nft --package 0x2fd04200daa26953880bea43e140694fe02c030f9a44bc2f97b50ca3dde6ee8f --args 0x978ab08382c28772d82ea7dd486ce7d994692a66522b2855d6107c28312dfe02 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

## 参考资料
* sui 前端调用文档: https://sdk.mystenlabs.com/typescript