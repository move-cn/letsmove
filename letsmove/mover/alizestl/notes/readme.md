# Task-1

### helloworld move code:

```move
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}
```



### Config .toml file

原本的dependencies过旧，路径失效，导致部署报错；

clone sui 到本地，并指定正确的路径，即可部署成功。

正确路径：`Sui = { local = "../sui/crates/sui-framework/packages/sui-framework" }`

**.toml file**:

```toml
[package]
name = "hello_world"

# edition = "2024.alpha" # To use the Move 2024 edition, currently in alpha
# license = ""           # e.g., "MIT", "GPL", "Apache 2.0"
# authors = ["..."]      # e.g., ["Joe Smith (joesmith@noemail.com)", "John Snow (johnsnow@noemail.com)"]

[dependencies]
# Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
Sui = { local = "../sui/crates/sui-framework/packages/sui-framework" }
# For remote import, use the `{ git = "...", subdir = "...", rev = "..." }`.
# Revision can be a branch, a tag, and a commit hash.
# MyRemotePackage = { git = "https://some.remote/host.git", subdir = "remote/path", rev = "main" }

# For local dependencies use `local = path`. Path is relative to the package root
# Local = { local = "../path/to" }

# To resolve a version conflict and force a specific version for dependency
# override use `override = true`
# Override = { local = "../conflicting/version", override = true }

[addresses]
hello_world = "0x0"

# Named addresses will be accessible in Move as `@name`. They're also exported:
# for example, `std = "0x1"` is exported by the Standard Library.
# alice = "0xA11CE"

[dev-dependencies]
# The dev-dependencies section allows overriding dependencies for `--test` and
# `--dev` modes. You can introduce test-only dependencies here.
# Local = { local = "../path/to/dev-build" }

[dev-addresses]
# The dev-addresses section allows overwriting named addresses for the `--test`
# and `--dev` modes.
# alice = "0xB0B"

```



### Deploy

```
aoi@DESKTOP-GIO9AUC:~/hello_world$ sui client publish --gas-budget 30000000 --skip-dependency-verification
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Skipping dependency verification
Transaction Digest: A71dG2mJKKeVUEM7Pje3rkNx5KrWxU3TFWwiQqYGEX2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data
         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe
         │
│ Gas Owner: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe
         │
│ Gas Budget: 30000000 MIST
         │
│ Gas Price: 1000 MIST
         │
│ Gas Payment:
         │
│  ┌──
         │
│  │ ID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a
         │
│  │ Version: 15
         │
│  │ Digest: 71TJZzg25rGc1csW1r1aLX1DmLPCoMngVqyfKi5nnHNL
         │
│  └──
         │
│
         │
│ Transaction Kind: Programmable
         │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects
       │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮
         │
│ │ Commands                                                                │
         │
│ ├─────────────────────────────────────────────────────────────────────────┤
         │
│ │ 0  Publish:                                                             │
         │
│ │  ┌                                                                      │
         │
│ │  │ Dependencies:                                                        │
         │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │
         │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │
         │
│ │  └                                                                      │
         │
│ │                                                                         │
         │
│ │ 1  TransferObjects:                                                     │
         │
│ │  ┌                                                                      │
         │
│ │  │ Arguments:                                                           │
         │
│ │  │   Result 0                                                           │
         │
│ │  │ Address: Input  0                                                    │
         │
│ │  └                                                                      │
         │
│ ╰─────────────────────────────────────────────────────────────────────────╯
         │
│
         │
│ Signatures:
         │
│    TtkFPGPlO47Q9VypoELyHx7em31z35AxlsQM0yzqhzHl3rePA7H/luQ/26HLhdYc+lnXCjH98nenAvbrhS67CQ==
         │
│
         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: A71dG2mJKKeVUEM7Pje3rkNx5KrWxU3TFWwiQqYGEX2                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 1617                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x340332f8b8002bf7a320edd1f2a15546f3e5f34ae3d2356fd5de99ed46d7c7a6                         │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ Version: 16                                                                                    │
│  │ Digest: 7urutLumTmmvkZEpLmLsXDGfbC8Q5kUAM6W8aLi9ZLHU                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x94731be273a24303c41b1738f35d47b0f1d8364b02482b136ca7e9532f8fca88                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 48bJj3sFi6koH2r3PoCPuUteDiQmjsf9MxGVjZmeUbWx                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a                         │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ Version: 16                                                                                    │
│  │ Digest: 2NCTDyDBSmumaQJzv44vwYLmjWDb9Qa3iyY1LUQf4Gha                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a                         │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ Version: 16                                                                                    │
│  │ Digest: 2NCTDyDBSmumaQJzv44vwYLmjWDb9Qa3iyY1LUQf4Gha                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4FRXM7WZVSTnP1HvNLnoXYHL1XvwUwe14yd442h3AjHL                                                   │
│    4m9Hbxw2k2x1KjofrKMdH36fovJLPTk68fj5o2fUw3wp                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x340332f8b8002bf7a320edd1f2a15546f3e5f34ae3d2356fd5de99ed46d7c7a6                  │
│  │ Sender: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe                    │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 16                                                                                   │
│  │ Digest: 7urutLumTmmvkZEpLmLsXDGfbC8Q5kUAM6W8aLi9ZLHU                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a                  │
│  │ Sender: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe                    │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 16                                                                                   │
│  │ Digest: 2NCTDyDBSmumaQJzv44vwYLmjWDb9Qa3iyY1LUQf4Gha                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x94731be273a24303c41b1738f35d47b0f1d8364b02482b136ca7e9532f8fca88                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 48bJj3sFi6koH2r3PoCPuUteDiQmjsf9MxGVjZmeUbWx                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```





### Call Function

```
aoi@DESKTOP-GIO9AUC:~/hello_world$ sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 10000000
Transaction Digest: 9cPXRyCZyD8MF8N1kUbN8q9AGawLXNVZvqXcBPYZNAjL
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe                  │
│ Gas Owner: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a                   │
│  │ Version: 16                                                                              │
│  │ Digest: 2NCTDyDBSmumaQJzv44vwYLmjWDb9Qa3iyY1LUQf4Gha                                     │
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
│ │  │ Module:    hello_world                                                        │        │
│ │  │ Package:   0x94731be273a24303c41b1738f35d47b0f1d8364b02482b136ca7e9532f8fca88 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    BX7AG/1wzfvNsQ1/fZs0kIBlFqkzw575Os4gW6PIVJLNAoQVPSoo9v9cxFrX9ppw2NgGaiUyT0sayhJ7t7BNAQ== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9cPXRyCZyD8MF8N1kUbN8q9AGawLXNVZvqXcBPYZNAjL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1617                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5fd61d4caa8dbb27d6a2d63d348ed534296e6e4a1623cf6f84ac6632323e52e9                         │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ Version: 17                                                                                    │
│  │ Digest: B3rHmSNjHj9ZtcpSycvPgbXQork2owF4KAtpXCj2iTy1                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a                         │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ Version: 17                                                                                    │
│  │ Digest: Eaqb4xbRdDR2ZC2HuP2uvWizrJ5HsEHRiv1ug2k8DSgF                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a                         │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ Version: 17                                                                                    │
│  │ Digest: Eaqb4xbRdDR2ZC2HuP2uvWizrJ5HsEHRiv1ug2k8DSgF                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    A71dG2mJKKeVUEM7Pje3rkNx5KrWxU3TFWwiQqYGEX2                                                    │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
              │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
              │
│  ┌──
              │
│  │ ObjectID: 0x5fd61d4caa8dbb27d6a2d63d348ed534296e6e4a1623cf6f84ac6632323e52e9
              │
│  │ Sender: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe
              │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )                  │
│  │ ObjectType: 0x94731be273a24303c41b1738f35d47b0f1d8364b02482b136ca7e9532f8fca88::hello_world::HelloWorldObject  │
│  │ Version: 17
              │
│  │ Digest: B3rHmSNjHj9ZtcpSycvPgbXQork2owF4KAtpXCj2iTy1
              │
│  └──
              │
│ Mutated Objects:
              │
│  ┌──
              │
│  │ ObjectID: 0x4833b138b9982466dc5a428b53070c26ff9e42733c3f2bd078704abae35a9a3a
              │
│  │ Sender: 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe
              │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
              │
│  │ Version: 17
              │
│  │ Digest: Eaqb4xbRdDR2ZC2HuP2uvWizrJ5HsEHRiv1ug2k8DSgF
              │
│  └──
              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe38981b0b58d36e85c0941f4ec977fe2513f910a04685407398fb05a1774ccbe )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2507080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



在[SuiScan](https://suiscan.xyz/devnet/home)中查看Object ID: 0x5fd61d4caa8dbb27d6a2d63d348ed534296e6e4a1623cf6f84ac6632323e52e9

成功Hello World



# Task-7

### 思路

简答的CTF题

在[suivision](https://testnet.suivision.xyz/package/0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd?tab=Code)中查看合约部署地址，阅读合约代码逻辑（调用函数绕过输入检查）

查看`FlagStr Object`，ascii编码逆一下，EZ



Transaction Block：BUss77X7J7ZJ76rp5M19SGEPb6P4NLW28MiQbSqD9NaL