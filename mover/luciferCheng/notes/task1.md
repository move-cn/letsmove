# Task 1 - hello move

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
sui move new task1
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 --skip-fetch-latest-git-deps
```
得到packageid:0x6c4766406d9913871096fa03bf0b6a89eac45eded189eb99326deff703bc376f