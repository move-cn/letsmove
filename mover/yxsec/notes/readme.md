# task1

安装sui client
```
brew install sui
```

通过`sui keytool`配置钱包私钥

编写move合约
``` move
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct Hello has key, store {
        id: UID,
        text: string::String
    }
    
    public entry fun mint_hello_world(ctx: &mut TxContext) {
    // Mint an object that contains an ID and "Hello World" text
        let hello_object = Hello {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        // Transfer the object to initializer address
        transfer::public_transfer(hello_object, tx_context::sender(ctx));
    }

}

```

部署合约
```
sui client publish  .

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Transaction Digest: CCRL4p4MkaqDTunMLi9K5frDH1gLvMjCf56zLCQTG67d
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941                                   │
│ Gas Owner: 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x54bb445f74fada87d703dfed8c4d685013ebc6189b82f97b50aa06a6eb115805                                    │
│  │ Version: 1046448                                                                                          │
│  │ Digest: DhHst7fWULd38P8FDz34cDmyvcm8fRZUKoPcthCZ2S98                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941" │ │
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
│    FyVk6AGM4ej0sAPWr+Kv0RnmQdZovzVgsRPQZST/1SkGZ8wPRVCKMS9Wx+DYX8hgXHLIJ+Hv+pq2mx7mm2ktBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CCRL4p4MkaqDTunMLi9K5frDH1gLvMjCf56zLCQTG67d                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 326                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d4015720c2ea30f50e2feb1789c00c7f21a0abbf86b1116ad9d00eb2842254a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: HFKhMjZYrEhf5ZncSk7qbr3eg4hJzdeBiCgt8EYVTbX                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcaa1de93e9888070fa72ac8db07f49cc6f3cf92fdc9bb7e785ee0f02bab8b40f                         │
│  │ Owner: Account Address ( 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941 )  │
│  │ Version: 1046449                                                                               │
│  │ Digest: 8bzh2gZTJHAoXdRZKbRkEpbwb57Y9Ngj7Y92tBFMVuUX                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x54bb445f74fada87d703dfed8c4d685013ebc6189b82f97b50aa06a6eb115805                         │
│  │ Owner: Account Address ( 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941 )  │
│  │ Version: 1046449                                                                               │
│  │ Digest: CREh9iNPACEwXCxUAWG93jn1MxigtamUszmfLY1des1H                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x54bb445f74fada87d703dfed8c4d685013ebc6189b82f97b50aa06a6eb115805                         │
│  │ Owner: Account Address ( 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941 )  │
│  │ Version: 1046449                                                                               │
│  │ Digest: CREh9iNPACEwXCxUAWG93jn1MxigtamUszmfLY1des1H                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7881200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    8AQVcZrAYzD26Qst5j4tVikHiBqx3JWpJYXxJ5pNdaDe                                                   │
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
│  │ ObjectID: 0xcaa1de93e9888070fa72ac8db07f49cc6f3cf92fdc9bb7e785ee0f02bab8b40f                  │
│  │ Sender: 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941                    │
│  │ Owner: Account Address ( 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 1046449                                                                              │
│  │ Digest: 8bzh2gZTJHAoXdRZKbRkEpbwb57Y9Ngj7Y92tBFMVuUX                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x54bb445f74fada87d703dfed8c4d685013ebc6189b82f97b50aa06a6eb115805                  │
│  │ Sender: 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941                    │
│  │ Owner: Account Address ( 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1046449                                                                              │
│  │ Digest: CREh9iNPACEwXCxUAWG93jn1MxigtamUszmfLY1des1H                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x0d4015720c2ea30f50e2feb1789c00c7f21a0abbf86b1116ad9d00eb2842254a                 │
│  │ Version: 1                                                                                    │
│  │ Digest: HFKhMjZYrEhf5ZncSk7qbr3eg4hJzdeBiCgt8EYVTbX                                           │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
user.name=yxsec
user.email=liuyixuan@yxsec.cc
safe.directory=/opt/homebrew/Library/Taps/homebrew/homebrew-cask
safe.directory=/Users/catblue/Desktop/blog/hexo/.deploy_git
safe.directory=/opt/homebrew/Library/Taps/homebrew/homebrew-core
safe.directory=/Users/catblue/Desktop/blog/hexo/.deploy_git
...skipping...
────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf5ac9c7ff26f2fad84f1f70c1a4966a9f5685c3e487864b36532411564ba7941 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7903080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

获得package id
```
0x0d4015720c2ea30f50e2feb1789c00c7f21a0abbf86b1116ad9d00eb2842254a
```