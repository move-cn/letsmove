## 玩法

如果用户猜对，当前奖池奖励会被清空奖励给玩家，如果未猜对则铸造并累加 1 coin 到奖池

### 准备工作：
1. 发布
```
sui client publish --gas-budget=200000000 
```
2. 使用代币类型调用函数创造流通池，这里使用task2中创建好的ZSYZQM_FAUCET_COIN
```
export FAUCET_TYPE=0x4735ae94f2de2d1fdb838d128a474cb452df34b7e78d39e761ed7367f5494ec8::zsyzqm_faucet_coin::ZSYZQM_FAUCET_COIN
export PACKAGE_ID=0xa2874e97adeca0785c13b5c404bc0698eb69fcb19c73b792c235c8cfe2a64f9d
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module zsyzqm_game --function create_pool_inner --type-args $FAUCET_TYPE
```

### 开玩

在构造pool的输出中找到POOL_ID，使用tasks2的代币TreasureId，投币进行游戏

```
export POOL_ID=0x2065c4e1d514197d62adf7aa0bf54f2df57b88d499678038d3e9b11b2d2152b0
export TREAS_ID=0x8bfdb404f44a2e22dad1be6820ce0caf588cc259e7b6aca5103872399f5d13d8
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module zsyzqm_game  --function play  --type-args $FAUCET_TYPE --args 1 0x6 $POOL_ID $TREAS_ID
```

样例输出：
这是一次输的结果，hash=`9oEitjXcNaab5FQEjBwrsAH9cpfYSWyMkQckqziqp85V` 
当玩家胜利的时候，可以在sui wallet中查看到代币

```
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 9oEitjXcNaab5FQEjBwrsAH9cpfYSWyMkQckqziqp85V:0                                                       │
│  │ PackageID: 0xa2874e97adeca0785c13b5c404bc0698eb69fcb19c73b792c235c8cfe2a64f9d                                 │
│  │ Transaction Module: zsyzqm_game                                                                               │
│  │ Sender: 0xb9d2feeb733825b6392c970b31102d261bbae5fcd1afb560bec5b46b20d59d34                                    │
│  │ EventType: 0xa2874e97adeca0785c13b5c404bc0698eb69fcb19c73b792c235c8cfe2a64f9d::zsyzqm_game::GamingResultEvent │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌───────────────┬────────────────────────────────────────────────────────────────────────┐                  │
│  │   │ is_win        │ false                                                                  │                  │
│  │   ├───────────────┼────────────────────────────────────────────────────────────────────────┤                  │
│  │   │ result        │ Unfortunately, you're wrong. You'll have to pay a coin into the pool💔 │                  │
│  │   ├───────────────┼────────────────────────────────────────────────────────────────────────┤                  │
│  │   │ your_choice   │ 1                                                                      │                  │
│  │   ├───────────────┼────────────────────────────────────────────────────────────────────────┤                  │
│  │   │ zsyzqm_choice │ 2                                                                      │                  │
│  │   └───────────────┴────────────────────────────────────────────────────────────────────────┘                  │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

