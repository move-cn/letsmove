## use command
```shell

```shell
# mint X
sui client call --package  0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124\
                --module Lumia001Coin \
                --function mint \
                --gas-budget 100000000 \
                --args 0x3428d0b61176fcc6b8076be0ecc341f38643065028ec41ef176267cacb0af896  \
                       200000000 \
                       0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59
                       
# mint Y               
sui client call --package  0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124\
                --module Lumia001Faucet \
                --function mint \
                --gas-budget 10000000 \
                --args 0x55dba045d64cab75c3ac52a8c5add543d3dff9a1e2669a030b1a901971b16422  
```

```
## oparation's key info.

```text

coin hash:
88E6YAC3LiLApMwNvdnyKGDiZ8PcCyVRHSxkUHENiYQo

faucet hash 1 2:
12aB5Xi9TW9xLcbx71Ug1js8qb7884eaTJDe1s8QywZe




# Holder
0x55dba045d64cab75c3ac52a8c5add543d3dff9a1e2669a030b1a901971b16422

# cap
0x3428d0b61176fcc6b8076be0ecc341f38643065028ec41ef176267cacb0af896

# pacageId: 
0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124

# type

0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Faucet::LUMIA001FAUCET

0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Coin::LUMIA001COIN

```

## publish record.

```text
[warn] Client/Server api version mismatch, client api version : 1.26.0, server api version : 1.25.2
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING lumia001
Successfully verified dependencies on-chain against source.
Error executing transaction: Failure {
    error: "InsufficientGas",
}
gorden@Gordendebijibendiannao task2 % sui client publish --gas-budget 100000000
[warn] Client/Server api version mismatch, client api version : 1.26.0, server api version : 1.25.2
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING lumia001
Successfully verified dependencies on-chain against source.
Transaction Digest: 42cT8aW1SvWSnybRRjyesdCkPYSeUHDHdv1cMznu7KMd
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                   │
│ Gas Owner: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                                    │
│  │ Version: 211023822                                                                                        │
│  │ Digest: 7B26jFJ69fWiJKkjLC5jyiD8wac9MdwCdkCYX74aSLMd                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59" │ │
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
│    NAq00Cv7Xt1fDy4lzaQNqePmgdfwJdjfYeSXfrPgrzJ9HlTpMy8HwOifmAjPBZ3Ve3uXOhCy88ths5N9g9n5Ag==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 42cT8aW1SvWSnybRRjyesdCkPYSeUHDHdv1cMznu7KMd                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 417                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x137d82fbc5d6e1dd1696f60f839a0d84464ec4d9fbe8769a1a270ff8b6e66113                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023823                                                                             │
│  │ Digest: Da9Gvrk6MU1J4Voi4yTAhB1oLSxYQQpdubK6cYSYRfwA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3428d0b61176fcc6b8076be0ecc341f38643065028ec41ef176267cacb0af896                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023823                                                                             │
│  │ Digest: HHENDt83cRt2HETFEoFiBp6iiBQDyt2vYz64weWsVrdn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x55dba045d64cab75c3ac52a8c5add543d3dff9a1e2669a030b1a901971b16422                         │
│  │ Owner: Shared( 211023823 )                                                                     │
│  │ Version: 211023823                                                                             │
│  │ Digest: EwWyZqcGyP9WN7bKWNXf4yUpbhCb9VKe9gAfqCc1WJgV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9118a9feb9fd3ac4a1e4d67325e759a27d995a5080cca0a2d82b32f6ea46456c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 211023823                                                                             │
│  │ Digest: RYBVyTQo9HyNj5jFGQtG7NZ14R1u9JiL4DjJrH8mZth                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb17ecb81e29ff8a7743139aa3eb432e1eb3ff52ccb1a699a31762c2d6803c7e8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 211023823                                                                             │
│  │ Digest: 9YK4mjyoiZJb1dtqZTZNgur1i21kwisbEuk143Jd8e22                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: HAMP7RaED9Ui8MLMvay56UWe8rQtfNkJnLyn4x9XNEc9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3a3e296329b424a8d714d4aca2a78cd26da6190f700ea8b611dd19753d32fa1                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023823                                                                             │
│  │ Digest: 3ywzeKMBidwKcXMsgZKNzAzaMpUunL27sUfM5sPFBH1k                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023823                                                                             │
│  │ Digest: FA5qXwWrjNvVcYSrMDRnMM3XAdgveNm27c3PfcNm1v3P                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023823                                                                             │
│  │ Digest: FA5qXwWrjNvVcYSrMDRnMM3XAdgveNm27c3PfcNm1v3P                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 28287200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4XBzPPUYo9Cgx6G3yuBvx58uZaKs13KV3oxnv9nXiWtw                                                   │
│    FZQQfVC428RKpDcuobUQVp45DMM4PwiELT4YH4ivaHZA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x137d82fbc5d6e1dd1696f60f839a0d84464ec4d9fbe8769a1a270ff8b6e66113                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                                            │
│  │ ObjectType: 0x2::coin::Coin<0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Coin::LUMIA001COIN>              │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: Da9Gvrk6MU1J4Voi4yTAhB1oLSxYQQpdubK6cYSYRfwA                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x3428d0b61176fcc6b8076be0ecc341f38643065028ec41ef176267cacb0af896                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Coin::LUMIA001COIN>       │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: HHENDt83cRt2HETFEoFiBp6iiBQDyt2vYz64weWsVrdn                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x55dba045d64cab75c3ac52a8c5add543d3dff9a1e2669a030b1a901971b16422                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Shared( 211023823 )                                                                                                               │
│  │ ObjectType: 0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Faucet::TreasuryCapHolder                        │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: EwWyZqcGyP9WN7bKWNXf4yUpbhCb9VKe9gAfqCc1WJgV                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x9118a9feb9fd3ac4a1e4d67325e759a27d995a5080cca0a2d82b32f6ea46456c                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Immutable                                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Coin::LUMIA001COIN>      │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: RYBVyTQo9HyNj5jFGQtG7NZ14R1u9JiL4DjJrH8mZth                                                                                      │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0xb17ecb81e29ff8a7743139aa3eb432e1eb3ff52ccb1a699a31762c2d6803c7e8                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Immutable                                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Faucet::LUMIA001FAUCET>  │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: 9YK4mjyoiZJb1dtqZTZNgur1i21kwisbEuk143Jd8e22                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0xf3a3e296329b424a8d714d4aca2a78cd26da6190f700ea8b611dd19753d32fa1                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                     │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: 3ywzeKMBidwKcXMsgZKNzAzaMpUunL27sUfM5sPFBH1k                                                                                     │
│  └──                                                                                                                                        │
│ Mutated Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                               │
│  │ Version: 211023823                                                                                                                       │
│  │ Digest: FA5qXwWrjNvVcYSrMDRnMM3XAdgveNm27c3PfcNm1v3P                                                                                     │
│  └──                                                                                                                                        │
│ Published Objects:                                                                                                                          │
│  ┌──                                                                                                                                        │
│  │ PackageID: 0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124                                                            │
│  │ Version: 1                                                                                                                               │
│  │ Digest: HAMP7RaED9Ui8MLMvay56UWe8rQtfNkJnLyn4x9XNEc9                                                                                     │
│  │ Modules: Lumia001Coin, Lumia001Faucet                                                                                                    │
│  └──                                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                              │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )             │
│  │ CoinType: 0x2::sui::SUI                                                                                   │
│  │ Amount: -28059080                                                                                         │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )             │
│  │ CoinType: 0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124::Lumia001Coin::LUMIA001COIN  │
│  │ Amount: 100000000                                                                                         │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```