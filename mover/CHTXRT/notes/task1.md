# Task 1

合约源码如下：
```move
/// Module: hello_move
module hello_move::hello_move {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    public struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    #[lint_allow(self_transfer)]
    fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello Move!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
```

本地 build：
```bash
❯ sui move build
```

发布合约：
```bash
> sui client publish --gas-budget 50000000 .
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Hello_Move
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: CuVjU7oFsowKeo4RTauPhEmKM5Pw4Dm6M92pAvkhaRjj
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                                   │
│ Gas Owner: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                                    │
│  │ Version: 955010                                                                                           │
│  │ Digest: 2dTKLvRqNHv4VaEzxSTGFpjTgv7ZKobwQetzEkxqfohw                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb" │ │
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
│    WTTRfV+X9ahx+Yf0q+zlj+513tA7P6M5k1eApLXfN/+V1GUG20HN43Wg0GKzM2h6+3lgaN4/jGckQFuufT92BQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CuVjU7oFsowKeo4RTauPhEmKM5Pw4Dm6M92pAvkhaRjj                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 327                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2655c5bfa3b402abe77a168c203bae330fac121213d3f30145f0923f0f39b6d2                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: BtQ5qfRQUropCtnLBjSYhBcREmdd4viJAKEfifZ6xFZP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xadf58547fb1c18cb63cbd2899028544870c3f35168ffe9c09ff27c78bd059fca                         │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ Version: 955011                                                                                │
│  │ Digest: 1r9rWxWamb1DZifbAf4UmmF7ep3uE2RrnQ8LVmgZ485                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                         │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ Version: 955011                                                                                │
│  │ Digest: 3cy1i4mv4TyA8gd3o3AiZfysczP7qTsneY4LuUGS3Tt9                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                         │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ Version: 955011                                                                                │
│  │ Digest: 3cy1i4mv4TyA8gd3o3AiZfysczP7qTsneY4LuUGS3Tt9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7926800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    FH4EdX2bM3Rj5zMLeePhGbfQ3NZDJTFjFpKuyJf5pBSK                                                   │
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
│  │ ObjectID: 0xadf58547fb1c18cb63cbd2899028544870c3f35168ffe9c09ff27c78bd059fca                  │
│  │ Sender: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                    │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 955011                                                                               │
│  │ Digest: 1r9rWxWamb1DZifbAf4UmmF7ep3uE2RrnQ8LVmgZ485                                           │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                  │
│  │ Sender: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                    │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 955011                                                                               │
│  │ Digest: 3cy1i4mv4TyA8gd3o3AiZfysczP7qTsneY4LuUGS3Tt9                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x2655c5bfa3b402abe77a168c203bae330fac121213d3f30145f0923f0f39b6d2                 │
│  │ Version: 1                                                                                    │
│  │ Digest: BtQ5qfRQUropCtnLBjSYhBcREmdd4viJAKEfifZ6xFZP                                          │
│  │ Modules: hello_move                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7948680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用合约函数：
```bash
> sui client call --function mint --module hello_move --package 0x2655c5bfa3b402abe77a168c203bae330fac121213d3f30145f0923f0f39b6d2 
Transaction Digest: MmVQEDqcM7ym7Xc6FLo3BcuYWKRAvSRsg8nnUbA4hCQ
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                  │
│ Gas Owner: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                   │
│  │ Version: 955011                                                                          │
│  │ Digest: 3cy1i4mv4TyA8gd3o3AiZfysczP7qTsneY4LuUGS3Tt9                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    hello_move                                                         │        │
│ │  │ Package:   0x2655c5bfa3b402abe77a168c203bae330fac121213d3f30145f0923f0f39b6d2 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    9AD81s4eEuqEn9Xuo+aOKxDPxfm1UabO9Gmsa6436VKNxa/JzXVeiRzvZWd6FdwHfdJ/0r76k41q8WqBiMmsDg== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: MmVQEDqcM7ym7Xc6FLo3BcuYWKRAvSRsg8nnUbA4hCQ                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 327                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32ab3105aeef656b6821b7280de6f1e6003b25ec47b6f41f5677d32910a27b08                         │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ Version: 955012                                                                                │
│  │ Digest: DLTN5zLKhqYaoqXBSF2akbLWtEMGH7xHM91xCv8tXnD                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                         │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ Version: 955012                                                                                │
│  │ Digest: AyFotmH2EdkaiW14D4irWKCZLv2pvDqhjWRUMK9LKcvX                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                         │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ Version: 955012                                                                                │
│  │ Digest: AyFotmH2EdkaiW14D4irWKCZLv2pvDqhjWRUMK9LKcvX                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2470000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CuVjU7oFsowKeo4RTauPhEmKM5Pw4Dm6M92pAvkhaRjj                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                 │
│  ┌──                                                                                                             │
│  │ ObjectID: 0x32ab3105aeef656b6821b7280de6f1e6003b25ec47b6f41f5677d32910a27b08                                  │
│  │ Sender: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                                    │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )                 │
│  │ ObjectType: 0x2655c5bfa3b402abe77a168c203bae330fac121213d3f30145f0923f0f39b6d2::hello_move::HelloWorldObject  │
│  │ Version: 955012                                                                                               │
│  │ Digest: DLTN5zLKhqYaoqXBSF2akbLWtEMGH7xHM91xCv8tXnD                                                           │
│  └──                                                                                                             │
│ Mutated Objects:                                                                                                 │
│  ┌──                                                                                                             │
│  │ ObjectID: 0xe88c355fe5e218c696d1159a00433c7c67f0a6335ca5da9d8db310ed3a88c5dc                                  │
│  │ Sender: 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb                                    │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                    │
│  │ Version: 955012                                                                                               │
│  │ Digest: AyFotmH2EdkaiW14D4irWKCZLv2pvDqhjWRUMK9LKcvX                                                          │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfd998e35b7845c6d2ea8759a150155d8255582818b234b596a6f073e6a5555eb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2491880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```