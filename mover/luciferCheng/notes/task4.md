# Task 4 - sui game
一个猜硬币游戏，简化一下就是猜 0、1

## 新建项目
新建项目
```bash
sui move new task4
```

构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：packageid： 0x6916c329b8a6d7a69dfcf424459f71b964a148d285111944bac281e0231fa0f4


## 玩游戏
```bash
sui client call --function guess --module coin_flip --package 0x6916c329b8a6d7a69dfcf424459f71b964a148d285111944bac281e0231fa0f4 --args 0 0x6 --gas-budget 50000000
```
得到结果： 
```
Transaction Digest: 3Hb6TH61EL63134QVJ69K3RjowDxiY8rj7P4VvRa3dis
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843                      │
│ Gas Owner: 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843                   │
│ Gas Budget: 50000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x338a3f7cad15f57165bec6c1dd60b49e2bf7d07edb1fcd8413c4a78082ff3342                       │
│  │ Version: 28759062                                                                            │
│  │ Digest: Fbfwe7ePg3MvwrCV3n1ZSjRCBiiuPzVnTmET2X3bURW                                          │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "0"                                                         │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  guess                                                              │            │
│ │  │ Module:    coin_flip                                                          │            │
│ │  │ Package:   0x6916c329b8a6d7a69dfcf424459f71b964a148d285111944bac281e0231fa0f4 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    c6ent09ooaflAeh4p5140+F6J92fZoVuWblAk7YvEbaCvkyJ9Vtr5s8xwSfeVikWbcSb7haufIxfb+u/Qy7HDg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3Hb6TH61EL63134QVJ69K3RjowDxiY8rj7P4VvRa3dis                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x338a3f7cad15f57165bec6c1dd60b49e2bf7d07edb1fcd8413c4a78082ff3342                         │
│  │ Owner: Account Address ( 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 )  │
│  │ Version: 29592984                                                                              │
│  │ Digest: DFxtr1LsgcDU7WPZtejfeworUTeYJJ2q7TWw9b125x38                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29592983                                                                              │
│  │ Digest: AgwGMzfbRFRondjHP4MwiFFfwrmnMML9iSKv7Nk2HM2a                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x338a3f7cad15f57165bec6c1dd60b49e2bf7d07edb1fcd8413c4a78082ff3342                         │
│  │ Owner: Account Address ( 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 )  │
│  │ Version: 29592984                                                                              │
│  │ Digest: DFxtr1LsgcDU7WPZtejfeworUTeYJJ2q7TWw9b125x38                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    67YgUuEhmpD8mCnmEYXmnijrDLKyUVq5mJA6tzthfKkL                                                   │
│    8KdwrbWZHUrHvGSMq3BAbQyMN4sEaZoyoAVf7uvxPM1j                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                               │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                   │
│  │ EventID: 3Hb6TH61EL63134QVJ69K3RjowDxiY8rj7P4VvRa3dis:0                                             │
│  │ PackageID: 0x6916c329b8a6d7a69dfcf424459f71b964a148d285111944bac281e0231fa0f4                       │
│  │ Transaction Module: coin_flip                                                                       │
│  │ Sender: 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843                          │
│  │ EventType: 0x6916c329b8a6d7a69dfcf424459f71b964a148d285111944bac281e0231fa0f4::coin_flip::GameEvent │
│  │ ParsedJSON:                                                                                         │
│  │   ┌──────────────┬─────────────┐                                                                    │
│  │   │ game_number  │ 1           │                                                                    │
│  │   ├──────────────┼─────────────┤                                                                    │
│  │   │ input_number │ 0           │                                                                    │
│  │   ├──────────────┼─────────────┤                                                                    │
│  │   │ output       │ You lose... │                                                                    │
│  │   └──────────────┴─────────────┘                                                                    │
│  └──                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x338a3f7cad15f57165bec6c1dd60b49e2bf7d07edb1fcd8413c4a78082ff3342                  │
│  │ Sender: 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843                    │
│  │ Owner: Account Address ( 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 29592984                                                                             │
│  │ Digest: DFxtr1LsgcDU7WPZtejfeworUTeYJJ2q7TWw9b125x38                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
