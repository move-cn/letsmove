# task 2
上链网络: mainnet
完成 Coin相关知识的学习
完成 My Coin 的学习并部署主网
完成 Faucet Coin 的学习并部署主网
提交 My Coin 和 Faucet Coin 合约发布package id
发送 My Coin 给地址 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2


build：
```bash
❯ sui move build                           
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
```

发布合约：
```bash
❯ sui client publish --gas-budget 50000000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: 5tdGkMCBNHhjoBZh4DLUnWNvV89RREEu9svwEVuRmcp1
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                   │
│ Gas Owner: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                │
│ Gas Budget: 50000000000 MIST                                                                                 │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                    │
│  │ Version: 94426579                                                                                         │
│  │ Digest: AsaN7YNnsuHnbYHNCecW5HBuCcjjG4Ygr4Th77iRCbKi                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251" │ │
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
│    RB2RY2/p/U8Z7lq+VMzdIthaB691QSi7NktaNc9TlsSyl8KFs2f3KzRTQ3ybIv7vg4AzoUPEhn9oFxHlM5niBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5tdGkMCBNHhjoBZh4DLUnWNvV89RREEu9svwEVuRmcp1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 375                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5f7d760620953a15d90a730d8a998d8206c14e9ed9b0095380f9f43b60cf7242                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426580                                                                              │
│  │ Digest: 58ZemzCkeJX44hFEhEcQZJVnVxhPVau4Kj4zHVnNP9LC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 94426580                                                                              │
│  │ Digest: GsmeUfr5ZCTLhrcjW8xCkKLfsqK3XsgRZBo16kbU97Dk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6691ea182ae89c417ab166d2ff1b49c3861624111ddd2ed625dc0cc4a849028a                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426580                                                                              │
│  │ Digest: 2HoeJBXrFGpGzNpLCzQ6JJjh1fjKH9s8oCpFN29zZdQq                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9LJeAmBwuQ7mgqhpQVjYN6nAPP6KPTF1WPYSx7BsyAfN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9ec044f21e1acfee14e0378f9826e3b1a10b13ec8b0223833f0e9e540b8b96af                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 94426580                                                                              │
│  │ Digest: F2bg6BaLdyUk5m86Zf2DGHFCdzzMV4S2gSc7i51acUmX                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xacb0a9744735ffd72018d59f754d4a0bb83d1d77ba9438aed96766e37031560f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 94426580                                                                              │
│  │ Digest: 3NTTLjnknP5vRwzC4Tb33z9uwuhUAfwy2GuNDLv3ebev                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426580                                                                              │
│  │ Digest: 7tuFT1KCjMsfpAEJaY5n78AhuEpP1X7o2BHj3PUQ9ono                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426580                                                                              │
│  │ Digest: 7tuFT1KCjMsfpAEJaY5n78AhuEpP1X7o2BHj3PUQ9ono                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 23400400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3HqHBBVAYv1uoc5NuLdrQd3JEUnS19d4jMRf2256Wgiv                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                  │
│  ┌──                                                                                                                              │
│  │ ObjectID: 0x5f7d760620953a15d90a730d8a998d8206c14e9ed9b0095380f9f43b60cf7242                                                   │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                     │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                                  │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                           │
│  │ Version: 94426580                                                                                                              │
│  │ Digest: 58ZemzCkeJX44hFEhEcQZJVnVxhPVau4Kj4zHVnNP9LC                                                                           │
│  └──                                                                                                                              │
│  ┌──                                                                                                                              │
│  │ ObjectID: 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c                                                   │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                     │
│  │ Owner: Shared                                                                                                                  │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::fauetcoin::FAUETCOIN>   │
│  │ Version: 94426580                                                                                                              │
│  │ Digest: GsmeUfr5ZCTLhrcjW8xCkKLfsqK3XsgRZBo16kbU97Dk                                                                           │
│  └──                                                                                                                              │
│  ┌──                                                                                                                              │
│  │ ObjectID: 0x6691ea182ae89c417ab166d2ff1b49c3861624111ddd2ed625dc0cc4a849028a                                                   │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                     │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                                  │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::mycoin::MYCOIN>         │
│  │ Version: 94426580                                                                                                              │
│  │ Digest: 2HoeJBXrFGpGzNpLCzQ6JJjh1fjKH9s8oCpFN29zZdQq                                                                           │
│  └──                                                                                                                              │
│  ┌──                                                                                                                              │
│  │ ObjectID: 0x9ec044f21e1acfee14e0378f9826e3b1a10b13ec8b0223833f0e9e540b8b96af                                                   │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                     │
│  │ Owner: Immutable                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::fauetcoin::FAUETCOIN>  │
│  │ Version: 94426580                                                                                                              │
│  │ Digest: F2bg6BaLdyUk5m86Zf2DGHFCdzzMV4S2gSc7i51acUmX                                                                           │
│  └──                                                                                                                              │
│  ┌──                                                                                                                              │
│  │ ObjectID: 0xacb0a9744735ffd72018d59f754d4a0bb83d1d77ba9438aed96766e37031560f                                                   │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                     │
│  │ Owner: Immutable                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::mycoin::MYCOIN>        │
│  │ Version: 94426580                                                                                                              │
│  │ Digest: 3NTTLjnknP5vRwzC4Tb33z9uwuhUAfwy2GuNDLv3ebev                                                                           │
│  └──                                                                                                                              │
│ Mutated Objects:                                                                                                                  │
│  ┌──                                                                                                                              │
│  │ ObjectID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                                   │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                     │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                     │
│  │ Version: 94426580                                                                                                              │
│  │ Digest: 7tuFT1KCjMsfpAEJaY5n78AhuEpP1X7o2BHj3PUQ9ono                                                                           │
│  └──                                                                                                                              │
│ Published Objects:                                                                                                                │
│  ┌──                                                                                                                              │
│  │ PackageID: 0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f                                                  │
│  │ Version: 1                                                                                                                     │
│  │ Digest: 9LJeAmBwuQ7mgqhpQVjYN6nAPP6KPTF1WPYSx7BsyAfN                                                                           │
│  │ Modules: fauetcoin, mycoin                                                                                                     │
│  └──                                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -23172280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
❯ sui client call --package 0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f --module fauetcoin --function mint --gas-budget 50000000000 --args 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c 100000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: 2YkN1cYe4g3yBUuLTFuTYD7VXLG1kWy4fjjoy82gG794
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                   │
│ Gas Owner: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                │
│ Gas Budget: 50000000000 MIST                                                                                 │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                    │
│  │ Version: 94426584                                                                                         │
│  │ Digest: xiHZpzTNxGy9w8APiyjLWQNRUDSRvZfocSXMWKoGhW5                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000"                                                              │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    fauetcoin                                                          │                         │
│ │  │ Package:   0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    DswM4agOaWX4UQYGJtrmv2rrUCtFKZrsXSnzgP2+2ttAtU2wN14x2xEI39x1ScI65QxxDPUkls6ki1QL2j0CCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2YkN1cYe4g3yBUuLTFuTYD7VXLG1kWy4fjjoy82gG794                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 375                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x088f261f7d2334d5b1ce74b443249d2c6de197b6180b75dbb8a9a81ceb71472b                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 94426585                                                                              │
│  │ Digest: 69sYEnNrWUM2dH8vRKRA5AhiMzmf7eCRKheBxYnnmCXZ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426585                                                                              │
│  │ Digest: FJaTpneufVP2x7mESkVDQdf5Lp9t6pxtiHz8wXyouqQj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 94426585                                                                              │
│  │ Digest: 25aAoJg5BzYwKU9ZeiTGSiB5oyQWNyokaY65Ck1W4U3e                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c                         │
│  │ Version: 94426584                                                                              │
│  │ Digest: 3UePVpoDPd6fMWgtBEYPKPkHcQefayine2TWoDRbHzum                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426585                                                                              │
│  │ Digest: FJaTpneufVP2x7mESkVDQdf5Lp9t6pxtiHz8wXyouqQj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4164800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2738736 MIST                                                                   │
│    Non-refundable Storage Fee: 27664 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5tdGkMCBNHhjoBZh4DLUnWNvV89RREEu9svwEVuRmcp1                                                   │
│    CozSzBexRG6TWnxkNmTkyza2vdjJRAWM2Ae9Dycw83zd                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                 │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x088f261f7d2334d5b1ce74b443249d2c6de197b6180b75dbb8a9a81ceb71472b                                                  │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                 │
│  │ ObjectType: 0x2::coin::Coin<0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::fauetcoin::FAUETCOIN>         │
│  │ Version: 94426585                                                                                                             │
│  │ Digest: 69sYEnNrWUM2dH8vRKRA5AhiMzmf7eCRKheBxYnnmCXZ                                                                          │
│  └──                                                                                                                             │
│ Mutated Objects:                                                                                                                 │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                                  │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                    │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                    │
│  │ Version: 94426585                                                                                                             │
│  │ Digest: FJaTpneufVP2x7mESkVDQdf5Lp9t6pxtiHz8wXyouqQj                                                                          │
│  └──                                                                                                                             │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x60cff25f954be130ba3da6d5281fc8e22c4f4621aebe4ad48d50a7fdc130356c                                                  │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                                    │
│  │ Owner: Shared                                                                                                                 │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::fauetcoin::FAUETCOIN>  │
│  │ Version: 94426585                                                                                                             │
│  │ Digest: 25aAoJg5BzYwKU9ZeiTGSiB5oyQWNyokaY65Ck1W4U3e                                                                          │
│  └──                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                        │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                   │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )       │
│  │ CoinType: 0x2::sui::SUI                                                                             │
│  │ Amount: -2176064                                                                                    │
│  └──                                                                                                   │
│  ┌──                                                                                                   │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )       │
│  │ CoinType: 0x986b9640e7b40e3c0b2240511f5db0c2b2cede3baadf012d28a19c915be8e51f::fauetcoin::FAUETCOIN  │
│  │ Amount: 100000000                                                                                   │
│  └──                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```