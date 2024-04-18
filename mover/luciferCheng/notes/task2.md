# Task 1 - sui coins

## 基本的 sui move 指令
```bash
# 查看当前所在sui的网络
sui client envs
# 切换到测试网
sui client switch --env testnet
# 查看当前账户信息，可以看到公钥
sui client addresses

# 领取测试币
sui client faucet
```

## 发布项目
### 新建项目
```bash
sui move new task2
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```
得到packageid: 0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405
MYCOIN TreasuryCap: 0x759f24b348bf2ec694dd2d5952986b8570e09dbd00ad055bc3038e2396737119
FAUCET COIN TreasuryCap: 0x8c3cc7d5cfb6688fcd42249a2bf218aa9d09b863ebe95175030ccf553019bb84

### 给官方发点MyCoin
```bash
# 自己的
sui client call --function mint --module mycoin --package 0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405 --args 0x759f24b348bf2ec694dd2d5952986b8570e09dbd00ad055bc3038e2396737119 100000000000 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 --gas-budget 50000000

# 官方的
sui client call --function mint --module mycoin --package 0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405 --args 0x759f24b348bf2ec694dd2d5952986b8570e09dbd00ad055bc3038e2396737119 100000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

# 得到hash ByYeA8uR3b2Z9s9wUxqb5rRrgsmQ3Vu7o19jFdPBUkJ7
```

# 给自己整点 faucetcoin，切换到其他账号也是ok的
sui client call --function mint --module faucet_coin --package 0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405 --args 0x8c3cc7d5cfb6688fcd42249a2bf218aa9d09b863ebe95175030ccf553019bb84 100000000000 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 --gas-budget 50000000

```

