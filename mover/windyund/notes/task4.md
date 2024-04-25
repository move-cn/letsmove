# 生成随机数问题，参考官方sui::test_random
# 考虑区块时间戳不够随机， 添加hash增加随机性
# 调用play clock参数传 0x6

### 1.发布合约
```shell
sui client publish --gas-budget=10000000
```


### 2.获取合约package id 
``` 
Transaction Digest: 5xvGJy8VD5CTyBw1BPoa8NcjjhyKpGEUzjEVD3mtj4TF
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                                   │
│ Gas Owner: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                                    │
│  │ Version: 95429854                                                                                         │
│  │ Digest: HuRKo8RUhpdH6QMVe3XJM2RWfA47dFycgeyA6SofNcuY                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    Li+ioiYkd6JalR2G9iZAAAJK+XhxXPv39AFhtZE9FkiJXmRHkRAqlR2zulV9uO1/DVa+3mhSosn59jf9bh6KCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5xvGJy8VD5CTyBw1BPoa8NcjjhyKpGEUzjEVD3mtj4TF                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 378                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x251d5c1fef82993d2c9ad6f433cc0fe7c4baeb94dcb1fc5d198c688c7b752313                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: HvMGVRYUSfx7JaNe9StY5WL1UGcvBoanJJcqrfZExeaw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x30a0aa7c9dcc532c1bfa108eab5051c2c149561c429484df97b8c79818196a93                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 95429855                                                                              │
│  │ Digest: 6qB9na1LyiZGktJHrde2qw4xzp9a7XNtzKf2UqZ1ppd8                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 95429855                                                                              │
│  │ Digest: 8NzDoWxSAYGm6tWdBSRaMi1DDB5oEFXnRaaTWS5B8aAC                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 95429855                                                                              │
│  │ Digest: 8NzDoWxSAYGm6tWdBSRaMi1DDB5oEFXnRaaTWS5B8aAC                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9462000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    9REcnRRHMHhz9ZMxFTL8VLGhiLUZo6W8z4uWT2nmqL3C                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x30a0aa7c9dcc532c1bfa108eab5051c2c149561c429484df97b8c79818196a93                  │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                    │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 95429855                                                                             │
│  │ Digest: 6qB9na1LyiZGktJHrde2qw4xzp9a7XNtzKf2UqZ1ppd8                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                  │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                    │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 95429855                                                                             │
│  │ Digest: 8NzDoWxSAYGm6tWdBSRaMi1DDB5oEFXnRaaTWS5B8aAC                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x251d5c1fef82993d2c9ad6f433cc0fe7c4baeb94dcb1fc5d198c688c7b752313                 │
│  │ Version: 1                                                                                    │
│  │ Digest: HvMGVRYUSfx7JaNe9StY5WL1UGcvBoanJJcqrfZExeaw                                          │
│  │ Modules: guess_number                                                                         │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9233880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```