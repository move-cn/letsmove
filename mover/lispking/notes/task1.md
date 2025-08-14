
# Task1

## Sui 版本

> 直接下载官方包解压，直接使用

```bash
sui --version
sui 1.21.1
```

## DevNet 环境准备

```bash
sui client envs
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯
```

## 确认钱包是否有钱

```bash
sui client gas
[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x64a33eb175d4ffb93d1714c94a583c7746748d7a46afd30a1ba303749913ceb5 │ 10000000000        │ 10.00            │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```

## 编写合约

* 执行`sui move new task1` 创建合约 package
* 在 `sources` 目录下创建 `hello_move.move` 合约，内容源于官方sample

```rust
module task1::hello_move {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    struct HelloMove has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let greet = HelloMove {
            id: object::new(ctx),
            str: string::utf8(b"Hello, Move!"),
        };
        transfer::transfer(greet, tx_context::sender(ctx));
    }
}
```

## 取水

* 封装脚本 `get-faucet.sh`，内容如下：

```bash
#!/bin/bash

recipient=$1
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw "{
    \"FixedAmountRequest\": {
        \"recipient\": \"${recipient}\"
    }
}"
```

* 执行脚本取水

```bash
get-faucet.sh 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc
{"transferredGasObjects":[{"amount":10000000000,"id":"0xa0c4a9c0077f20e62fd2c5f8c2814e131b2124834c2d4d71d7232528841be325","transferTxDigest":"GHenAiuoeayAtYGn2zqPJSZps5yv27hAErbAkbHE9Mxv"}],"error":null}
```

## 编译合约

```bash
sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
```

## 部署合约

```bash
sui client publish --gas-budget 20000000
[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: 5VZYEuyqN2fY9vTMBjHK1ZkvQC23mWUaFNEN6WCf4kX2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x64a33eb175d4ffb93d1714c94a583c7746748d7a46afd30a1ba303749913ceb5                                    │
│  │ Version: 839                                                                                              │
│  │ Digest: DjBAK9KPXKuVTyPSQ5MqGktfY2mdxZ2nxxJX7mhVS8Sg                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
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
│    Dd0ak1tC7b4aQkK74BDLDDQnp1STMvnUzhR0Yf6nZ/QkYvuNw8yuTO4hqmSIx7rsAcxb82Ywof4mKLmScxNgAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5VZYEuyqN2fY9vTMBjHK1ZkvQC23mWUaFNEN6WCf4kX2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 914                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0a2d91e99b49149760afbf26cbbc6c0be87cf0166de1f94f84c32f36f1ecf659                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3MioVgpBDAtwNZc54jw4wYLyatGcCSdSjQP3ufsekrmC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x94ede39c86d01fdbf9de30768d493c1d41d56739f5fa49e47a2bbe9035f80108                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 840                                                                                   │
│  │ Digest: 5tXhMi17XkPAqCELMo9zSfk5j8pzKh6UzrypA25a13oZ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x64a33eb175d4ffb93d1714c94a583c7746748d7a46afd30a1ba303749913ceb5                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 840                                                                                   │
│  │ Digest: uYwmhcFbgZ7v1THkahbfXEws4MVj6br7uL2LfqrWn5m                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x64a33eb175d4ffb93d1714c94a583c7746748d7a46afd30a1ba303749913ceb5                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 840                                                                                   │
│  │ Digest: uYwmhcFbgZ7v1THkahbfXEws4MVj6br7uL2LfqrWn5m                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7729200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4aJErGGtBteC8wZgQgL5qNNWasM6MGpEx9Goz444t6G8                                                   │
│    7Ukrc5GqdFqTA41wvWgreCdHn2vRLfgQ3YMFkdks72Vk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x94ede39c86d01fdbf9de30768d493c1d41d56739f5fa49e47a2bbe9035f80108                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 840                                                                                  │
│  │ Digest: 5tXhMi17XkPAqCELMo9zSfk5j8pzKh6UzrypA25a13oZ                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x64a33eb175d4ffb93d1714c94a583c7746748d7a46afd30a1ba303749913ceb5                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 840                                                                                  │
│  │ Digest: uYwmhcFbgZ7v1THkahbfXEws4MVj6br7uL2LfqrWn5m                                           │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x0a2d91e99b49149760afbf26cbbc6c0be87cf0166de1f94f84c32f36f1ecf659                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 3MioVgpBDAtwNZc54jw4wYLyatGcCSdSjQP3ufsekrmC                                          │
│  │ Modules: hello_move                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7751080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```