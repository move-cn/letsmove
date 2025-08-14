1. 创建
```
sui move new hello_move
```
2. 在 hello_move/sources 新建 hello_move.move 文件
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
fund@Fund-Ubuntu:~/Learn/Code/Github/hello_move$ sui client publish --gas-budget 10000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: J917fBhb4HchHAuYzh5hoG41hy9MDtLLU6qew8iiu6ci
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                   │
│ Gas Owner: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                                    │
│  │ Version: 1086103                                                                                          │
│  │ Digest: EHnjytopzZTiAvVhcWWByemthB1uqAvjL3R2DEydCPH9                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663" │ │
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
│    xT4L4LMr3FzkuQHCYwzFz4VMwYde0Mig1c5b38ThnibXsoKEsK2pfIW/57raoiuuTF5lXJDr3JUL4J+8zOFQBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: J917fBhb4HchHAuYzh5hoG41hy9MDtLLU6qew8iiu6ci                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 326                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Hov7XVLYkjPAmqvj9g5QYEE6SWkMLutQ3g9BBR14w3WG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x97ae5774935d8fbfde811c6df26c897ddef53d49d866e423456d3a2586f58f25                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086104                                                                               │
│  │ Digest: 9dun4ESTwgpdUMCgjtzVPWgWpRQJwhCbcHiva88gRWqw                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086104                                                                               │
│  │ Digest: 7ZkFKV51viGPEhxMcppwxkJ6uURco6FYVrQkniArExTy                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086104                                                                               │
│  │ Digest: 7ZkFKV51viGPEhxMcppwxkJ6uURco6FYVrQkniArExTy                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7539200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
│    GufVth5Dt7ZTTHtPN5zPRLEUwZ1q3LcMmqoRd8kPNNEm                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x97ae5774935d8fbfde811c6df26c897ddef53d49d866e423456d3a2586f58f25                  │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                    │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 1086104                                                                              │
│  │ Digest: 9dun4ESTwgpdUMCgjtzVPWgWpRQJwhCbcHiva88gRWqw                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                  │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                    │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1086104                                                                              │
│  │ Digest: 7ZkFKV51viGPEhxMcppwxkJ6uURco6FYVrQkniArExTy                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Hov7XVLYkjPAmqvj9g5QYEE6SWkMLutQ3g9BBR14w3WG                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7561080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5. 交互
```
sui client call --function say_hello --package 0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6 --module hello --gas-budget 10000000

# 成功后信息如下
Transaction Digest: HrYWgNr9omBiDu1mzTk3gp5e86eXbZ7P8UW4TWBZbUSS
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                  │
│ Gas Owner: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                   │
│  │ Version: 1086104                                                                         │
│  │ Digest: 7ZkFKV51viGPEhxMcppwxkJ6uURco6FYVrQkniArExTy                                     │
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
│ │  │ Package:   0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    y/eL4Nj+DnX1GWEqZ4azqwS0ezW3D/mGl/Svi9QK3pkE8ZbJrN4noC5vPDHffFGhU9u2BUq0fXLA4zXxSI8kAQ== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HrYWgNr9omBiDu1mzTk3gp5e86eXbZ7P8UW4TWBZbUSS                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 326                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb7a2c09aef9e07a33030e45e0fa84990e2ee93582cf3e90021ccfe71886ccfe6                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086105                                                                               │
│  │ Digest: HqRN1TFtEFxb5miPxxWfThVqk1kKGysFPzgDgx9LT2tw                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086105                                                                               │
│  │ Digest: HCXRJtHS29EqfKQXQZh3ufNnwApMEVKDmDxwRAd2SQgy                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086105                                                                               │
│  │ Digest: HCXRJtHS29EqfKQXQZh3ufNnwApMEVKDmDxwRAd2SQgy                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2340800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    J917fBhb4HchHAuYzh5hoG41hy9MDtLLU6qew8iiu6ci                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb7a2c09aef9e07a33030e45e0fa84990e2ee93582cf3e90021ccfe71886ccfe6                  │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                    │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 ) │
│  │ ObjectType: 0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6::hello::Hello  │
│  │ Version: 1086105                                                                              │
│  │ Digest: HqRN1TFtEFxb5miPxxWfThVqk1kKGysFPzgDgx9LT2tw                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                  │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                    │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1086105                                                                              │
│  │ Digest: HCXRJtHS29EqfKQXQZh3ufNnwApMEVKDmDxwRAd2SQgy                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2362680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
6. 查询Object中存储的值
```
# sui client object <ObjectID>
sui client object 0xb7a2c09aef9e07a33030e45e0fa84990e2ee93582cf3e90021ccfe71886ccfe6

# 信息如下
───────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ objectId      │  0xb7a2c09aef9e07a33030e45e0fa84990e2ee93582cf3e90021ccfe71886ccfe6                                             │
│ version       │  1086105                                                                                                        │
│ digest        │  HqRN1TFtEFxb5miPxxWfThVqk1kKGysFPzgDgx9LT2tw                                                                   │
│ objType       │  0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6::hello::Hello                               │
│ owner         │ ╭──────────────┬──────────────────────────────────────────────────────────────────────╮                         │
│               │ │ AddressOwner │  0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663  │                         │
│               │ ╰──────────────┴──────────────────────────────────────────────────────────────────────╯                         │
│ prevTx        │  HrYWgNr9omBiDu1mzTk3gp5e86eXbZ7P8UW4TWBZbUSS                                                                   │
│ storageRebate │  1352800                                                                                                        │
│ content       │ ╭───────────────────┬─────────────────────────────────────────────────────────────────────────────────────────╮ │
│               │ │ dataType          │  moveObject                                                                             │ │
│               │ │ type              │  0x5b1c8518366548943a2b404d318c64201118a25515cb0d02657020f4c0e32aa6::hello::Hello       │ │
│               │ │ hasPublicTransfer │  false                                                                                  │ │
│               │ │ fields            │ ╭─────┬───────────────────────────────────────────────────────────────────────────────╮ │ │
│               │ │                   │ │ id  │ ╭────┬──────────────────────────────────────────────────────────────────────╮ │ │ │
│               │ │                   │ │     │ │ id │  0xb7a2c09aef9e07a33030e45e0fa84990e2ee93582cf3e90021ccfe71886ccfe6  │ │ │ │
│               │ │                   │ │     │ ╰────┴──────────────────────────────────────────────────────────────────────╯ │ │ │
│               │ │                   │ │ str │  Hello Move                                                                   │ │ │
│               │ │                   │ ╰─────┴───────────────────────────────────────────────────────────────────────────────╯ │ │
│               │ ╰───────────────────┴─────────────────────────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
其中，str存储的就是Hello Move