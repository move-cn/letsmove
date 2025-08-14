# Task 1 - sui game

## 创建并项目
### 新建项目
```bash
sui move new mygame
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

得到结果：
```bash
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mygame
Successfully verified dependencies on-chain against source.
Transaction Digest: 81s7axGJhJgSCmZbDziqXtPon77hz5rQd7e46x9zZ9XK
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                   │
│ Gas Owner: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                                    │
│  │ Version: 27698110                                                                                         │
│  │ Digest: 2e2SnA6K5Rh4NshoUnEqawYxqHpsd5YwX8uEst6n2yXu                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897" │ │
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
│    Kn/xc7NdjzJnSEKH5l69mmRcgiL+E9dGl2dq/bTlSspK1gCi/Ky9bjJz+XhWto/WIBnPK2FXMRPH6q1t+vSCIg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 81s7axGJhJgSCmZbDziqXtPon77hz5rQd7e46x9zZ9XK                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 322                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xcd53ba8725ccf1c022b1cdaeabc9a710d23fd17e05da76e892bf2cc1357b8862                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 27698111                                                                              │
│  │ Digest: 55sqAyxSaohDmFrHSB9MT2prPrLQG5gfWkvUNytWb5M3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DvJwrWQCD7yosAXbK6R7R1zH7XMG8mbMFkCRBS9EwU5p                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 27698111                                                                              │
│  │ Digest: 8ZFZd2KBiLU5hpQNvTPK426LvQtNxTvVH4KUkWYH7MdM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 27698111                                                                              │
│  │ Digest: 8ZFZd2KBiLU5hpQNvTPK426LvQtNxTvVH4KUkWYH7MdM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15200000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    3sKTGBLZyq6eDgESWgENNWUEm1URucstCUUUrbxSqzTy                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xcd53ba8725ccf1c022b1cdaeabc9a710d23fd17e05da76e892bf2cc1357b8862                  │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                    │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 27698111                                                                             │
│  │ Digest: 55sqAyxSaohDmFrHSB9MT2prPrLQG5gfWkvUNytWb5M3                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                  │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                    │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 27698111                                                                             │
│  │ Digest: 8ZFZd2KBiLU5hpQNvTPK426LvQtNxTvVH4KUkWYH7MdM                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3                 │
│  │ Version: 1                                                                                    │
│  │ Digest: DvJwrWQCD7yosAXbK6R7R1zH7XMG8mbMFkCRBS9EwU5p                                          │
│  │ Modules: guess, score_ft                                                                      │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15221880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
关键信息：
packageid: 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3

## 玩游戏
### 玩游戏
```bash
#初始化计分卡
sui client call --function mint_and_transfer --module score_ft --package 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3 --gas-budget 50000000

# 得到积分存储的object： 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882

#查看object信息
sui client object 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882

# 查看现有分数
sui client call --function count --module score_ft --package 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3 --args 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882 --gas-budget 50000000

```


### 玩游戏
```bash
# 系统时钟地址是 0x6
sui client call --function play --module guess --package 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3 --args 3 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882 0x6 --gas-budget 50000000

# 查看分数
sui client call --function count --module score_ft --package 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3 --args 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882 --gas-budget 50000000

```
过程中也可以看到通知的事件
```bash
Transaction Digest: FWGz3gmYrt7wMCPxd5Cuk7JzYUf2Vtx5wcRYZ33KeXT4
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                      │
│ Gas Owner: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                   │
│ Gas Budget: 50000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                       │
│  │ Version: 27698114                                                                            │
│  │ Digest: 361LvRDV7xujY7DVF9i6vQpeFiw5sGCoKDdCNadKER1L                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "3"                                                         │ │
│ │ 1   Imm/Owned Object ID: 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882 │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    guess                                                              │            │
│ │  │ Package:   0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    ciYkYWiy8Krup+GZ+WkMuLKy23GHcyxireKnIrnmLKICiCkBdZaIK/M4LSubRIapZATjDUklWO2XOt4+iKirjw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FWGz3gmYrt7wMCPxd5Cuk7JzYUf2Vtx5wcRYZ33KeXT4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 322                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 27698605                                                                              │
│  │ Digest: 7GYnZSwu9XGiuuEXx1SA8N95Rj6CSYguqi7qNqp23s5o                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 27698605                                                                              │
│  │ Digest: Ahmdkm7mEhJtzKUBzfmRFS8yaTMYfzMDVujHcjytXLvr                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 27698604                                                                              │
│  │ Digest: HhzGYKnjzf8bCETLmtPK3vP4aqTkvT4BG3KnLApmcWKM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 27698605                                                                              │
│  │ Digest: 7GYnZSwu9XGiuuEXx1SA8N95Rj6CSYguqi7qNqp23s5o                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2356000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2332440 MIST                                                                   │
│    Non-refundable Storage Fee: 23560 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    81s7axGJhJgSCmZbDziqXtPon77hz5rQd7e46x9zZ9XK                                                   │
│    AnyBbMAGhNoKuSZGpp2dAnamKuyxXBbfFyireAbNs7YB                                                   │
│    EgbpWG8naPgmfXYChuvMV7acxYHT7Y2mmDRCsjJd5tiB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                │
│  │ EventID: FWGz3gmYrt7wMCPxd5Cuk7JzYUf2Vtx5wcRYZ33KeXT4:0                                          │
│  │ PackageID: 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3                    │
│  │ Transaction Module: guess                                                                        │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                       │
│  │ EventType: 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3::guess::GameOutPut │
│  │ ParsedJSON:                                                                                      │
│  │   ┌──────────────┬────────────────────────────────────────────────────────────────────┐          │
│  │   │ game_number  │ 8                                                                  │          │
│  │   ├──────────────┼────────────────────────────────────────────────────────────────────┤          │
│  │   │ guess_number │ 3                                                                  │          │
│  │   ├──────────────┼────────────────────────────────────────────────────────────────────┤          │
│  │   │ output       │ player lose                                                        │          │
│  │   ├──────────────┼────────────────────────────────────────────────────────────────────┤          │
│  │   │ player       │ 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 │          │
│  │   ├──────────────┼────────────────────────────────────────────────────────────────────┤          │
│  │   │ score        │ 0                                                                  │          │
│  │   └──────────────┴────────────────────────────────────────────────────────────────────┘          │
│  └──                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────╯╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x6d949a8458031299adaf09e973aea1d6d33bab20ed0c446c8e933c4667a63783                       │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 27698605                                                                                  │
│  │ Digest: 7GYnZSwu9XGiuuEXx1SA8N95Rj6CSYguqi7qNqp23s5o                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0xcbb1886c935a5876c3160ade0794cf4a215ed6bcdccbf006db0f24f61e609882                       │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )      │
│  │ ObjectType: 0xd98ea11923ba2ef6622ec8caecb04c3efbb6a71bc088f15531275a6900acf3e3::score_ft::Counter  │
│  │ Version: 27698605                                                                                  │
│  │ Digest: Ahmdkm7mEhJtzKUBzfmRFS8yaTMYfzMDVujHcjytXLvr                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1023560                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

注：在前端玩游戏的时候https://docs.sui.io/sui-api-ref#suix_getownedobjects 用这个可以查到用户的积分object