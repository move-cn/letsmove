## 创建合约

```bash
$ sui move new task1_hello_move
```

## 编写合约代码

```rust
module task1::hello_move {
    use std::ascii::{String, string};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"hello move"),
        };

        let sender = tx_context::sender(ctx);

        transfer::transfer(hello_move, sender);
    }
}
```

## 编译

```bash
$ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
```

## 部署

```bash
$ sui client publish
 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: 9ktCZ8FSHuKQ9xKEQRBQEpSzxLJRNBoTvajBwcz5Bf8L
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                   │
│ Gas Owner: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5bec36e98e598b5be489e870d3335b8f0efec36cd6271ddd3b9f9ca459976ecf                                    │
│  │ Version: 918400                                                                                           │
│  │ Digest: 8cxxiTU4z1HHe34hsKxfopQmn5ZryrJ9key7pHf9wfF2                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8" │ │
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
│    60dCf7kcUJnBaNPSunbgNWc3klmt1uuR+KEznNDaSiOwivl4X8OVyR3trrwBoKi/PaOYukbra5Ybb49p8ElbDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9ktCZ8FSHuKQ9xKEQRBQEpSzxLJRNBoTvajBwcz5Bf8L                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 338                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1f21ec5ed235422f300a6e47033fccfada4c2809b6f66c9de402b24f4da71eff                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8F1cTqCtT1Mo3B8gwZQK92gh2gM8c4zqvS85FZpY2k69                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5deb444fa04e112cbce4b030f9649d0bf953762d2e19a2e7401ef9bcb312686c                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )  │
│  │ Version: 918401                                                                                │
│  │ Digest: 3rdjrFKKA5KRsgiqs629Ad6RJzkXbaQGvUHDVWz4w7qZ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x997e6304ce2fd169f8626d1cc66caccf4e523cc45a54b3ae3796b4d779172d9b                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )  │
│  │ Version: 918401                                                                                │
│  │ Digest: u8maiiiJHXkJCmk43AMG8x1rWGUsXra7LYsAfGFsjJC                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5bec36e98e598b5be489e870d3335b8f0efec36cd6271ddd3b9f9ca459976ecf                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )  │
│  │ Version: 918401                                                                                │
│  │ Digest: D8xvoPGMVKUkVjSA58P8GoX9hkTLZgasn8idnELrtyNf                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5bec36e98e598b5be489e870d3335b8f0efec36cd6271ddd3b9f9ca459976ecf                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )  │
│  │ Version: 918401                                                                                │
│  │ Digest: D8xvoPGMVKUkVjSA58P8GoX9hkTLZgasn8idnELrtyNf                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9104800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3PRCWLY5cQy3dCK574S3npBsK6JmmnvL3Jca9VxHJQZL                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x5deb444fa04e112cbce4b030f9649d0bf953762d2e19a2e7401ef9bcb312686c                       │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )      │
│  │ ObjectType: 0x1f21ec5ed235422f300a6e47033fccfada4c2809b6f66c9de402b24f4da71eff::hello_move::Hello  │
│  │ Version: 918401                                                                                    │
│  │ Digest: 3rdjrFKKA5KRsgiqs629Ad6RJzkXbaQGvUHDVWz4w7qZ                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x997e6304ce2fd169f8626d1cc66caccf4e523cc45a54b3ae3796b4d779172d9b                       │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                               │
│  │ Version: 918401                                                                                    │
│  │ Digest: u8maiiiJHXkJCmk43AMG8x1rWGUsXra7LYsAfGFsjJC                                                │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x5bec36e98e598b5be489e870d3335b8f0efec36cd6271ddd3b9f9ca459976ecf                       │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                         │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 918401                                                                                    │
│  │ Digest: D8xvoPGMVKUkVjSA58P8GoX9hkTLZgasn8idnELrtyNf                                               │
│  └──                                                                                                  │
│ Published Objects:                                                                                    │
│  ┌──                                                                                                  │
│  │ PackageID: 0x1f21ec5ed235422f300a6e47033fccfada4c2809b6f66c9de402b24f4da71eff                      │
│  │ Version: 1                                                                                         │
│  │ Digest: 8F1cTqCtT1Mo3B8gwZQK92gh2gM8c4zqvS85FZpY2k69                                               │
│  │ Modules: hello_move                                                                                │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9126680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```