
# Task1

## Sui 版本

> 直接下载官方包解压，直接使用

```bash
sui --version
sui 1.28.0-6a179c58a848
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
│ 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967 │ 10000000000        │ 10.00            │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```

## 编写合约

* 执行`sui move new task1` 创建合约 package
* 在 `sources` 目录下创建 `hello_move.move` 合约，内容源于官方sample
* 修改 str 内容为 `Hello, rustbeta!`;

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
            str: string::utf8(b"Hello, rustbeta!"),
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
./get-faucet.sh 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc
{"transferredGasObjects":[{"amount":10000000000,"id":"0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967","transferTxDigest":"CwNYgHvweeRjjnm9EehjpzeUXTubAsidbfpkpvtyi8uT"}],"error":null}
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

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: 2n4WJq1SRb9odCLqXzCQB6VAvvUocdCcTZpP7j8Lb9TR
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                    │
│  │ Version: 75                                                                                               │
│  │ Digest: 8vRP8jwjA7YSQnRjYkEEaEP1prwKed5jEkn7QguQPMLE                                                      │
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
│    LW6IKFKmWBJWKggqFavuE5YHFyDo0rEh8+dzpAjvhdGVEcqq8avvv5jxPa7A58woHG2oyMSKA/A9O5dNDIotCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2n4WJq1SRb9odCLqXzCQB6VAvvUocdCcTZpP7j8Lb9TR                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 128                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x72100832529e3a3991856c9567b4c0204a12f54019d7c2f25039871aff988b1d                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 76                                                                                    │
│  │ Digest: 3Qo6B1vS6Cngu8V6oWiETC3LiLWoUbGxBPH3fETLVR85                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfb34b63281b2e5b2df62e7a199419462f1e75cbf4c2f547909a162aec78a30cd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: A2SBjDoNJXSZNEiJEa7X3nKK7GMbNi1eUdMKSEhMuhVQ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 76                                                                                    │
│  │ Digest: 7TWKrgtVnfHSrSjke6gFiPxcZ1vY4SYv9GZVGAmuXUio                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 76                                                                                    │
│  │ Digest: 7TWKrgtVnfHSrSjke6gFiPxcZ1vY4SYv9GZVGAmuXUio                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7759600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CwNYgHvweeRjjnm9EehjpzeUXTubAsidbfpkpvtyi8uT                                                   │
│    E4KEoBaW3osvyMtt8H11XTND1pPmX32e4d4RPgfZU3p7                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x72100832529e3a3991856c9567b4c0204a12f54019d7c2f25039871aff988b1d                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 76                                                                                   │
│  │ Digest: 3Qo6B1vS6Cngu8V6oWiETC3LiLWoUbGxBPH3fETLVR85                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 76                                                                                   │
│  │ Digest: 7TWKrgtVnfHSrSjke6gFiPxcZ1vY4SYv9GZVGAmuXUio                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xfb34b63281b2e5b2df62e7a199419462f1e75cbf4c2f547909a162aec78a30cd                 │
│  │ Version: 1                                                                                    │
│  │ Digest: A2SBjDoNJXSZNEiJEa7X3nKK7GMbNi1eUdMKSEhMuhVQ                                          │
│  │ Modules: hello_move                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7781480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```