## 安装sui
```PowerShell
iex (iwr "https://gist.githubusercontent.com/WGB5445/73b3b54f8293125d4ba74260ea5a39ce/raw" ).Content
```

## sui用到的命令
```shell
sui --version
sui client publish  部署到链上，网络的配置可以去user/.sui、sui_config/client.yaml文件去修改
sui move build
sui move new hello_world
```

```shell
Successfully verified dependencies on-chain against source.
Transaction Digest: 7Di3hPcFxonNS8PRCBLYLZAG2KPBrJ6i31idMw7QD3X6
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0                                   │
│ Gas Owner: 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x9cb10b15305ab9471d56c0ab49b068079ddef6a1773f95ffaebe2ddd58c4aacc                                    │
│  │ Version: 585                                                                                              │
│  │ Digest: 71Ueb411pW29SGQH8Db8zpPvJVLUqiWhADkkGBng71ZF                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0" │ │
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
│    F+DhO5riAdmcyM+wynpGrzoiVZ/8zkHIxrm7oNWW7lxfuFZFjRvgzc9Ctp8dHFVkr0BDHZqX+FYQ99KDQ2N7Cg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7Di3hPcFxonNS8PRCBLYLZAG2KPBrJ6i31idMw7QD3X6                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1620                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x525168dee3f551760cf66323fb6e8a0ae0936c97910eb4ee8a7ef21a85ca9e48                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Cc2NWJa7q64QiCuVqQH1PUGGxa3GtGDj6mqeuML8K84M                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x629acba30ac1503ef81d3d6b1e688d5e37288c5bcd90d176c0717fc2b135c726                         │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 )  │
│  │ Version: 586                                                                                   │
│  │ Digest: 8QbnnVP2pM5SeaCdyjXn8KAtQvk8bVNyj5R35wA6cEmf                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf9af52888d05801784ba8ac74898f5f716eedb17cc34bbdc4950717ef5b5658c                         │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 )  │
│  │ Version: 586                                                                                   │
│  │ Digest: 7HS8L3VQpCLwLenFNnw5JLAwKHE9W9yQjDBaRxKhodNk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9cb10b15305ab9471d56c0ab49b068079ddef6a1773f95ffaebe2ddd58c4aacc                         │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 )  │
│  │ Version: 586                                                                                   │
│  │ Digest: 8845yUQDkJWMrdmvM9xYa4gymTodYbkmUJWcukDoKF7K                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x9cb10b15305ab9471d56c0ab49b068079ddef6a1773f95ffaebe2ddd58c4aacc                         │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 )  │
│  │ Version: 586                                                                                   │
│  │ Digest: 8845yUQDkJWMrdmvM9xYa4gymTodYbkmUJWcukDoKF7K                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8770400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9ZqxQjFyj2EMuS6d4bXb7FRkbB2RQp3vPoJERxtLFF8b                                                   │
│    EVa7rxmzUPGdKw6YcK4pPheu3FLE1vCp2WmCn12TKhLN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x629acba30ac1503ef81d3d6b1e688d5e37288c5bcd90d176c0717fc2b135c726                  │
│  │ Sender: 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0                    │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 586                                                                                  │
│  │ Digest: 8QbnnVP2pM5SeaCdyjXn8KAtQvk8bVNyj5R35wA6cEmf                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf9af52888d05801784ba8ac74898f5f716eedb17cc34bbdc4950717ef5b5658c                  │
│  │ Sender: 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0                    │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 ) │
│  │ ObjectType: 0x525168dee3f551760cf66323fb6e8a0ae0936c97910eb4ee8a7ef21a85ca9e48::hello::Hello  │
│  │ Version: 586                                                                                  │
│  │ Digest: 7HS8L3VQpCLwLenFNnw5JLAwKHE9W9yQjDBaRxKhodNk                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x9cb10b15305ab9471d56c0ab49b068079ddef6a1773f95ffaebe2ddd58c4aacc                  │
│  │ Sender: 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0                    │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 586                                                                                  │
│  │ Digest: 8845yUQDkJWMrdmvM9xYa4gymTodYbkmUJWcukDoKF7K                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x525168dee3f551760cf66323fb6e8a0ae0936c97910eb4ee8a7ef21a85ca9e48                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Cc2NWJa7q64QiCuVqQH1PUGGxa3GtGDj6mqeuML8K84M                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8792280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

