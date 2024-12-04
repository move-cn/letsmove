# Task1

测试网接水：
```bash
❯ sui client faucet
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
```

本地编译合约：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello
```

发布合约到测试网：
```bash
❯ sui client publish --gas-budget 30000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello
Successfully verified dependencies on-chain against source.
Transaction Digest: 34xwfiPfV4gUgewQPPTTvkgsJjch4xjF3P3zoo2dDgnv
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                   │
│ Gas Owner: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x35e8f0beacaec27662e49c5e7f41fe75a5e16fd53f2a312a0434b0aa908431ad                                    │
│  │ Version: 927453                                                                                           │
│  │ Digest: 65bpe6q6Wef12z1xqrSPjfkX3wMUvZjVFmBAr38GmXbz                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645" │ │
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
│    xuu7eM7ZYVL5RbaB5OABEOFpk5MRCnBW6cL8GDUxclK/JyhVyHmyKnfkG1k9jTal/WbuK4O186kfN07nZt15BA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 34xwfiPfV4gUgewQPPTTvkgsJjch4xjF3P3zoo2dDgnv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 339                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x69bf1ba862053ed9f2c7b6b713581e9d7be84da4a53d51321d921d0f1849985f                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 927454                                                                                │
│  │ Digest: 3vNkuhRbmL9B7hRRK5nbsHUh7wAq4xMUFGKsac7uJSyo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x95debcbfc1124fd3edfbbeddc63516565f8df233fe587d736d50017e1c34cb4f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2Yqi8rahNoBqbCAWkvDnvBErJ91DZKEzDaQYDWeuYZeH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaca364805538e5d0f2110d173a5d342a4f28de204fea28975de4da1ba79daff8                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 927454                                                                                │
│  │ Digest: GaTWqy9ifPiVVzcxm9FtS25A23YLjZgCsbadCBLRJSv5                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x35e8f0beacaec27662e49c5e7f41fe75a5e16fd53f2a312a0434b0aa908431ad                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 927454                                                                                │
│  │ Digest: CW4uaMCMiGG3CCyvRFvbSZiGf8SvTCL4pTbuVPynT2No                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x35e8f0beacaec27662e49c5e7f41fe75a5e16fd53f2a312a0434b0aa908431ad                         │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ Version: 927454                                                                                │
│  │ Digest: CW4uaMCMiGG3CCyvRFvbSZiGf8SvTCL4pTbuVPynT2No                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8869200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    HV22RAgJjYPfr6CzQkGwQShxLKhm1HzGtevxTWUQEhNz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x69bf1ba862053ed9f2c7b6b713581e9d7be84da4a53d51321d921d0f1849985f                  │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                    │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 ) │
│  │ ObjectType: 0x95debcbfc1124fd3edfbbeddc63516565f8df233fe587d736d50017e1c34cb4f::hello::Hello  │
│  │ Version: 927454                                                                               │
│  │ Digest: 3vNkuhRbmL9B7hRRK5nbsHUh7wAq4xMUFGKsac7uJSyo                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xaca364805538e5d0f2110d173a5d342a4f28de204fea28975de4da1ba79daff8                  │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                    │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 927454                                                                               │
│  │ Digest: GaTWqy9ifPiVVzcxm9FtS25A23YLjZgCsbadCBLRJSv5                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x35e8f0beacaec27662e49c5e7f41fe75a5e16fd53f2a312a0434b0aa908431ad                  │
│  │ Sender: 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645                    │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 927454                                                                               │
│  │ Digest: CW4uaMCMiGG3CCyvRFvbSZiGf8SvTCL4pTbuVPynT2No                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x95debcbfc1124fd3edfbbeddc63516565f8df233fe587d736d50017e1c34cb4f                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 2Yqi8rahNoBqbCAWkvDnvBErJ91DZKEzDaQYDWeuYZeH                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf643974764dffd64ebb53e6c3e83989e2e5601e64861b700aa0a09e24a01a645 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8891080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
