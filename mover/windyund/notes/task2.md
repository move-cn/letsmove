# package id: 0xca5cf766fee82ff53f7c3c1c3180e79dbf46090106c6ea14054c7653f864d5da
# 交易hash: DLJQsGPR5JXLBF5adtKiJzfBWy8SAktBTveBmfvuPeBS

# 1.切换线上环境
```bash
 sui client switch --env mainnet
 ```
# 2.发布合约：
```bash
sui client publish --gas-budget=50000000
```
# 3.命令行获取 package id


# 4.转币
-1 直接在sui wallet
-2 命令行转
找到`ObjectType: 0x2::coin::TreasuryCap`开头的这一段，记录下`ObjectID`,
```bash
sui client call --function mint --module mycoin --package  {packag id} --args {ObjectID}  {amount} 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 90000000
```