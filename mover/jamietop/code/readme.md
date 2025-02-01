# task1

task1 学习笔记

## 开发环境

```bash
% sui --version
sui 1.41.0-4b4e533f0353
```

## 创建项目

### 创建并切换工作目录

```bash
# `~/jt/study/sui/hoh/` 自行替换为本地路径
% cd ~/jt/study/sui/hoh/letsmove/

# 创建对应于 github id 的工作目录
% cp -rf mover/001 mover/jamietop
% cd ./mover/jamietop/
% mkdir code/task1
% cd code/task1
```

### 创建 move 语言工程项目

```bash
% sui move new hello_move

% tree hello_move
hello_move
├── Move.toml
├── sources
│   └── hello_move.move
└── tests
    └── hello_move_tests.move

3 directories, 3 files
```

### 修改 hello_move.move 内容

```rust
module hello_move::hello ;

use std::ascii::{String, string};
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
        id: object::new(ctx),
        say: string(b"jamietop"),
    };
    transfer(hello_move, sender(ctx));
}
```

### 编译

```bash
% sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
```

### 发布

```bash
% sui client publish
[warning] Client/Server api version mismatch, client api version : 1.41.0, server api version : 1.41.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: 4u3ShpG52QwUpyBUxA6QQRx1hvHbX28ts5XbSdfTqAqX
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d                                   │
│ Gas Owner: 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d                                │
│ Gas Budget: 10831200 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x084c1c52f8a4171a000937fee74f053a4ec0ee25ecc9716aaeb8d3ab54611212                                    │
│  │ Version: 39975254                                                                                         │
│  │ Digest: HtUfzDffT9bBH8nCuisMSL7TDXLXaW3kN8b1w5PU9Dqo                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d" │ │
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
│    bS+TkowDtVmWWCjXvoWFgguJaFZ2kPUPZoVAzaWPfT4WTcxS+74Ne4hvb1N1iZAvzp96xx68aWk3i17CW2aGzw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4u3ShpG52QwUpyBUxA6QQRx1hvHbX28ts5XbSdfTqAqX                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 632                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x34ab29fa285e958b10e600c9e9b2f181e7afa20bc909eb7cf3b6c2b07e9fae16                         │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d )  │
│  │ Version: 39975255                                                                              │
│  │ Digest: DAjbwYNtVoV5BPxMwWJChpRVdsdJTr2RJ47cph8brRST                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbdb7db2871027d8984b06519f4dc29806d22f08d038942c30b9092676927e032                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: FdN9mMLC6ckL85n3HYu5VvxApZLwKkUYsHUnYeCHbzKJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd3c4b0777c1d1847559147dfb45ef62132f1b1008b34a284e5990cd752ac8f11                         │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d )  │
│  │ Version: 39975255                                                                              │
│  │ Digest: CwnGFLCmuJfy5pHwS6rGSwEQjaeQhHCvzbTZLXuvxFig                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x084c1c52f8a4171a000937fee74f053a4ec0ee25ecc9716aaeb8d3ab54611212                         │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d )  │
│  │ Version: 39975255                                                                              │
│  │ Digest: CdTDkewpaSAuqDkxPxhizNqPUR7zXj8YS4C7xWPz4xNj                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x084c1c52f8a4171a000937fee74f053a4ec0ee25ecc9716aaeb8d3ab54611212                         │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d )  │
│  │ Version: 39975255                                                                              │
│  │ Digest: CdTDkewpaSAuqDkxPxhizNqPUR7zXj8YS4C7xWPz4xNj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8831200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3RBC6NkW8es2L1Wb6jibKdGDAYKNP9iQ5vHAoBj7Rr3T                                                   │
│    Gtwgse64nSVXhQvmqCpwCe5xJz9N4VypvEGJUy5DyG4e                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x34ab29fa285e958b10e600c9e9b2f181e7afa20bc909eb7cf3b6c2b07e9fae16                  │
│  │ Sender: 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d                    │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d ) │
│  │ ObjectType: 0xbdb7db2871027d8984b06519f4dc29806d22f08d038942c30b9092676927e032::hello::Hello  │
│  │ Version: 39975255                                                                             │
│  │ Digest: DAjbwYNtVoV5BPxMwWJChpRVdsdJTr2RJ47cph8brRST                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xd3c4b0777c1d1847559147dfb45ef62132f1b1008b34a284e5990cd752ac8f11                  │
│  │ Sender: 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d                    │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 39975255                                                                             │
│  │ Digest: CwnGFLCmuJfy5pHwS6rGSwEQjaeQhHCvzbTZLXuvxFig                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x084c1c52f8a4171a000937fee74f053a4ec0ee25ecc9716aaeb8d3ab54611212                  │
│  │ Sender: 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d                    │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 39975255                                                                             │
│  │ Digest: CdTDkewpaSAuqDkxPxhizNqPUR7zXj8YS4C7xWPz4xNj                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xbdb7db2871027d8984b06519f4dc29806d22f08d038942c30b9092676927e032                 │
│  │ Version: 1                                                                                    │
│  │ Digest: FdN9mMLC6ckL85n3HYu5VvxApZLwKkUYsHUnYeCHbzKJ                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xbecd4d29007221dea8e2e9c533c6255259226509bda18ca65c1e0d537d3cce0d )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8853080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

其中`0xbdb7db2871027d8984b06519f4dc29806d22f08d038942c30b9092676927e032`是
package id
