# Task2 coin
package链接: https://suiscan.xyz/testnet/object/0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2/contracts

treasury_cap的id: 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c

[发送 BrookBang_Coin 给地址 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2](#发送-brookbang_coin)

交易hash: 8JEFimygqhXU4A1tPBUyTpKtGb7qFKsX8bHTYrz8Spq



```
PS F:\sui_project\415\task2> sui client publish --gas-budget 30000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: BjwnxPCs64QwS1hrtir8xWNFBTWge5FKGLXkZC2Lmbgz
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                   │
│ Gas Owner: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                                    │
│  │ Version: 870959                                                                                           │
│  │ Digest: BziDdua144gFWSidT8uxgKocYeCXyVmnJHdT3xN4xyxA                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669" │ │
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
│    xyNxKHa4RvfA4TvwPLfPxKr5iLovkz/cfRrmrPsxOPeiGkRMmzlDDRb20qQ4lbpDLl0wSM8Rlwe4H0Jiu22GDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BjwnxPCs64QwS1hrtir8xWNFBTWge5FKGLXkZC2Lmbgz                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 340                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DnaVQkABZQcVrJDUWT15hu9v5KcPbqkrcTVahhDQiP8j                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x230e3aed046d24d17a7383efb768e9a0e86ce04ad941eb048214cea6bc56f959                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870960                                                                                │
│  │ Digest: A2vMZpuT6WucmpZHYuzqg9A59nQmXWhrwU7hvJ3PFKay                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5d8230b2b68ed9d7676bb8baad8d6dd56838c6e6d89613986324214ff8ca6a53                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 870960                                                                                │
│  │ Digest: DV6Dd9PjqJ4ga2nwiMaZCxFKtDqBUeMQFkY81BKgUNPx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa817a6d4b24e0881ec7b76172d5c7bde482b9ffb2c222473cdaf9728b28a89ca                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 870960                                                                                │
│  │ Digest: F1K6YTE82tBYKy1CXXAHBXNHSnMvrMdvkbioRfmrHU3W                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870960                                                                                │
│  │ Digest: Gj1AZBHGUxF8uYaDYTfdBiPDkCVKHSs9X2sDbnXvYHMi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xeeea4a0fa03665c9fab4c4c3dbc8a99b5a54a4aa5359ac2bb2c2468e44f63467                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 870960                                                                                │
│  │ Digest: EuyjtRYyhZh7uJmYEDnzKdBcuJhcmrek5UuWDgi5aaCW                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870960                                                                                │
│  │ Digest: 5k8Nuc4u47qKhLGyHS8CUbkVSz1GUyPuFmWXkYW5paQp                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870960                                                                                │
│  │ Digest: 5k8Nuc4u47qKhLGyHS8CUbkVSz1GUyPuFmWXkYW5paQp                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25771600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    D28C5ZvZPSksfCiXRtQVLnhNf9Ldg21YR8qNM6yBN4Fs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                          │
│  ┌──                                                                                                                                                      │
│  │ ObjectID: 0x230e3aed046d24d17a7383efb768e9a0e86ce04ad941eb048214cea6bc56f959                                                                           │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                                          │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                                   │
│  │ Version: 870960                                                                                                                                        │
│  │ Digest: A2vMZpuT6WucmpZHYuzqg9A59nQmXWhrwU7hvJ3PFKay                                                                                                   │
│  └──                                                                                                                                                      │
│  ┌──                                                                                                                                                      │
│  │ ObjectID: 0x5d8230b2b68ed9d7676bb8baad8d6dd56838c6e6d89613986324214ff8ca6a53                                                                           │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                             │
│  │ Owner: Shared                                                                                                                                          │
│  │ ObjectType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BrookbangFaucetHolder                           │
│  │ Version: 870960                                                                                                                                        │
│  │ Digest: DV6Dd9PjqJ4ga2nwiMaZCxFKtDqBUeMQFkY81BKgUNPx                                                                                                   │
│  └──                                                                                                                                                      │
│  ┌──                                                                                                                                                      │
│  │ ObjectID: 0xa817a6d4b24e0881ec7b76172d5c7bde482b9ffb2c222473cdaf9728b28a89ca                                                                           │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                             │
│  │ Owner: Immutable                                                                                                                                       │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN>                │
│  │ Version: 870960                                                                                                                                        │
│  │ Digest: F1K6YTE82tBYKy1CXXAHBXNHSnMvrMdvkbioRfmrHU3W                                                                                                   │
│  └──                                                                                                                                                      │
│  ┌──                                                                                                                                                      │
│  │ ObjectID: 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c                                                                           │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN>                 │
│  │ Version: 870960                                                                                                                                        │
│  │ Digest: Gj1AZBHGUxF8uYaDYTfdBiPDkCVKHSs9X2sDbnXvYHMi                                                                                                   │
│  └──                                                                                                                                                      │
│  ┌──                                                                                                                                                      │
│  │ ObjectID: 0xeeea4a0fa03665c9fab4c4c3dbc8a99b5a54a4aa5359ac2bb2c2468e44f63467                                                                           │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                             │
│  │ Owner: Immutable                                                                                                                                       │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN>  │
│  │ Version: 870960                                                                                                                                        │
│  │ Digest: EuyjtRYyhZh7uJmYEDnzKdBcuJhcmrek5UuWDgi5aaCW                                                                                                   │
│  └──                                                                                                                                                      │
│ Mutated Objects:                                                                                                                                          │
│  ┌──                                                                                                                                                      │
│  │ ObjectID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                                                                           │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                             │
│  │ Version: 870960                                                                                                                                        │
│  │ Digest: 5k8Nuc4u47qKhLGyHS8CUbkVSz1GUyPuFmWXkYW5paQp                                                                                                   │
│  └──                                                                                                                                                      │
│ Published Objects:                                                                                                                                        │
│  ┌──                                                                                                                                                      │
│  │ PackageID: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2                                                                          │
│  │ Version: 1                                                                                                                                             │
│  │ Digest: DnaVQkABZQcVrJDUWT15hu9v5KcPbqkrcTVahhDQiP8j                                                                                                   │
│  │ Modules: brookbang_coin, brookbang_faucet_coin                                                                                                         │
│  └──                                                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25793480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
### 发送 BROOKBANG_COIN 
```
PS F:\sui_project\415\task2> sui client call --function mint --module brookbang_coin --package 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2 --args 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c 1000
 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 30000000
Transaction Digest: 8JEFimygqhXU4A1tPBUyTpKtGb7qFKsX8bHTYrz8Spq
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                   │
│ Gas Owner: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                                    │
│  │ Version: 870960                                                                                           │
│  │ Digest: 5k8Nuc4u47qKhLGyHS8CUbkVSz1GUyPuFmWXkYW5paQp                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000"                                                                   │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    brookbang_coin                                                     │                         │
│ │  │ Package:   0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    k0EhSuleVb2If++JAnh1rZkmCBd8M5/D6KoGwKl2QxuwfiybHtAc94NGtP+ZpoQRIG7gBgyozRqgMpx4nh9dCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8JEFimygqhXU4A1tPBUyTpKtGb7qFKsX8bHTYrz8Spq                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 340                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbce611645cb47b360b11007166b9f84c566e41ab0efdb4ba0f4037a19243cf68                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 870961                                                                                │
│  │ Digest: DSbAmF7XPMFabHV3TJPNuxaYvvMn9H5oM1ka5JLqpyiz                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870961                                                                                │
│  │ Digest: 8DocFPjTRyEb2fhziVJk33HMwCDTnbeLCgeknbj7eK3A                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870961                                                                                │
│  │ Digest: E6FMEng1EbMuj7iHKstTtuEppqKD6XVE5f6QsgUc2N6x                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870961                                                                                │
│  │ Digest: E6FMEng1EbMuj7iHKstTtuEppqKD6XVE5f6QsgUc2N6x                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4316800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2813976 MIST                                                                   │
│    Non-refundable Storage Fee: 28424 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    BjwnxPCs64QwS1hrtir8xWNFBTWge5FKGLXkZC2Lmbgz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
                     │
│  ┌──
                     │
│  │ ObjectID: 0xbce611645cb47b360b11007166b9f84c566e41ab0efdb4ba0f4037a19243cf68
                     │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669
                     │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )
                     │
│  │ ObjectType: 0x2::coin::Coin<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN>         │
│  │ Version: 870961
                     │
│  │ Digest: DSbAmF7XPMFabHV3TJPNuxaYvvMn9H5oM1ka5JLqpyiz
                     │
│  └──
                     │
│ Mutated Objects:
                     │
│  ┌──
                     │
│  │ ObjectID: 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c
                     │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669
                     │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )
                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN>  │
│  │ Version: 870961
                     │
│  │ Digest: 8DocFPjTRyEb2fhziVJk33HMwCDTnbeLCgeknbj7eK3A
                     │
│  └──
                     │
│  ┌──
                     │
│  │ ObjectID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4
                     │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669
                     │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )
                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
                     │
│  │ Version: 870961
                     │
│  │ Digest: E6FMEng1EbMuj7iHKstTtuEppqKD6XVE5f6QsgUc2N6x
                     │
│  └──
                     │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                 │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN  │
│  │ Amount: 1000                                                                                                  │
│  └──                                                                                                             │
│  ┌──                                                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                 │
│  │ CoinType: 0x2::sui::SUI                                                                                       │
│  │ Amount: -2502824                                                                                              │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```