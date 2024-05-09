#  完成游戏的上链部署
- 上链网络: 主网(mainnet)

## 需求
- 完成 链游相关知识的学习
- 完成 随机数的学习，游戏必须包含随机数
- 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的`Faucet Coin`,用`task2`的 `Faucet Coin`作为游戏输赢的资产 
- 完成 第一个游戏合约部署主网
- 的game 必须包含自己的 `github id`的元素

## 任务指南

### 设计概要
- 使用`Sui Coin`购买LootNFT（随机生成）。
- 使用卡牌发起挑战，在Holders中随机匹配一位玩家对决。
- 根据卡牌词缀判定对决结果，并决定升级或者降级词缀，记录胜负场积分。
- 赛季结束，根据胜负场结算`Faucet Coin`。
- 可在Swap中用`Faucet Coin`兑换`My Coin`。

### MVP Demo
- 调用`mint`生成随机Loot卡牌NFT。
- 调用`battle`和机器人随机数对决，变更积分。