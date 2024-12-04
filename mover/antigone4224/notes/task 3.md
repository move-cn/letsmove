#  Task3
### 完成可以mint NFT的合约上链

```
packageid:0x0a122fdbdab2e5c9a0ada8d4ebb025fd7b6b7d419593eb1468c14f13ba6c92f3
sui client call --function mint_to_sender --module mainnet_nft --package 0x0a122fdbdab2e5c9a0ada8d4ebb025fd7b6b7d419593eb1468c14f13ba6c92f3 --args "aaa" "bbb" "https://avatars.githubusercontent.com/u/111073780\?v\=4" "https://avatars.githubusercontent.com/u/111073780\?v\=4" --gas-budget 500000000
```



- [x] 给自己地址mint一个NFT

  NFT objectid:0x80ce7d372c75d81d845a1ac4e63e66633277d11960af0892b4038729e443bbee

- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

```
sui client call --function transfer --module mainnet_nft --package 0x0a122fdbdab2e5c9a0ada8d4ebb025fd7b6b7d419593eb1468c14f13ba6c92f3 --args 0x80ce7d372c75d81d845a1ac4e63e66633277d11960af0892b4038729e443bbee 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 500000000
```

交易哈希：CS827YeSnZz1G1UinEZgh2MrxrZ6BBKLfCnqwoHD6Gxp