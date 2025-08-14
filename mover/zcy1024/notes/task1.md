1. 创建
```
sui move new hello_move
touch hello_move/sources/hello_move.move
```
2. 代码
```
module hello_move::hello {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    struct Hello has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let word = Hello {
            id: object::new(ctx),
            str: string::utf8(b"Hello Move"),
        };
        transfer::transfer(word, tx_context::sender(ctx));
    }
}
```
3. build
```
sui move build
```
4. 发布
```
sui client publish --gas-budget 10000000

# 成功后信息如下
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: BezDemfChYoY32d7FkdVt3YniFG9e6cCTGGA4hvuya74
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                   │
│ Gas Owner: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                                    │
│  │ Version: 953663                                                                                           │
│  │ Digest: 9LRvnUGgHK7jhnsrRaMT673JZHCe47P5GJG2n1ZN2SFA                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b" │ │
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
│    i/dmsImJXKrd/B9H58owoDUnFfpUGlIOvtfI2uAFPNheVcBLD15QOXA8aepSBe/jGSzyp/zePWvpJA7SQKYH4A==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BezDemfChYoY32d7FkdVt3YniFG9e6cCTGGA4hvuya74                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 318                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4XcSjYqTAXxrFoumt7eRy9DXHVmKHsaQAsHaTi44bZjz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc20fd0c1b2d0ed45e93f1ab6a50ebbaa40ca75361b3aba6660ef5da3539453fe                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 953664                                                                                │
│  │ Digest: 8H8TL6fajUTL5b24vetk2xQU93ot8gmoyUq8RpEWwhi4                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 953664                                                                                │
│  │ Digest: 6gLF6QSvRoNtwNgNhRSjcHqEtQqddPQDVM1YrL8zRgPk                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 953664                                                                                │
│  │ Digest: 6gLF6QSvRoNtwNgNhRSjcHqEtQqddPQDVM1YrL8zRgPk                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7539200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    7FVGWCTyEXfwJgSEzDsqM8AkMQg6tSPRZiSzVjZoeD4e                                                   │
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
│  │ ObjectID: 0xc20fd0c1b2d0ed45e93f1ab6a50ebbaa40ca75361b3aba6660ef5da3539453fe                  │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                    │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 953664                                                                               │
│  │ Digest: 8H8TL6fajUTL5b24vetk2xQU93ot8gmoyUq8RpEWwhi4                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                  │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                    │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 953664                                                                               │
│  │ Digest: 6gLF6QSvRoNtwNgNhRSjcHqEtQqddPQDVM1YrL8zRgPk                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 4XcSjYqTAXxrFoumt7eRy9DXHVmKHsaQAsHaTi44bZjz                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7561080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5. 交互
```
sui client call --function say_hello --package 0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc --module hello --gas-budget 10000000

# 成功后信息如下
Transaction Digest: 92KNvBawq7BeW6SQKVhhm2rkCKMjcUjgpRLcC2CpHJc3
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                  │
│ Gas Owner: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                   │
│  │ Version: 953664                                                                          │
│  │ Digest: 6gLF6QSvRoNtwNgNhRSjcHqEtQqddPQDVM1YrL8zRgPk                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  say_hello                                                          │        │
│ │  │ Module:    hello                                                              │        │
│ │  │ Package:   0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    vtY2M/1TbYZBTMTTh3jszi5ZIgFFQsyNpdilvfIxb9ZAIA24xe9imo8eqq7d5shXlDGJRyJesjlmcj4x24qwuA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 92KNvBawq7BeW6SQKVhhm2rkCKMjcUjgpRLcC2CpHJc3                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 318                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8076fc0683c670a9d29ebd205bdb326a364b8dd8824bb8c223e1480cf8ed6ea5                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 953665                                                                                │
│  │ Digest: BC35XqvCJyh85787uuqaMQbf2Mni9D4Womu1Sqe19TAr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 953665                                                                                │
│  │ Digest: 8mkLatFEFkvEnMXVEiHh321ar6Qhbhy946Zzougd8hjf                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 953665                                                                                │
│  │ Digest: 8mkLatFEFkvEnMXVEiHh321ar6Qhbhy946Zzougd8hjf                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2340800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    BezDemfChYoY32d7FkdVt3YniFG9e6cCTGGA4hvuya74                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8076fc0683c670a9d29ebd205bdb326a364b8dd8824bb8c223e1480cf8ed6ea5                  │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                    │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b ) │
│  │ ObjectType: 0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc::hello::Hello  │
│  │ Version: 953665                                                                               │
│  │ Digest: BC35XqvCJyh85787uuqaMQbf2Mni9D4Womu1Sqe19TAr                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x09c5737592ce0d7ee1f0087b47447b5a120d0893d644d094f95c2ecc9b350b6d                  │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                    │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 953665                                                                               │
│  │ Digest: 8mkLatFEFkvEnMXVEiHh321ar6Qhbhy946Zzougd8hjf                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2362680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
6. 查询Object中存储的值
```
# sui client object <ObjectID>
sui client object 0x8076fc0683c670a9d29ebd205bdb326a364b8dd8824bb8c223e1480cf8ed6ea5

# 信息如下
╭───────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ objectId      │  0x8076fc0683c670a9d29ebd205bdb326a364b8dd8824bb8c223e1480cf8ed6ea5                                             │
│ version       │  953665                                                                                                         │
│ digest        │  BC35XqvCJyh85787uuqaMQbf2Mni9D4Womu1Sqe19TAr                                                                   │
│ objType       │  0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc::hello::Hello                               │
│ owner         │ ╭──────────────┬──────────────────────────────────────────────────────────────────────╮                         │
│               │ │ AddressOwner │  0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b  │                         │
│               │ ╰──────────────┴──────────────────────────────────────────────────────────────────────╯                         │
│ prevTx        │  92KNvBawq7BeW6SQKVhhm2rkCKMjcUjgpRLcC2CpHJc3                                                                   │
│ storageRebate │  1352800                                                                                                        │
│ content       │ ╭───────────────────┬─────────────────────────────────────────────────────────────────────────────────────────╮ │
│               │ │ dataType          │  moveObject                                                                             │ │
│               │ │ type              │  0x2c99b1e37fa924ae1ef4ed3308e83b1e21ee5626106084699b939ac298a92cdc::hello::Hello       │ │
│               │ │ hasPublicTransfer │  false                                                                                  │ │
│               │ │ fields            │ ╭─────┬───────────────────────────────────────────────────────────────────────────────╮ │ │
│               │ │                   │ │ id  │ ╭────┬──────────────────────────────────────────────────────────────────────╮ │ │ │
│               │ │                   │ │     │ │ id │  0x8076fc0683c670a9d29ebd205bdb326a364b8dd8824bb8c223e1480cf8ed6ea5  │ │ │ │
│               │ │                   │ │     │ ╰────┴──────────────────────────────────────────────────────────────────────╯ │ │ │
│               │ │                   │ │ str │  Hello Move                                                                   │ │ │
│               │ │                   │ ╰─────┴───────────────────────────────────────────────────────────────────────────────╯ │ │
│               │ ╰───────────────────┴─────────────────────────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
其中，str存储的就是Hello Move