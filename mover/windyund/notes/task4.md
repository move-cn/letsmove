# 生成随机数问题，参考官方sui::test_random
# 考虑区块时间戳不够随机， 添加hash增加随机性
# 调用play clock参数传 0x6

### 1.发布合约
```shell
sui client publish --gas-budget=100000000
```


### 2.获取合约package id 
``` 
Transaction Digest: EbqLGNvU7SH9Fd57yrMDJtc5T4WF1514rcsrCCXL19L2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                                   │
│ Gas Owner: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                                    │
│  │ Version: 96618128                                                                                         │
│  │ Digest: 82Bh9uvMjRMmN3B16prRn3BXHgrbo7HYJ9nBeVY3o25V                                                      │
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
│    yRGuAg6FyMcbqcYeY7v8pk2k1jECtFMcwUzQ0c5bin2AkplmagcFwp9RxCxrEhSK8DEGe2Gg8Gh6JQKYq+TvBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EbqLGNvU7SH9Fd57yrMDJtc5T4WF1514rcsrCCXL19L2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 381                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8b1a2836062ea21d7d253d5f9e2469c0e15479f3deb81f315ba59651ed3dc860                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: E3QjcikZpptm4ciYhh48VfWFFaqURC3bgUfHRiUeEPpY                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdc09a942221b1a9f156b294a4e5d59e00d6ec43fff45b3195753855a50d591fe                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 96618129                                                                              │
│  │ Digest: CvweHBZ8WXQEHQxGFqfQy5J7Mv2CqKNb4pPfr6X4vJRm                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 96618129                                                                              │
│  │ Digest: BJmqjXa5K7KgE8UHQz9Q5FCjPCneZkugCuDPsNdrhqbw                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 96618129                                                                              │
│  │ Digest: BJmqjXa5K7KgE8UHQz9Q5FCjPCneZkugCuDPsNdrhqbw                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10898400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6Uz4Hz8MsmdoCdYcVNfYu3rSDGmym3vi1XAj2KBYPk32                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xdc09a942221b1a9f156b294a4e5d59e00d6ec43fff45b3195753855a50d591fe                  │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                    │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 96618129                                                                             │
│  │ Digest: CvweHBZ8WXQEHQxGFqfQy5J7Mv2CqKNb4pPfr6X4vJRm                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x15e0c109d4101cee0a2f43548c525eb04bbc8b8ceafe209bdb98704679b7c42e                  │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                    │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 96618129                                                                             │
│  │ Digest: BJmqjXa5K7KgE8UHQz9Q5FCjPCneZkugCuDPsNdrhqbw                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x8b1a2836062ea21d7d253d5f9e2469c0e15479f3deb81f315ba59651ed3dc860                 │
│  │ Version: 1                                                                                    │
│  │ Digest: E3QjcikZpptm4ciYhh48VfWFFaqURC3bgUfHRiUeEPpY                                          │
│  │ Modules: guess_number                                                                         │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10670280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

### 3.调用合约 play
获取task的share holder  package_id: 0xe010cfbda44d5424ce493de8b181f8fb7316360de78688b585f271f6961bc51e
获取task的share holder  object_id : 0x24a5449edc74cd3d2051dd84386c51471e410f8475d00b77bc3f6ff36bd16318