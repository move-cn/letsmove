# Task 3 - sui nft

## 新建项目
新建项目
```bash
sui move new task3
```

构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```
得到packageid： 0xb023374447f0e3fb4c9c493bccfecf659d77b180f87cca061b5250970133f862

## mint
```bash
#铸造
sui client call --function mint --module mynft --package 0xb023374447f0e3fb4c9c493bccfecf659d77b180f87cca061b5250970133f862 --args "cheng1" "cheng1" "cheng1111" --gas-budget 50000000

#查看object信息
sui client object 0x093eae9a5b61c527f008b6356834c19ee309607f4d9d2c672021e3886946c475

# 再铸造个nft
sui client call --function mint --module mynft --package 0xb023374447f0e3fb4c9c493bccfecf659d77b180f87cca061b5250970133f862 --args "cheng2" "cheng2" "cheng222" --gas-budget 50000000

# 0xc8c8db9273c29c4709935066c546a7879d6023b9101fa0c8529b948c9f431bb0
# 新NFT转给0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call --function transfer --module mynft --package 0xb023374447f0e3fb4c9c493bccfecf659d77b180f87cca061b5250970133f862 --args 0xc8c8db9273c29c4709935066c546a7879d6023b9101fa0c8529b948c9f431bb0 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

# 查看归属
sui client object 0xc8c8db9273c29c4709935066c546a7879d6023b9101fa0c8529b948c9f431bb0
```
