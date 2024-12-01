```
# 1. 先构建并部署 faucetcoin
cd task2/faucetcoin
sui move build
sui client publish --gas-budget 100000000

# 2. 构建并部署 task4
cd ../../task4
sui move build
sui client publish --gas-budget 100000000
部署完毕:


1. Faucetcoin 部署结果:
```
PackageID: 0xc10653bf28efb11b4a062f6560bed1f2a265f7e3d212b36bc6a2e5445671cd18
TreasuryCap: 0xd1c7150eb302afcecc270efc2693bf27d04d8c1cb321911f0a12b88877993426
CoinMetadata: 0xf4209d454f09f02837d8caacfff5123fe5582345cbf0db56bd42bfd43f806ba6
```

2. Game 合约部署结果:
```
PackageID: 0x85847018fa1e086c87dbec5921e81988c5ecd4113862b4cea12a8b70162fc40e
Game Object: 0xd1534b22eb350daeec7acec3501663b0c8bc7757cefda7d424ffefed344083c5
AdminCap: 0x50aac3b3ea2d1491b88c597918ef7695e01ee30d40755c45ff46f1e4539f06b7
```

游戏交互步骤:

1. 铸造代币:
```bash
sui client call --package 0xc10653bf28efb11b4a062f6560bed1f2a265f7e3d212b36bc6a2e5445671cd18 \
  --module bright_faucet_coin \
  --function mint \
  --args 0xd1c7150eb302afcecc270efc2693bf27d04d8c1cb321911f0a12b88877993426 1000000000 0x<your_address> \
  --gas-budget 10000000
```

2. 存入资金池:
```bash
sui client call --package 0x85847018fa1e086c87dbec5921e81988c5ecd4113862b4cea12a8b70162fc40e \
  --module bright_flip \
  --function deposit \
  --args 0xd1534b22eb350daeec7acec3501663b0c8bc7757cefda7d424ffefed344083c5 <coin_object_id> \
  --gas-budget 10000000
```

3. 玩游戏:
```bash
sui client call --package 0x85847018fa1e086c87dbec5921e81988c5ecd4113862b4cea12a8b70162fc40e \
  --module bright_flip \
  --function play \
  --args 0xd1534b22eb350daeec7acec3501663b0c8bc7757cefda7d424ffefed344083c5 true <coin_object_id> <random_object_id> \
  --gas-budget 10000000
```

所有合约都已成功部署到主网，可以开始游戏了。需要注意的是要先向游戏合约存入一些代币作为奖池，然后其他玩家才能开始游戏。
                                                                  │

```