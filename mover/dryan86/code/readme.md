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