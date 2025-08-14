--- 任务要求 begin---

# 完成两个Coin合约的上链部署

- 上链网络: mainnet

## 需求

- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布 `package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- `Faucet Coin` 需要至少用两个地址mint

# 学习要点

1. 理解Coin协议 创建Coin
2. 理解独享所有权和共享所有权的区别
3. 对共享所有权保持敬畏 因为权限被共享了

public_transfer 独享 mint权限
public_share_object 共享 mint权限

## 任务指南

- `Faucet Coin` 就是任意人都可以mint的Coin
- `My Coin`  只能指定地址mint

--- 任务要求 end---

--- task begin---

# task 任务

### 本地本地导入主网密匙
```text
1:官网导出钱包密匙
2:钱包密匙导入到本地
3:切换使用钱包

查看地址
sui client addresses
切换地址
sui client switch --address <addr>

导入地址，用助记词
sui keytool import "<助记词>" ed25519


列出当前所有网络别名: 
sui client envs

添加新的网络别名: 
sui client new-env --alias <ALIAS> --rpc <RPC>

切换网络: 
sui client switch --env [network alias]


查询当前保存了密钥的地址: 
sui client addresses
查询当前启用的地址: 
sui client active-address

列出所拥有的 gas objects:
sui client gas

发布
sui client publish   //一般5后面8个0就可以,表示最多花0.1sui

```

### 切换到主网
```text
    0. 查看当前网络:sui client envs
    1. 到sui官网上右上角点击选择mainnet, 然后copy一下： 
       https://sui-mainnet-endpoint.blockvision.org
    2. 把该地址添加到本地的env中, 注意在地址最后加上‘:443’
       sui client new-env --alias mainnet --rpc https://sui-mainnet-endpoint.blockvision.org:443
    3. 切换到主网
       sui client switch --env mainnet
```

### 创建项目

```shell
# 创建项目
sui move new hello_world
```

### 编写代码

- 完成 HuiWang_World_Coin.move 与 HuiWang_World_Faucet_Coin.move 两个文件的代码
- 发布到测试网
```shell
sui client publish 
```
- 执行结果
```shell
Transaction Digest: EgV4yWVJkAPVFAPqQciYk1bsAuJK6AsQ7LWAimVBUWHY
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 751 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                    │
│  │ Version: 103342232                                                                                        │
│  │ Digest: 5TQ3NKLPkWcA3cDaoEdgU8SFeEpqNGcfgPZhxdM7XRQL                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896" │ │
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
│    jHmePD9gawaKW4cDcNoJPNUEtpqaASOuBLtijhOvDgOE8sHrFuEWlOuX6au0jYpVjtSJdZZsB+LQF+ESM4VJDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EgV4yWVJkAPVFAPqQciYk1bsAuJK6AsQ7LWAimVBUWHY                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 438                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37cded3bf24731275da77721a6ededc1ce5b833cc50e1b248fe1a339373c102e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 103342233                                                                             │
│  │ Digest: 7UCkRQQsPKkQ3HPkC7wdWsxvniqeY4Cqpz7LtYRkktQa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89                         │
│  │ Owner: Shared( 103342233 )                                                                     │
│  │ Version: 103342233                                                                             │
│  │ Digest: FkjVckYfX24HmSe4RW8Awc2ahZdtUG9qWScgsZ1JqvMZ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8035f82c7d326f562bec2d94282bea374ff95763733632d57a7d8d3d65ee1246                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 103342233                                                                             │
│  │ Digest: GaaPW67rczbtrHPjocPU7rCwgG6n8SKqQoG8ZKCrd8f8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x935063ab9c196e1936cb4372739184490761aa680c5f9c11beb12cd1714e2aba                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342233                                                                             │
│  │ Digest: 5BwrHDnZpVwm81dGeVdKcaAv2Q5KpYXbmA17Lm3427qa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: C8za7bjmPTMxKgtq5ZDwDyh3SjZVG5sfQvLdBTG3jgVm                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfe8d1b1d7bbc7d42350764b64e79450765082effd5ca9e9942c5fb1b7fba9b23                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342233                                                                             │
│  │ Digest: GxAGtkYF4KjNR9hFY5ikGwRxPTnCnDSNhQpx8kBJXo3S                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342233                                                                             │
│  │ Digest: F1wgrR3GoS5JsVGCbJ21pqXLzNGDLtkWEjtuyhe4s4DG                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342233                                                                             │
│  │ Digest: F1wgrR3GoS5JsVGCbJ21pqXLzNGDLtkWEjtuyhe4s4DG                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 29290400 MIST                                                                    │
│    Computation Cost: 751000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DapHQugyZkcz5ebTaqv8WR2i6pSRbL1adbRKM66Mxbsz                                                   │
│    EY8ZaDkjhyBXX8iu9HXPQWznBp4QUcpAaTuwXSheDVuq                                                   │
│    FZQQfVC428RKpDcuobUQVp45DMM4PwiELT4YH4ivaHZA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                  │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x37cded3bf24731275da77721a6ededc1ce5b833cc50e1b248fe1a339373c102e                                                                                   │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                     │
│  │ Owner: Immutable                                                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN>                │
│  │ Version: 103342233                                                                                                                                             │
│  │ Digest: 7UCkRQQsPKkQ3HPkC7wdWsxvniqeY4Cqpz7LtYRkktQa                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89                                                                                   │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                     │
│  │ Owner: Shared( 103342233 )                                                                                                                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN>                 │
│  │ Version: 103342233                                                                                                                                             │
│  │ Digest: FkjVckYfX24HmSe4RW8Awc2ahZdtUG9qWScgsZ1JqvMZ                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x8035f82c7d326f562bec2d94282bea374ff95763733632d57a7d8d3d65ee1246                                                                                   │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                     │
│  │ Owner: Immutable                                                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>  │
│  │ Version: 103342233                                                                                                                                             │
│  │ Digest: GaaPW67rczbtrHPjocPU7rCwgG6n8SKqQoG8ZKCrd8f8                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x935063ab9c196e1936cb4372739184490761aa680c5f9c11beb12cd1714e2aba                                                                                   │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                                  │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>   │
│  │ Version: 103342233                                                                                                                                             │
│  │ Digest: 5BwrHDnZpVwm81dGeVdKcaAv2Q5KpYXbmA17Lm3427qa                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0xfe8d1b1d7bbc7d42350764b64e79450765082effd5ca9e9942c5fb1b7fba9b23                                                                                   │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                                  │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                                           │
│  │ Version: 103342233                                                                                                                                             │
│  │ Digest: GxAGtkYF4KjNR9hFY5ikGwRxPTnCnDSNhQpx8kBJXo3S                                                                                                           │
│  └──                                                                                                                                                              │
│ Mutated Objects:                                                                                                                                                  │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                                                                   │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                     │
│  │ Version: 103342233                                                                                                                                             │
│  │ Digest: F1wgrR3GoS5JsVGCbJ21pqXLzNGDLtkWEjtuyhe4s4DG                                                                                                           │
│  └──                                                                                                                                                              │
│ Published Objects:                                                                                                                                                │
│  ┌──                                                                                                                                                              │
│  │ PackageID: 0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa                                                                                  │
│  │ Version: 1                                                                                                                                                     │
│  │ Digest: C8za7bjmPTMxKgtq5ZDwDyh3SjZVG5sfQvLdBTG3jgVm                                                                                                           │
│  │ Modules: HuiWang_World_Coin, HuiWang_World_Faucet_Coin                                                                                                         │
│  └──                                                                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -29063280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


- 使用水龙头产生gas
```shell
 sui client call  \
 --package  0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa \
 --module HuiWang_World_Faucet_Coin \
 --function mint \
 --args 0x935063ab9c196e1936cb4372739184490761aa680c5f9c11beb12cd1714e2aba 100000000000 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896

```


- 执行 shell 结果
```shell
Transaction Digest: G32Rz8CrZMyv8umGg5c2hpCYjAT4vcPnqFj5pFWUnRcZ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 751 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                    │
│  │ Version: 103342233                                                                                        │
│  │ Digest: F1wgrR3GoS5JsVGCbJ21pqXLzNGDLtkWEjtuyhe4s4DG                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x935063ab9c196e1936cb4372739184490761aa680c5f9c11beb12cd1714e2aba              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    HuiWang_World_Faucet_Coin                                          │                         │
│ │  │ Package:   0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    bAuUrv/O1Ucdt4O7pRnfsvUAvCuOUeyR6aoiwnZ4tBX6ZaWkQNoyS4PkI4b6Jpei9hO8e6KkK+X6XLcdwb49BQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: G32Rz8CrZMyv8umGg5c2hpCYjAT4vcPnqFj5pFWUnRcZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 438                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xadafcbf42e98a159fe2d5fa093237cbb52654cb76312b8999d5d58be09358090                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342234                                                                             │
│  │ Digest: tGdCqHUEoDUDUrbY1ms4GCWjWcuRC9nxLPeC4P1vs49                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342234                                                                             │
│  │ Digest: HnwZQ9FbkdwreaxtSVnUSsoqb4uEPHA9Bsvdt91jg3jC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x935063ab9c196e1936cb4372739184490761aa680c5f9c11beb12cd1714e2aba                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342234                                                                             │
│  │ Digest: 57DrSuPMUhKg5SMk364NWgi8qTTaJUcMy6EeFTRN32xz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342234                                                                             │
│  │ Digest: HnwZQ9FbkdwreaxtSVnUSsoqb4uEPHA9Bsvdt91jg3jC                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4651200 MIST                                                                     │
│    Computation Cost: 751000 MIST                                                                  │
│    Storage Rebate: 2979504 MIST                                                                   │
│    Non-refundable Storage Fee: 30096 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EgV4yWVJkAPVFAPqQciYk1bsAuJK6AsQ7LWAimVBUWHY                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                 │
│  ┌──                                                                                                                                                             │
│  │ ObjectID: 0xadafcbf42e98a159fe2d5fa093237cbb52654cb76312b8999d5d58be09358090                                                                                  │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                    │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                                 │
│  │ ObjectType: 0x2::coin::Coin<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>         │
│  │ Version: 103342234                                                                                                                                            │
│  │ Digest: tGdCqHUEoDUDUrbY1ms4GCWjWcuRC9nxLPeC4P1vs49                                                                                                           │
│  └──                                                                                                                                                             │
│ Mutated Objects:                                                                                                                                                 │
│  ┌──                                                                                                                                                             │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                                                                  │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                    │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                    │
│  │ Version: 103342234                                                                                                                                            │
│  │ Digest: HnwZQ9FbkdwreaxtSVnUSsoqb4uEPHA9Bsvdt91jg3jC                                                                                                          │
│  └──                                                                                                                                                             │
│  ┌──                                                                                                                                                             │
│  │ ObjectID: 0x935063ab9c196e1936cb4372739184490761aa680c5f9c11beb12cd1714e2aba                                                                                  │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                                    │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                                 │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>  │
│  │ Version: 103342234                                                                                                                                            │
│  │ Digest: 57DrSuPMUhKg5SMk364NWgi8qTTaJUcMy6EeFTRN32xz                                                                                                          │
│  └──                                                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                        │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                       │
│  │ CoinType: 0x2::sui::SUI                                                                                                             │
│  │ Amount: -2422696                                                                                                                    │
│  └──                                                                                                                                   │
│  ┌──                                                                                                                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                       │
│  │ CoinType: 0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN  │
│  │ Amount: 100000000000                                                                                                                │
│  └──                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

```shell
##### 铸造 COIN（HUIWANG_WORLD_COIN）
 sui client call  \
 --package  0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa \
 --module HuiWang_World_Coin \
 --function mint \
 --args 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89 100000000000 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896
```
- 执行 shell 结果
```shell
Transaction Digest: 9NnB6gsajeued5PSnJaYWQPQyhKvV1yQ4TadJ8LSuobV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 751 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                    │
│  │ Version: 103342234                                                                                        │
│  │ Digest: HnwZQ9FbkdwreaxtSVnUSsoqb4uEPHA9Bsvdt91jg3jC                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    HuiWang_World_Coin                                                 │                         │
│ │  │ Package:   0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    KwkxmUYkFZlvk0xLAV0Gt4QAx5Wj37uJycDh7ptPYWdEMr8teIiZj29GfJEXgQmxMOOLZPGJMnkbjPAkcF07CQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9NnB6gsajeued5PSnJaYWQPQyhKvV1yQ4TadJ8LSuobV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 438                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342235                                                                             │
│  │ Digest: EvP8QKiEELo2ZADAGRm2MiRHKxqAmVTGKSAPFXCxhFC                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89                         │
│  │ Owner: Shared( 103342233 )                                                                     │
│  │ Version: 103342235                                                                             │
│  │ Digest: DU8bzE6bucNXZvdgn7YgoJsEfAn7qmcDPS1bupLGctUa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342235                                                                             │
│  │ Digest: G7pz33RnKiNRCn8615kjjLcsx96EQzvFDcEZGNRrauQ8                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89                         │
│  │ Version: 103342233                                                                             │
│  │ Digest: FkjVckYfX24HmSe4RW8Awc2ahZdtUG9qWScgsZ1JqvMZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342235                                                                             │
│  │ Digest: G7pz33RnKiNRCn8615kjjLcsx96EQzvFDcEZGNRrauQ8                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4438400 MIST                                                                     │
│    Computation Cost: 751000 MIST                                                                  │
│    Storage Rebate: 2874168 MIST                                                                   │
│    Non-refundable Storage Fee: 29032 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EgV4yWVJkAPVFAPqQciYk1bsAuJK6AsQ7LWAimVBUWHY                                                   │
│    G32Rz8CrZMyv8umGg5c2hpCYjAT4vcPnqFj5pFWUnRcZ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                   │
│  ┌──                                                                                                                                               │
│  │ ObjectID: 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0                                                                    │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                      │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                   │
│  │ ObjectType: 0x2::coin::Coin<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN>         │
│  │ Version: 103342235                                                                                                                              │
│  │ Digest: EvP8QKiEELo2ZADAGRm2MiRHKxqAmVTGKSAPFXCxhFC                                                                                             │
│  └──                                                                                                                                               │
│ Mutated Objects:                                                                                                                                   │
│  ┌──                                                                                                                                               │
│  │ ObjectID: 0x5319118d1631af0bfc29f4ac20dbf525b0a9820f29ebe2b870fdf1e6e6f3ae89                                                                    │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                      │
│  │ Owner: Shared( 103342233 )                                                                                                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN>  │
│  │ Version: 103342235                                                                                                                              │
│  │ Digest: DU8bzE6bucNXZvdgn7YgoJsEfAn7qmcDPS1bupLGctUa                                                                                            │
│  └──                                                                                                                                               │
│  ┌──                                                                                                                                               │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                                                    │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                                      │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                      │
│  │ Version: 103342235                                                                                                                              │
│  │ Digest: G7pz33RnKiNRCn8615kjjLcsx96EQzvFDcEZGNRrauQ8                                                                                            │
│  └──                                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                         │
│  │ CoinType: 0x2::sui::SUI                                                                                               │
│  │ Amount: -2315232                                                                                                      │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                         │
│  │ CoinType: 0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN  │
│  │ Amount: 100000000000                                                                                                  │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 查看铸币结果 https://suivision.xyz/account/0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896

- 给任务地址发送mycoin
```shell
## --object-id 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0 铸成币的币地址 ObjectID: 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0
## --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2  接受者钱包地址
sui client transfer --gas-budget 10000000 \
  --object-id 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0 \
  --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
```
- shell 结果
```shell
Transaction Digest: EXNu2hebvcsuTpnh5Higoi4BBiWy6BZ1hKJ4jKYiH2rD
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 751 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                    │
│  │ Version: 103342235                                                                                        │
│  │ Digest: G7pz33RnKiNRCn8615kjjLcsx96EQzvFDcEZGNRrauQ8                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ │ 1   Imm/Owned Object ID: 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0              │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────╮                                                                                     │
│ │ Commands             │                                                                                     │
│ ├──────────────────────┤                                                                                     │
│ │ 0  TransferObjects:  │                                                                                     │
│ │  ┌                   │                                                                                     │
│ │  │ Arguments:        │                                                                                     │
│ │  │   Input  1        │                                                                                     │
│ │  │ Address: Input  0 │                                                                                     │
│ │  └                   │                                                                                     │
│ ╰──────────────────────╯                                                                                     │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    BQ/tkQKlcvrP95v4OwC1jFIaXe6q5+WaIJz7Ao83MTcjLZp2fzIF7g98hwYHXUHHsRZEMQU2jAlwjb3vv6v5BA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EXNu2hebvcsuTpnh5Higoi4BBiWy6BZ1hKJ4jKYiH2rD                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 438                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 103342236                                                                             │
│  │ Digest: DpALUDpBYryQR2yKJrEf2zYuHbC7B4DRmvu7qCoYDGx3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342236                                                                             │
│  │ Digest: DZomESnvHDyYzDKrPAjPCVAYhSKDyZWnkT61BJ2Jm7v3                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342236                                                                             │
│  │ Digest: DZomESnvHDyYzDKrPAjPCVAYhSKDyZWnkT61BJ2Jm7v3                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2523200 MIST                                                                     │
│    Computation Cost: 751000 MIST                                                                  │
│    Storage Rebate: 2497968 MIST                                                                   │
│    Non-refundable Storage Fee: 25232 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9NnB6gsajeued5PSnJaYWQPQyhKvV1yQ4TadJ8LSuobV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x28b4d96ea9207232bf7968030db3d984189e731829b4c22887d87b257c9789d0                                                             │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                               │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                            │
│  │ ObjectType: 0x2::coin::Coin<0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN>  │
│  │ Version: 103342236                                                                                                                       │
│  │ Digest: DpALUDpBYryQR2yKJrEf2zYuHbC7B4DRmvu7qCoYDGx3                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                                             │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                                               │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                               │
│  │ Version: 103342236                                                                                                                       │
│  │ Digest: DZomESnvHDyYzDKrPAjPCVAYhSKDyZWnkT61BJ2Jm7v3                                                                                     │
│  └──                                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                         │
│  │ CoinType: 0x2::sui::SUI                                                                                               │
│  │ Amount: -776232                                                                                                       │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                         │
│  │ CoinType: 0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN  │
│  │ Amount: -100000000000                                                                                                 │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                         │
│  │ CoinType: 0xae16113528530ccfefb1dfcf99da129421621be8307edee8bb05ea1ecb7dd2fa::HuiWang_World_Coin::HUIWANG_WORLD_COIN  │
│  │ Amount: 100000000000                                                                                                  │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```
--- task end---
