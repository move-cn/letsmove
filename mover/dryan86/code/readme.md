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