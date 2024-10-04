# Task 1 - nft


### 构建、发布
```bash
sui client publish --gas-budget=20000000 

# 得到packageid: 0x0dfa78f2ee59cc3eb1b53718022a03786a7d6eba1a4bff51969db63ae72393b9

sui client call --function mint_to_sender --module mynft --package 0x0dfa78f2ee59cc3eb1b53718022a03786a7d6eba1a4bff51969db63ae72393b9 --args "test2" "test1test2" "test2" --gas-budget 50000000

# 得到nft id: 0x1afdefe0a7f9df77fdb075fb29dd5589e26ec151b50c6ac5b640f2bfa9bbbed1

#查看object信息
sui client object 0x1afdefe0a7f9df77fdb075fb29dd5589e26ec151b50c6ac5b640f2bfa9bbbed1

# 发送nft给大佬地址
sui client call --function transfer --module mynft --package 0x0dfa78f2ee59cc3eb1b53718022a03786a7d6eba1a4bff51969db63ae72393b9 --args 0x1afdefe0a7f9df77fdb075fb29dd5589e26ec151b50c6ac5b640f2bfa9bbbed1 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

```
