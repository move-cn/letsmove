0x2::coin::TreasuryCap<0x9c9ce17ee4943cc4a5b00011238a4c5c3be77908865a0c7066cbf7c879b24fea::xusd::XUSD>
0x2::coin::TreasuryCap<0x5e550c2400fa9c1d6ed2839674857ef010f01b3563f47837c6d3052257d31b44::xrmb_facuet::XRMB_FACUET>

mint代币客户端调用命令：
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x5e550c2400fa9c1d6ed2839674857ef010f01b3563f47837c6d3052257d31b44::xusd::XUSD --args 0x8c0ee6772cbb0a66971c0cecc9c3478b6490588619f1d1f7e4ecc74145e3daeb 1900000000000 0xae317a1ddbea4a153a7bacb9a70f48683713de2ffc683745b74ad2b5d87d17b2
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x5e550c2400fa9c1d6ed2839674857ef010f01b3563f47837c6d3052257d31b44::xrmb_facuet::XRMB_FACUET --args 0xc6527f537d03c1e22f57b3355a8f7a8bfab0f149780f4d5e6cc499855df8a018 1910000000000 0xae317a1ddbea4a153a7bacb9a70f48683713de2ffc683745b74ad2b5d87d17b2



mygame:

sui client publish
[warning] Client/Server api version mismatch, client api version : 1.45.2, server api version : 1.46.3
[Note]: Dependency sources are no longer verified automatically during publication and upgrade. You can pass the `--verify-deps` option if you would like to verify them as part of publication or upgrade.
[note] Dependencies on Bridge, DeepBook, MoveStdlib, Sui, and SuiSystem are automatically added, but this feature is disabled for your package because you have explicitly included dependencies on Sui. Consider removing these dependencies from Move.toml.
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mygame
Skipping dependency verification
Transaction Digest: 7waXN1L5rA9RocK6ZrYJnY4m6SgzQG7yw9Tv47YyWvnL
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                   │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                │
│ Gas Budget: 14184400 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                    │
│  │ Version: 525713663                                                                                        │
│  │ Digest: DCm96tzen47UbTzquDTfM1uUYhBYYG3F5fn9VA6qDRJ9                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa" │ │
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
│    MyYhoBn9vT2wrX+sDuK+wVXc4jXTgWMzzB3AV+z5/uz6+u9abJtNBgSA9XBZX0qinozCKz/OGF2fo1rcC55ZDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7waXN1L5rA9RocK6ZrYJnY4m6SgzQG7yw9Tv47YyWvnL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 735                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5ffd4b038fa268f0d25d1d908ae8ade748bf18b3296f8c53fbc9cf2813d8498a                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713664                                                                             │
│  │ Digest: 2PAJa5puwZcFzQKgNtx5Y9GNGf4TbRYocb94bfvbD9Q5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4cSCh46i5WvjJNVt3j8nP3CoDD39x3yHJciuYATK2rEr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713664                                                                             │
│  │ Digest: HfVo9rMyqnjovyJo3WdD5Gd7pWrSgu1YsstkPTeuZYiU                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713664                                                                             │
│  │ Digest: HfVo9rMyqnjovyJo3WdD5Gd7pWrSgu1YsstkPTeuZYiU                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12684400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    BjN2g2ZdQFSVbPbQ79QhefSZrvRSnACpcKD9tbXDY3Ni                                                   │
│    Dyw8VQTsCWC8cGYJGb6PDCFvmEccfbBbpRQdMYUpJEbB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5ffd4b038fa268f0d25d1d908ae8ade748bf18b3296f8c53fbc9cf2813d8498a                  │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                    │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 525713664                                                                            │
│  │ Digest: 2PAJa5puwZcFzQKgNtx5Y9GNGf4TbRYocb94bfvbD9Q5                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                  │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                    │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 525713664                                                                            │
│  │ Digest: HfVo9rMyqnjovyJo3WdD5Gd7pWrSgu1YsstkPTeuZYiU                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 4cSCh46i5WvjJNVt3j8nP3CoDD39x3yHJciuYATK2rEr                                          │
│  │ Modules: mygame                                                                               │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12456280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

add pool:
sui client call --package 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f --module mygame --function creat_game --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET 


[warning] Client/Server api version mismatch, client api version : 1.45.2, server api version : 1.46.3
Transaction Digest: BaQiSracrYFPCZW414wiLkkQdrV3gShmDwsgXWgBVmpB
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 5619200 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713666                                                                                 │
│  │ Digest: DDzMGJRQ4wj5d5kc5Dwxh8UmxTSxK18UcojF2Vk4TEac                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│   No input objects for this transaction                                                               │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  creat_game                                                                          │ │
│ │  │ Module:    mygame                                                                              │ │
│ │  │ Package:   0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    FhZIghpyPXVJPTMlBzSUZtzWsZj2Nzi5+9qgmFqges29eO0YMBnmShdqkOMRV1Bh/3EepE6rzra7oVGMxqbvBg==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BaQiSracrYFPCZW414wiLkkQdrV3gShmDwsgXWgBVmpB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 735                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Owner: Shared( 525713667 )                                                                     │
│  │ Version: 525713667                                                                             │
│  │ Digest: 7mkdpAREmKQppytuztUNSiXMJe9HFMPQj6ntHNqW7xKW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x248a4d0c1e233971333538618dd7e007cf405312c831557e322903ab3ff1b3b4                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713667                                                                             │
│  │ Digest: AWj8xdLSW8uAz8D47iHMh656VusBp88RoY7GrGsuQqEn                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713667                                                                             │
│  │ Digest: 5oL1SxdXVbrkTmfYKRrJWEJNEoKb42VQHSmN7hqGvFdG                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713667                                                                             │
│  │ Digest: 5oL1SxdXVbrkTmfYKRrJWEJNEoKb42VQHSmN7hqGvFdG                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4119200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7hXfYhRjR7qwWHeJs4GkV7jKZgKhcmMCtGs9drr9GhWp                                                   │
│    7waXN1L5rA9RocK6ZrYJnY4m6SgzQG7yw9Tv47YyWvnL                                                   │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Shared( 525713667 )                                                                                                                                                                          │
│  │ ObjectType: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f::mygame::Game_dryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713667                                                                                                                                                                                  │
│  │ Digest: 7mkdpAREmKQppytuztUNSiXMJe9HFMPQj6ntHNqW7xKW                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x248a4d0c1e233971333538618dd7e007cf405312c831557e322903ab3ff1b3b4                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f::mygame::AdminCap                                                                                                    │
│  │ Version: 525713667                                                                                                                                                                                  │
│  │ Digest: AWj8xdLSW8uAz8D47iHMh656VusBp88RoY7GrGsuQqEn                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                          │
│  │ Version: 525713667                                                                                                                                                                                  │
│  │ Digest: 5oL1SxdXVbrkTmfYKRrJWEJNEoKb42VQHSmN7hqGvFdG                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3891080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


add pool:
sui client call --package 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f --module mygame --function addPool --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7 0x1da90c119756e0c37a0f482a9571e2d2a536017a6d6b3650b5f611e15b44c23c

[warning] Client/Server api version mismatch, client api version : 1.45.2, server api version : 1.46.3
Transaction Digest: CbXN1a3NFMVdjsyCFSevqpYiUExba3jyhwx5xFUr7w9
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 1500000 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713667                                                                                 │
│  │ Digest: 5oL1SxdXVbrkTmfYKRrJWEJNEoKb42VQHSmN7hqGvFdG                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7 │       │
│ │ 1   Imm/Owned Object ID: 0x1da90c119756e0c37a0f482a9571e2d2a536017a6d6b3650b5f611e15b44c23c │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  addPool                                                                             │ │
│ │  │ Module:    mygame                                                                              │ │
│ │  │ Package:   0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    Ga+dKV36WyEKU248EaReeWRXQr+bIgLnjBZKw5U16VM1wSO3I9ZdfzxSg09aiD8psj8exhEIw+1lODCuiVuUDA==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CbXN1a3NFMVdjsyCFSevqpYiUExba3jyhwx5xFUr7w9                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 735                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Owner: Shared( 525713667 )                                                                     │
│  │ Version: 525713668                                                                             │
│  │ Digest: C9oZArmCcqWoS4GoXyvBdZx9PJYDMAjSEvYpmA6zH2y6                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713668                                                                             │
│  │ Digest: GPWZY9rTC9TBs8XA4RCVJHjLXoNVSQUmcfKtogMUeTwm                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Version: 525713667                                                                             │
│  │ Digest: 7mkdpAREmKQppytuztUNSiXMJe9HFMPQj6ntHNqW7xKW                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1da90c119756e0c37a0f482a9571e2d2a536017a6d6b3650b5f611e15b44c23c                         │
│  │ Version: 525713668                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713668                                                                             │
│  │ Digest: GPWZY9rTC9TBs8XA4RCVJHjLXoNVSQUmcfKtogMUeTwm                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2819600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4205916 MIST                                                                   │
│    Non-refundable Storage Fee: 42484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7waXN1L5rA9RocK6ZrYJnY4m6SgzQG7yw9Tv47YyWvnL                                                   │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
│    BaQiSracrYFPCZW414wiLkkQdrV3gShmDwsgXWgBVmpB                                                   │
│    CEui2ZDx6xHTqRjyvX69q7h6QdJ7in2wegVoi7k6tA4N                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Shared( 525713667 )                                                                                                                                                                          │
│  │ ObjectType: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f::mygame::Game_dryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713668                                                                                                                                                                                  │
│  │ Digest: C9oZArmCcqWoS4GoXyvBdZx9PJYDMAjSEvYpmA6zH2y6                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                          │
│  │ Version: 525713668                                                                                                                                                                                  │
│  │ Digest: GPWZY9rTC9TBs8XA4RCVJHjLXoNVSQUmcfKtogMUeTwm                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: 636316                                                                                          │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET  │
│  │ Amount: -1910000000000                                                                                  │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯


sui client call --package 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f --module mygame --function play --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7 0x8 true 0x6680d907833386ff62ea87d45993f811f76b7566fed35b3e349642f23154b7a9


[warning] Client/Server api version mismatch, client api version : 1.45.2, server api version : 1.46.3
Transaction Digest: C5z6T7hRjiCaNmxg4t1rkJzfwWhvoUoH6NEXddNzsPyV
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 3949404 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713672                                                                                 │
│  │ Digest: 6L5MEKEbDqDNQrUUybWptZvZmoSz54UoGUftTDxbX18t                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7 │       │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │       │
│ │ 2   Pure Arg: Type: bool, Value: true                                                       │       │
│ │ 3   Imm/Owned Object ID: 0x6680d907833386ff62ea87d45993f811f76b7566fed35b3e349642f23154b7a9 │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  play                                                                                │ │
│ │  │ Module:    mygame                                                                              │ │
│ │  │ Package:   0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  │   Input  3                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    ERXGBmJvQoNVkmvxbINlQfUcisHw7wxFF+95Bh0LzxyDVVmaNDqvwt6835h4xzymzJF7QHNwYFYb8voC9lTpCA==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: C5z6T7hRjiCaNmxg4t1rkJzfwWhvoUoH6NEXddNzsPyV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 735                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Owner: Shared( 525713667 )                                                                     │
│  │ Version: 525713673                                                                             │
│  │ Digest: 6Y7H4fttCxpjz9PNKt2EFWLHbzfeUeknhmXYKFqxeFLs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713673                                                                             │
│  │ Digest: DFjDRaRdpdqSg1QenpttBwDU5LXgnXhzzpoUJ5Grrcya                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Version: 525713671                                                                             │
│  │ Digest: FPUPMAf85mt4mpZxWVuUTvCYBNsTpYPx1yciXEZchC8Y                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008                         │
│  │ Version: 363861487                                                                             │
│  │ Digest: F1bqZowkDwUhrQzd1rWPfjeM8ZPKs3KxYY4HpkxrUtg7                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6680d907833386ff62ea87d45993f811f76b7566fed35b3e349642f23154b7a9                         │
│  │ Version: 525713673                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713673                                                                             │
│  │ Digest: DFjDRaRdpdqSg1QenpttBwDU5LXgnXhzzpoUJ5Grrcya                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2819600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4205916 MIST                                                                   │
│    Non-refundable Storage Fee: 42484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    FdUFzZkUHw6e7AhPCbadDWr6CaVacozyzAMqvM7zSNS                                                    │
│    5a39yH7p9NwVVh9k94R1viQiDkhor4BKNXbkV9Yg268k                                                   │
│    7waXN1L5rA9RocK6ZrYJnY4m6SgzQG7yw9Tv47YyWvnL                                                   │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
│    Du1QArZyprwSNzUtXDKWsigtN8P5FwCBpLSt7nuX69AJ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Shared( 525713667 )                                                                                                                                                                          │
│  │ ObjectType: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f::mygame::Game_dryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713673                                                                                                                                                                                  │
│  │ Digest: 6Y7H4fttCxpjz9PNKt2EFWLHbzfeUeknhmXYKFqxeFLs                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                          │
│  │ Version: 525713673                                                                                                                                                                                  │
│  │ Digest: DFjDRaRdpdqSg1QenpttBwDU5LXgnXhzzpoUJ5Grrcya                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: 636316                                                                                          │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET  │
│  │ Amount: -1910000000                                                                                     │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

sui client call --package 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f --module mygame --function removePool --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0x248a4d0c1e233971333538618dd7e007cf405312c831557e322903ab3ff1b3b4 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7 911910000000


[warning] Client/Server api version mismatch, client api version : 1.45.2, server api version : 1.46.3
Transaction Digest: 8sxhYADdtbxfbtGE6QGZHXZdm3jVDAX99Gf299vXZJgy
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 3948112 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713673                                                                                 │
│  │ Digest: DFjDRaRdpdqSg1QenpttBwDU5LXgnXhzzpoUJ5Grrcya                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Imm/Owned Object ID: 0x248a4d0c1e233971333538618dd7e007cf405312c831557e322903ab3ff1b3b4 │       │
│ │ 1   Shared Object    ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7 │       │
│ │ 2   Pure Arg: Type: u64, Value: "911910000000"                                              │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  removePool                                                                          │ │
│ │  │ Module:    mygame                                                                              │ │
│ │  │ Package:   0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    5++YJE7y3Hn4wMDFeCQRYHhb7gqQXipLruOGir0FA7jOfG1d0JcCtb1d5EzsfrOyfQ+u4zESl+GXaTrfcIkKAA==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8sxhYADdtbxfbtGE6QGZHXZdm3jVDAX99Gf299vXZJgy                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 735                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5a6002158aaabc1c3ec70357cfbc0700971a745c4afd4f63ebb2fa2dc1feb0b6                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713674                                                                             │
│  │ Digest: GGhfSLwmsWKmU3KJb62j7nzo9Ahf7UzoGvNcbpGQ3ufw                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Owner: Shared( 525713667 )                                                                     │
│  │ Version: 525713674                                                                             │
│  │ Digest: EerPoYndrvjDgWGNsPnFTAbAedZpKAC3FVAhKMN8VnKe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x248a4d0c1e233971333538618dd7e007cf405312c831557e322903ab3ff1b3b4                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713674                                                                             │
│  │ Digest: EGnuBGrm5B7DSn8EmC1owDji4eN4Aj62GxYRaDmcMsdP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713674                                                                             │
│  │ Digest: L8vDAYLCFjmXHbAi5A84T28ccSq8wJp29M52kdMAk1Z                                            │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                         │
│  │ Version: 525713673                                                                             │
│  │ Digest: 6Y7H4fttCxpjz9PNKt2EFWLHbzfeUeknhmXYKFqxeFLs                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713674                                                                             │
│  │ Digest: L8vDAYLCFjmXHbAi5A84T28ccSq8wJp29M52kdMAk1Z                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 5548000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4078008 MIST                                                                   │
│    Non-refundable Storage Fee: 41192 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7waXN1L5rA9RocK6ZrYJnY4m6SgzQG7yw9Tv47YyWvnL                                                   │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
│    BaQiSracrYFPCZW414wiLkkQdrV3gShmDwsgXWgBVmpB                                                   │
│    C5z6T7hRjiCaNmxg4t1rkJzfwWhvoUoH6NEXddNzsPyV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x5a6002158aaabc1c3ec70357cfbc0700971a745c4afd4f63ebb2fa2dc1feb0b6                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>                                                                           │
│  │ Version: 525713674                                                                                                                                                                                  │
│  │ Digest: GGhfSLwmsWKmU3KJb62j7nzo9Ahf7UzoGvNcbpGQ3ufw                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x05e9cfad195d01ee89873d4287ee91b11493c03e032487d98fa059f4c5b43cc7                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Shared( 525713667 )                                                                                                                                                                          │
│  │ ObjectType: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f::mygame::Game_dryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713674                                                                                                                                                                                  │
│  │ Digest: EerPoYndrvjDgWGNsPnFTAbAedZpKAC3FVAhKMN8VnKe                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x248a4d0c1e233971333538618dd7e007cf405312c831557e322903ab3ff1b3b4                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x618b181fa669616a2e3575e48e944fcad6012b31703ede147d290d1d652eac0f::mygame::AdminCap                                                                                                    │
│  │ Version: 525713674                                                                                                                                                                                  │
│  │ Digest: EGnuBGrm5B7DSn8EmC1owDji4eN4Aj62GxYRaDmcMsdP                                                                                                                                                │
│  └──                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                   │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                        │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                          │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                          │
│  │ Version: 525713674                                                                                                                                                                                  │
│  │ Digest: L8vDAYLCFjmXHbAi5A84T28ccSq8wJp29M52kdMAk1Z                                                                                                                                                 │
│  └──                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2219992                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET  │
│  │ Amount: 911910000000                                                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯


myswap publish:

Skipping dependency verification
Transaction Digest: JpmJfGij2qyznnBK6GuKF64jyd5S9iGLtgfH21nyvh7
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                   │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                │
│ Gas Budget: 15780400 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                    │
│  │ Version: 525713674                                                                                        │
│  │ Digest: L8vDAYLCFjmXHbAi5A84T28ccSq8wJp29M52kdMAk1Z                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa" │ │
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
│    uQKCXLdyJOdk06di2egZivqndDPGZePKLtFhTUtVlB4EIpAccbSrE5QnCRQpQq9YtodHpGmHhAk9BjSl6jrPBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: JpmJfGij2qyznnBK6GuKF64jyd5S9iGLtgfH21nyvh7                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 742                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: ALXeJmvwWWVpaHYt46fNAMBk2k328jPgRtyh3KazpYxR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc1866252ef884b66c3c8eb60809aa1885f0c38079f5c4effddb8f9917bfce3a2                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713675                                                                             │
│  │ Digest: Djy7cK6LMaNivWhjG6kHwEceKW1thSZo1mH97pGPE4aJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfba32480947f412c87f35bee49cf420c0507345acade1774512da66d5f1ff4fb                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713675                                                                             │
│  │ Digest: CY2T1FVgQPntgor9Rf4YMxqA8nQZXZ4soXR2xpGhLnUe                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713675                                                                             │
│  │ Digest: 9xY7mpX9AwMvWCxJeCg26bbJ29nomCZBMwk5mPCiRPaZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713675                                                                             │
│  │ Digest: 9xY7mpX9AwMvWCxJeCg26bbJ29nomCZBMwk5mPCiRPaZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14280400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8sxhYADdtbxfbtGE6QGZHXZdm3jVDAX99Gf299vXZJgy                                                   │
│    Dyw8VQTsCWC8cGYJGb6PDCFvmEccfbBbpRQdMYUpJEbB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xc1866252ef884b66c3c8eb60809aa1885f0c38079f5c4effddb8f9917bfce3a2                      │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                        │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )     │
│  │ ObjectType: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723::myswap::AdminCap  │
│  │ Version: 525713675                                                                                │
│  │ Digest: Djy7cK6LMaNivWhjG6kHwEceKW1thSZo1mH97pGPE4aJ                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xfba32480947f412c87f35bee49cf420c0507345acade1774512da66d5f1ff4fb                      │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                        │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )     │
│  │ ObjectType: 0x2::package::UpgradeCap                                                              │
│  │ Version: 525713675                                                                                │
│  │ Digest: CY2T1FVgQPntgor9Rf4YMxqA8nQZXZ4soXR2xpGhLnUe                                              │
│  └──                                                                                                 │
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                      │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                        │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 525713675                                                                                │
│  │ Digest: 9xY7mpX9AwMvWCxJeCg26bbJ29nomCZBMwk5mPCiRPaZ                                              │
│  └──                                                                                                 │
│ Published Objects:                                                                                   │
│  ┌──                                                                                                 │
│  │ PackageID: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723                     │
│  │ Version: 1                                                                                        │
│  │ Digest: ALXeJmvwWWVpaHYt46fNAMBk2k328jPgRtyh3KazpYxR                                              │
│  │ Modules: myswap                                                                                   │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14052280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


add bank:

sui client call --package 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723 --module myswap --function add_bank --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0xc1866252ef884b66c3c8eb60809aa1885f0c38079f5c4effddb8f9917bfce3a2 73 10

Transaction Digest: nvhcH85szMaWLpgFNEZQAYdj1S1hSUDiVpGYmcmpVww
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 4841796 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713675                                                                                 │
│  │ Digest: 9xY7mpX9AwMvWCxJeCg26bbJ29nomCZBMwk5mPCiRPaZ                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Imm/Owned Object ID: 0xc1866252ef884b66c3c8eb60809aa1885f0c38079f5c4effddb8f9917bfce3a2 │       │
│ │ 1   Pure Arg: Type: u64, Value: "73"                                                        │       │
│ │ 2   Pure Arg: Type: u64, Value: "10"                                                        │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  add_bank                                                                            │ │
│ │  │ Module:    myswap                                                                              │ │
│ │  │ Package:   0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD               │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    AFbHev3dtbUFc/LRX8H7klMGcyzTc93i/kabbYh72GU3Shl0IDudRs08FuaszyEjv9z+AcynqM8Mdctb6s4FAg==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: nvhcH85szMaWLpgFNEZQAYdj1S1hSUDiVpGYmcmpVww                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 742                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                         │
│  │ Owner: Shared( 525713676 )                                                                     │
│  │ Version: 525713676                                                                             │
│  │ Digest: APdnuSXYqabx299h7h9qsHvvzxNgnjV2J6VMxgcjfzqD                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713676                                                                             │
│  │ Digest: jyCmyL8D9UPcBjrPavXtw9DB6f3oUyRPhcfNewzmJKw                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc1866252ef884b66c3c8eb60809aa1885f0c38079f5c4effddb8f9917bfce3a2                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713676                                                                             │
│  │ Digest: BrZaeGxayiND18n6am13kqJNTTT6Fyt13QEUEbpEvixT                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713676                                                                             │
│  │ Digest: jyCmyL8D9UPcBjrPavXtw9DB6f3oUyRPhcfNewzmJKw                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4628400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2264724 MIST                                                                   │
│    Non-refundable Storage Fee: 22876 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    JpmJfGij2qyznnBK6GuKF64jyd5S9iGLtgfH21nyvh7                                                    │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Shared( 525713676 )                                                                                                                                                                                                                                                         │
│  │ ObjectType: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723::myswap::BankDryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD, 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713676                                                                                                                                                                                                                                                                 │
│  │ Digest: APdnuSXYqabx299h7h9qsHvvzxNgnjV2J6VMxgcjfzqD                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 525713676                                                                                                                                                                                                                                                                 │
│  │ Digest: jyCmyL8D9UPcBjrPavXtw9DB6f3oUyRPhcfNewzmJKw                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xc1866252ef884b66c3c8eb60809aa1885f0c38079f5c4effddb8f9917bfce3a2                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                                                                                                      │
│  │ ObjectType: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723::myswap::AdminCap                                                                                                                                                                                   │
│  │ Version: 525713676                                                                                                                                                                                                                                                                 │
│  │ Digest: BrZaeGxayiND18n6am13kqJNTTT6Fyt13QEUEbpEvixT                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3113676                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


// 存钱
<!-- public fun add_coin_a<CoinA, CoinB>(bank: &mut BankDryan07<CoinA, CoinB>, in:Coin<CoinA>, _:&mut TxContext){
    bank.coin_a.join(coin::into_balance(in));
} -->

sui client call --package 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723 --module myswap --function add_coin_a --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef 0xc1fdfa92ad2b9b0ee1a8ca9dc4abfb26a42e5625bb3499571305008182360272


<!-- public fun b_to_a<CoinA, CoinB>(bank: &mut BankDryan07<CoinA, CoinB>, in:Coin<CoinB>, ctx:&mut TxContext){ -->

sui client call --package 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723 --module myswap --function b_to_a --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef 0x5a6002158aaabc1c3ec70357cfbc0700971a745c4afd4f63ebb2fa2dc1feb0b6

Transaction Digest: 2JePRHhFwLRTCob6dGVy7D9fNaWJGSS4Zh3gmuHGojQN
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 2419296 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713678                                                                                 │
│  │ Digest: B5pk96EK6W3Tgb7ku8bosAr7hHxkp39DrXmxjeE6TTKm                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef │       │
│ │ 1   Imm/Owned Object ID: 0x5a6002158aaabc1c3ec70357cfbc0700971a745c4afd4f63ebb2fa2dc1feb0b6 │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  b_to_a                                                                              │ │
│ │  │ Module:    myswap                                                                              │ │
│ │  │ Package:   0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD               │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    X+m4WrFjbM43bzPZQWAFgHJtKtPBLTOxAgkNDuitql+bmlKFZeyIRng6XtibHFX0YV94wMRITt2wNVXVCVMBCQ==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2JePRHhFwLRTCob6dGVy7D9fNaWJGSS4Zh3gmuHGojQN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 742                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7dcfaecd999e76883be31e3914e0f9828257f995d09821c9a849655b9b8d7d45                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713679                                                                             │
│  │ Digest: 5SrUF2i5pNJG6XghiDyq9pwCAgwVAj6pYtmCbyKGwQs7                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713679                                                                             │
│  │ Digest: DFguxCarGj48pJEPJp96Y2yMgEpQdv79NmePgc9ib6RU                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                         │
│  │ Owner: Shared( 525713676 )                                                                     │
│  │ Version: 525713679                                                                             │
│  │ Digest: 8Z7duN3DyjSXaoyqUu8JpLEbM4QPUVwHfBnjE5aapgV6                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                         │
│  │ Version: 525713678                                                                             │
│  │ Digest: 63ScoCnmAooqGF6Z1jo49ihxPMRJ3b4gyhNCYrwxMD59                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5a6002158aaabc1c3ec70357cfbc0700971a745c4afd4f63ebb2fa2dc1feb0b6                         │
│  │ Version: 525713679                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713679                                                                             │
│  │ Digest: DFguxCarGj48pJEPJp96Y2yMgEpQdv79NmePgc9ib6RU                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4651200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4710024 MIST                                                                   │
│    Non-refundable Storage Fee: 47576 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    JpmJfGij2qyznnBK6GuKF64jyd5S9iGLtgfH21nyvh7                                                    │
│    6xDRyCAdhkZ7wsuGbk7FwNSSdFYBbSiedXTztnsGbu3W                                                   │
│    8sxhYADdtbxfbtGE6QGZHXZdm3jVDAX99Gf299vXZJgy                                                   │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x7dcfaecd999e76883be31e3914e0f9828257f995d09821c9a849655b9b8d7d45                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD>                                                                                                                                                                        │
│  │ Version: 525713679                                                                                                                                                                                                                                                                 │
│  │ Digest: 5SrUF2i5pNJG6XghiDyq9pwCAgwVAj6pYtmCbyKGwQs7                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 525713679                                                                                                                                                                                                                                                                 │
│  │ Digest: DFguxCarGj48pJEPJp96Y2yMgEpQdv79NmePgc9ib6RU                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Shared( 525713676 )                                                                                                                                                                                                                                                         │
│  │ ObjectType: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723::myswap::BankDryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD, 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713679                                                                                                                                                                                                                                                                 │
│  │ Digest: 8Z7duN3DyjSXaoyqUu8JpLEbM4QPUVwHfBnjE5aapgV6                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -691176                                                                                         │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET  │
│  │ Amount: -911910000000                                                                                   │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD                │
│  │ Amount: 124919178082                                                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯



<!-- public fun a_to_b<CoinA, CoinB>(bank: &mut BankDryan07<CoinA, CoinB>, in:Coin<CoinA>, ctx:&mut TxContext){ -->

sui client call --package 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723 --module myswap --function a_to_b --type-args 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET --args 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef 0x7dcfaecd999e76883be31e3914e0f9828257f995d09821c9a849655b9b8d7d45

Transaction Digest: Ch3fKrhAcbQYuvvb7bhGaimY8vV8ucSq7vfBQmLF1fMn
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                            │
│ Gas Owner: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                         │
│ Gas Budget: 2631032 MIST                                                                              │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                             │
│  │ Version: 525713682                                                                                 │
│  │ Digest: C6po3F1SudJG1LajibqqGvjBi8S3nB2U3MvT58Uob284                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef │       │
│ │ 1   Imm/Owned Object ID: 0x7dcfaecd999e76883be31e3914e0f9828257f995d09821c9a849655b9b8d7d45 │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  a_to_b                                                                              │ │
│ │  │ Module:    myswap                                                                              │ │
│ │  │ Package:   0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD               │ │
│ │  │   0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    nm2A8S7RdIN8vG125ddme+vd4FT/b6dhsSntL8ECjrpWPXOKwU9iGWqbxMpqX+PbxRIdRhfK22WEvAOPmnT/Aw==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Ch3fKrhAcbQYuvvb7bhGaimY8vV8ucSq7vfBQmLF1fMn                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 742                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xc72083a28ee11cc35d9fdb39e3b1ee116151f150c46b13d3896f50d12ca955ae                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713683                                                                             │
│  │ Digest: H9ofpG9ZMTfSrVt5QkDfDQtVnQ9emFofTHACwbERU3SD                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713683                                                                             │
│  │ Digest: 3wWWvaReqan3ZmXphwhcp4uXhJDRz2UfQAqvnytzjP3F                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                         │
│  │ Owner: Shared( 525713676 )                                                                     │
│  │ Version: 525713683                                                                             │
│  │ Digest: D31HYY1WxVQsRQ28NfjedapYPACqYYxTKeWLehd5z7vo                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                         │
│  │ Version: 525713682                                                                             │
│  │ Digest: ALA8S9t262PPmkEyEp5u8Mp6FieotXdpfwXRzaCkTMwF                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7dcfaecd999e76883be31e3914e0f9828257f995d09821c9a849655b9b8d7d45                         │
│  │ Version: 525713683                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )  │
│  │ Version: 525713683                                                                             │
│  │ Digest: 3wWWvaReqan3ZmXphwhcp4uXhJDRz2UfQAqvnytzjP3F                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4757600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4604688 MIST                                                                   │
│    Non-refundable Storage Fee: 46512 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    JpmJfGij2qyznnBK6GuKF64jyd5S9iGLtgfH21nyvh7                                                    │
│    2JePRHhFwLRTCob6dGVy7D9fNaWJGSS4Zh3gmuHGojQN                                                   │
│    6FxmQ1T5cTvBtPFA9q4A5VyY1oB7wrpuCTdb7H73YzSv                                                   │
│    94Lgtog3P1HEWszxjSfDQvZE1dSr1DJK2YDd6J1nqDUf                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xc72083a28ee11cc35d9fdb39e3b1ee116151f150c46b13d3896f50d12ca955ae                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>                                                                                                                                                          │
│  │ Version: 525713683                                                                                                                                                                                                                                                                 │
│  │ Digest: H9ofpG9ZMTfSrVt5QkDfDQtVnQ9emFofTHACwbERU3SD                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x323cc7d20266e0729980c4d92046026500ceefc833faec6611ca23b27265a2df                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 525713683                                                                                                                                                                                                                                                                 │
│  │ Digest: 3wWWvaReqan3ZmXphwhcp4uXhJDRz2UfQAqvnytzjP3F                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xed18463e3622bc285de5f78d9a6384300b916d70428399bed9c980638570a5ef                                                                                                                                                                                                       │
│  │ Sender: 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa                                                                                                                                                                                                         │
│  │ Owner: Shared( 525713676 )                                                                                                                                                                                                                                                         │
│  │ ObjectType: 0x70071999007b74942a03cc615266cdb7f320212d5b91b4ff2003c0455fdd4723::myswap::BankDryan07<0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD, 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET>  │
│  │ Version: 525713683                                                                                                                                                                                                                                                                 │
│  │ Digest: D31HYY1WxVQsRQ28NfjedapYPACqYYxTKeWLehd5z7vo                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -902912                                                                                         │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xrmb_facuet::XRMB_FACUET  │
│  │ Amount: 911909999998                                                                                    │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x317248bebd4230341a60cc1bfb855605f0828d2a05e6a2c9aaf172122f51defa )           │
│  │ CoinType: 0xe7194fd262ad3f6b8df3adf4817eeda0f2a230092934afcc1c41013e83212d4d::xusd::XUSD                │
│  │ Amount: -124919178082                                                                                   │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯