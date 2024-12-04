#  用 Sui SDK 和 Navi SDK 在Navi Protocol 存入 1 SUI
- 上链网络: 主网(mainnet)

## 特别感谢
- 本 task 由 [Navi Protocol](https://app.naviprotocol.io) 特别赞助

## 需求
- 完成  Sui SDK 学习
- 完成  PTB的概念学习
- 完成  Navi Protocol 学习
- 完成  Navi SDK 存入Navi Protocol 1 SUI 获取交易 hash 完成任务

## 报错信息
> 如果遇到报错可能是更新了  `package id` 下面可以看到最新的id 替换一下sdk的值就行 
https://open-api.naviprotocol.io/api/package


## 任务指南
- [sui sdk](https://sdk.mystenlabs.com/typescript)
- [ptb sdk](https://sdk.mystenlabs.com/typescript/transaction-building/basics)
- [ptb concepts](https://docs.sui.io/concepts/transactions/prog-txn-blocks)
- [navi-sdk](https://github.com/naviprotocol/navi-sdk)
- [navi-docs](https://naviprotocol.gitbook.io/navi-protocol-developer-docs/how-to-interact-with-the-contract/navi-sdk/api-interface)


Run Script

```bash
➜  task6 git:(main) ✗ pnpm start

> task6@1.0.0 start /home/***/workspace/letsmove/mover/Mulander-J/code/task6
> node index.js

Network Type:  mainnet
List 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 all coins
Unknown Coin Type:  0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_faucet::MULANDER_FAUCET | Balance:  1
Coin Type:  Sui | Balance:  1.6605264599999998
{
  digest: '339Ue3VKgAV14PRagBpVU2yc74t5wK4Jkq1h9zXgRnm3',
  effects: {
    ...
```