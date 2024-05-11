#  实现一个最简单的swap
- 上链网络: 主网(mainnet)

## 需求
- 完成 swap相关知识的学习
- 完成第一个Swap合约的上链部署
- swap 必须是 swap 自己发行的 task2 两个 Coin的互换，包名必须是自己的`github id`
## 任务指南


1.Publish contract swap 

```bash
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf005ede4ba731cd7c58c164601362eab7349d29f1da20cf4952c10e7ead45c3d                  │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                    │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 101615935                                                                            │
│  │ Digest: GeYh9tqDn8sPccnuwMcdaADXL6uV7wLCPjpD9rMn62wZ                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x173a7538f4db6f31f914bfbbce1084e5b924faeddfb56c1cc5e5f74f12bf7c8b                  │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                    │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 101615935                                                                            │
│  │ Digest: 31oVss7gKKAVoELCujcEVaynNrjgePKZERayW3t9Yui7                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xb78e601ca72371f8eb0701d87fd96a725d7c117d4ebd31b0fa3c4d4730fec78b                 │
│  │ Version: 1                                                                                    │
│  │ Digest: DL52WKii3NasqsJddTEKChk1peasioPzcABboPZUYhux                                          │
│  │ Modules: mulander_swap                                                                        │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
```

- mulander_swap packageId = 0xb78e601ca72371f8eb0701d87fd96a725d7c117d4ebd31b0fa3c4d4730fec78b

2. Transfer coins to Create Pool

- CoinA Type = 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN
- CoinB Type = 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_faucet::MULANDER_FAUCET
- CoinA-1 ObjectID(100) = 0xbfdb9e7a03ff40fff4f76d707f0eaaed01df66ec00bacfe1e20a2b2f8ce25612
- CoinB-1 ObjectID(200) = 0x9aebacf6c89ddb85fc56017a12204e1db058f9892e15a295784c80293acd0b45

```
(package: 0xb78e…c78b, module: mulander_swap, function: create_pool, arguments: [Input(0), Input(1)], typeArguments: [0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN, 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_faucet::MULANDER_FAUCET])

Digest: F1xuFTsduM8aXKvwCUXnBBEzmbfpRyCzvixEHGquTgrq
```

- Pool ObjectId = 0xc925fdc7d5c433c0c16421d6ef8889270415f278684661e1f75e7fb7a7f93c80

3. Swap B to A

```
(package: 0xb78e…c78b, module: mulander_swap, function: swap_b_to_a, arguments: [Input(0), Input(1)], typeArguments: [0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN, 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_faucet::MULANDER_FAUCET])

Digest: GTzZcwd1qYtkioxGiTL1nJyDuTrXujhP95hWxawM2Z16
```

4. Swap A to B

```
Digest: EB7GmKFZq1XFDHLA5KZpdSTcg6ucUuyUFCrrE9a9sF4m
```