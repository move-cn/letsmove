# sui client publish --skip-fetch-latest-git-deps

```cmake

 sui client addresses
╭────────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias              │ address                                                            │ active address │
├────────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ wonderful-sapphire │ 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d │ *              │
│ thirsty-sphene     │ 0xc031d15512730d0fcae351f2462076fdcbe95e5381ff574186fa1128ef498394 │                │
╰────────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯

```



```cmake
Successfully verified dependencies on-chain against source.
Transaction Digest: CbwmYEeVotCzNjqdhEZr7zLXSyMwpQfoDFzeri9kaadQ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                   │
│ Gas Owner: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                │
│ Gas Budget: 30842400 MIST                                                                                    │
│ Gas Price: 757 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                                    │
│  │ Version: 320906968                                                                                        │
│  │ Digest: 6XMV2MykRkDjJVq5sJxeLhqoTBNMjgDnsyY8x7tvMoz4                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d" │ │
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
│    cCK2yCgSHcD62FkOUMVV7paQ2La0G4js0IJzOwhV5un2Q2/ZQ23xRbIz5Wh1MSOVmtOljmS/gTqvG/klmIIpAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CbwmYEeVotCzNjqdhEZr7zLXSyMwpQfoDFzeri9kaadQ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 491                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Owner: Shared( 320906969 )                                                                     │
│  │ Version: 320906969                                                                             │
│  │ Digest: 25eNH1umLDVzqcdsC12QsNKakBSFJ4UQRM9VKghnDih3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x34ab82710ebe196c657e8da4e47fa066cefb50b96f299bbec4846070cec00dc7                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906969                                                                             │
│  │ Digest: HqkCrmCgtKfo3adfo1c7RSaU6vZSwTvkhPdxkrTrHTcp                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x35531c0ba146108be1f8e540809e80e235e864e7c0def000d97a85651766c4f6                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906969                                                                             │
│  │ Digest: 44FacCYov1jBMH3ZaTyMFtKzVvvcHojKLyaBa9ZvAmRH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5bf48bc24676c8bf91cb24ba34e23a0f2fa130565c82b0a679c93fa272a70b34                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 320906969                                                                             │
│  │ Digest: H8hAyCD2gNknKNWFKyiAGACKqqfbPS6pYsSzy6WUhwQF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 320906969                                                                             │
│  │ Digest: 3XohcY42BURarvruEoXYvTBgmFKAPQwbcFbbX3GqYK85                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: B4QdJTUXx2mhNnai8xnab71JH5fsKKbWA4mamiZ5bbFt                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906969                                                                             │
│  │ Digest: 5mLjjij1mPTZbdHrEHEjASp6Qdhn5WVxiXMqtMw1VxrN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906969                                                                             │
│  │ Digest: 5mLjjij1mPTZbdHrEHEjASp6Qdhn5WVxiXMqtMw1VxrN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 29328400 MIST                                                                    │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7xVipyUK46Pj6XFoAeeKXYMeHjgGXEvHaNB3eCvHKHvr                                                   │
│    GT5A5rSU12oLB24YdjTxq5Yeco15AGkorc789td4EW2i                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                                                     │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                                       │
│  │ Owner: Shared( 320906969 )                                                                                                       │
│  │ ObjectType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game                                 │
│  │ Version: 320906969                                                                                                               │
│  │ Digest: 25eNH1umLDVzqcdsC12QsNKakBSFJ4UQRM9VKghnDih3                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x34ab82710ebe196c657e8da4e47fa066cefb50b96f299bbec4846070cec00dc7                                                     │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                                       │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND>   │
│  │ Version: 320906969                                                                                                               │
│  │ Digest: HqkCrmCgtKfo3adfo1c7RSaU6vZSwTvkhPdxkrTrHTcp                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x35531c0ba146108be1f8e540809e80e235e864e7c0def000d97a85651766c4f6                                                     │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                                       │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                                    │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                             │
│  │ Version: 320906969                                                                                                               │
│  │ Digest: 44FacCYov1jBMH3ZaTyMFtKzVvvcHojKLyaBa9ZvAmRH                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x5bf48bc24676c8bf91cb24ba34e23a0f2fa130565c82b0a679c93fa272a70b34                                                     │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND>  │
│  │ Version: 320906969                                                                                                               │
│  │ Digest: H8hAyCD2gNknKNWFKyiAGACKqqfbPS6pYsSzy6WUhwQF                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799                                                     │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GameCap                              │
│  │ Version: 320906969                                                                                                               │
│  │ Digest: 3XohcY42BURarvruEoXYvTBgmFKAPQwbcFbbX3GqYK85                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                                                     │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                                       │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 320906969                                                                                                               │
│  │ Digest: 5mLjjij1mPTZbdHrEHEjASp6Qdhn5WVxiXMqtMw1VxrN                                                                             │
│  └──                                                                                                                                │
│ Published Objects:                                                                                                                  │
│  ┌──                                                                                                                                │
│  │ PackageID: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927                                                    │
│  │ Version: 1                                                                                                                       │
│  │ Digest: B4QdJTUXx2mhNnai8xnab71JH5fsKKbWA4mamiZ5bbFt                                                                             │
│  │ Modules: guess_hand                                                                                                              │
│  └──                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -29107280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

# 第一次游戏  user胜

hash 1:  6HUXejWdjEiYw8mJScbtnACPvqenx9wRG1D7kHwPWz2i



```cmake
 sui client call --package 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 --module guess_hand --function choose_hand --args 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 rock 0x6
Transaction Digest: 6HUXejWdjEiYw8mJScbtnACPvqenx9wRG1D7kHwPWz2i
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                      │
│ Gas Owner: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                   │
│ Gas Budget: 3929204 MIST                                                                        │
│ Gas Price: 757 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                       │
│  │ Version: 320906969                                                                           │
│  │ Digest: 5mLjjij1mPTZbdHrEHEjASp6Qdhn5WVxiXMqtMw1VxrN                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 │ │
│ │ 1   Shared Object    ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "rock"                                               │ │
│ │ 3   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  choose_hand                                                        │            │
│ │  │ Module:    guess_hand                                                         │            │
│ │  │ Package:   0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    HPYUeP59BkqGA2L+JYSwjcyIeJS/ijmMjZgTWY3ewN4WUe5tFDdtoB0diYbiNGH42d1Stdww/5XLz7s9FbgKAQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6HUXejWdjEiYw8mJScbtnACPvqenx9wRG1D7kHwPWz2i                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 491                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb8be47813c231267cf8c1d1ca04a4478d021b20b3816fbed515f23f67ab6efbb                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906970                                                                             │
│  │ Digest: 4tiabneq86xda4zsiTeznF8WDLouuRYvGS3gP4m4Njia                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Owner: Shared( 320906969 )                                                                     │
│  │ Version: 320906970                                                                             │
│  │ Digest: 9VRspQMqkjkNnozxVWXkDGtaMJTHwcz9y8yEwudPGByB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906970                                                                             │
│  │ Digest: JEE7omSEvjK3KbeY74g5CaHBCt4hWRwnsCq8LS1bQWAe                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Version: 320906969                                                                             │
│  │ Digest: 25eNH1umLDVzqcdsC12QsNKakBSFJ4UQRM9VKghnDih3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 65680587                                                                              │
│  │ Digest: CW3Lr1RDWBifwYWAVEHzYxewzMksM78FBJEagN4hXv2a                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906970                                                                             │
│  │ Digest: JEE7omSEvjK3KbeY74g5CaHBCt4hWRwnsCq8LS1bQWAe                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3762000 MIST                                                                     │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 2324916 MIST                                                                   │
│    Non-refundable Storage Fee: 23484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CBn2xMCMXLPMGssiLQthTrojnYbDetjiVTh2jZUDXd1E                                                   │
│    CbwmYEeVotCzNjqdhEZr7zLXSyMwpQfoDFzeri9kaadQ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: 6HUXejWdjEiYw8mJScbtnACPvqenx9wRG1D7kHwPWz2i:0                                                  │
│  │ PackageID: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927                            │
│  │ Transaction Module: guess_hand                                                                           │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                               │
│  │ EventType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game_Finished │
│  │ ParsedJSON:                                                                                              │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                       │
│  │   │ address │ 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d │                       │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                       │
│  │   │ winner  │ user                                                               │                       │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                       │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xb8be47813c231267cf8c1d1ca04a4478d021b20b3816fbed515f23f67ab6efbb                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                            │
│  │ ObjectType: 0x2::coin::Coin<0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND>  │
│  │ Version: 320906970                                                                                                       │
│  │ Digest: 4tiabneq86xda4zsiTeznF8WDLouuRYvGS3gP4m4Njia                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Shared( 320906969 )                                                                                               │
│  │ ObjectType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game                         │
│  │ Version: 320906970                                                                                                       │
│  │ Digest: 9VRspQMqkjkNnozxVWXkDGtaMJTHwcz9y8yEwudPGByB                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 320906970                                                                                                       │
│  │ Digest: JEE7omSEvjK3KbeY74g5CaHBCt4hWRwnsCq8LS1bQWAe                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2194084                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )         │
│  │ CoinType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND  │
│  │ Amount: 1000000000                                                                                    │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

# 第二次游戏 robot胜

```cmake
 sui client call --package 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 --module guess_hand --function choose_hand --args 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 rock 0x6
Transaction Digest: FE7qza8uK749g14fGtrNHgk5Z9Vfo5Va3w7FoQfnj6Qk
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                      │
│ Gas Owner: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                   │
│ Gas Budget: 3929204 MIST                                                                        │
│ Gas Price: 757 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                       │
│  │ Version: 320906970                                                                           │
│  │ Digest: JEE7omSEvjK3KbeY74g5CaHBCt4hWRwnsCq8LS1bQWAe                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 │ │
│ │ 1   Shared Object    ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "rock"                                               │ │
│ │ 3   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  choose_hand                                                        │            │
│ │  │ Module:    guess_hand                                                         │            │
│ │  │ Package:   0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    STO+7YZYdCboPSEg/+cauPXOpYcf4LpffWI3DseCjMxYyv6DS2Ch7BXJh1VT/Rfi9Pk/uA+Xa9ZvsQe/R0ytBQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FE7qza8uK749g14fGtrNHgk5Z9Vfo5Va3w7FoQfnj6Qk                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 491                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x36ccc89057d3619666cb270b9957511d73498a8a2ce6e5e45605405c6d7c3fa8                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906971                                                                             │
│  │ Digest: FUw4WY6nY4nuFmtfim9Kn4WFFeXM65DSUkVsSUH8ddQ3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Owner: Shared( 320906969 )                                                                     │
│  │ Version: 320906971                                                                             │
│  │ Digest: 6vkNSBwF2YWagLSzYxzwAP4uzDdtZW9VS5Zo6tZUKy2B                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906971                                                                             │
│  │ Digest: 7NAzTskbeDgfUSYJpCdA6VoSrD62V9TCsPLyW567W65P                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Version: 320906970                                                                             │
│  │ Digest: 9VRspQMqkjkNnozxVWXkDGtaMJTHwcz9y8yEwudPGByB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 65710884                                                                              │
│  │ Digest: Gk9NAudVkV4GTty5QjntqCccy4NzqnSMPGrjwUaedCkT                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906971                                                                             │
│  │ Digest: 7NAzTskbeDgfUSYJpCdA6VoSrD62V9TCsPLyW567W65P                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3762000 MIST                                                                     │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 2324916 MIST                                                                   │
│    Non-refundable Storage Fee: 23484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6HUXejWdjEiYw8mJScbtnACPvqenx9wRG1D7kHwPWz2i                                                   │
│    CbwmYEeVotCzNjqdhEZr7zLXSyMwpQfoDFzeri9kaadQ                                                   │
│    GQJo2QHkXDNGBYNcyJGjhow5CkDpfs1mDUrxxa9PC5L2                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: FE7qza8uK749g14fGtrNHgk5Z9Vfo5Va3w7FoQfnj6Qk:0                                                  │
│  │ PackageID: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927                            │
│  │ Transaction Module: guess_hand                                                                           │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                               │
│  │ EventType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game_Finished │
│  │ ParsedJSON:                                                                                              │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                       │
│  │   │ address │ 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d │                       │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                       │
│  │   │ winner  │ robot                                                              │                       │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                       │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x36ccc89057d3619666cb270b9957511d73498a8a2ce6e5e45605405c6d7c3fa8                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                            │
│  │ ObjectType: 0x2::coin::Coin<0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND>  │
│  │ Version: 320906971                                                                                                       │
│  │ Digest: FUw4WY6nY4nuFmtfim9Kn4WFFeXM65DSUkVsSUH8ddQ3                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Shared( 320906969 )                                                                                               │
│  │ ObjectType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game                         │
│  │ Version: 320906971                                                                                                       │
│  │ Digest: 6vkNSBwF2YWagLSzYxzwAP4uzDdtZW9VS5Zo6tZUKy2B                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 320906971                                                                                                       │
│  │ Digest: 7NAzTskbeDgfUSYJpCdA6VoSrD62V9TCsPLyW567W65P                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2194084                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )         │
│  │ CoinType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND  │
│  │ Amount: 1000000000                                                                                    │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
PS D:\web3\sui\letsmove\mover\june5753\code\task4\guess_hand>

```



# 第三次游戏 玩家胜

```cmake
sui client call --package 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 --module guess_hand --function choose_hand --args 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 rock 0x6
Transaction Digest: 5yiZMNGSQ2ENrth8ojUK6JTgzBGPPfTn4tyN1aQ5KBbH
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                      │
│ Gas Owner: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                   │
│ Gas Budget: 3929204 MIST                                                                        │
│ Gas Price: 757 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                       │
│  │ Version: 320906971                                                                           │
│  │ Digest: 7NAzTskbeDgfUSYJpCdA6VoSrD62V9TCsPLyW567W65P                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 │ │
│ │ 1   Shared Object    ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "rock"                                               │ │
│ │ 3   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  choose_hand                                                        │            │
│ │  │ Module:    guess_hand                                                         │            │
│ │  │ Package:   0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    G67VPp/rpmH54xBpXnL0l8pLpCfCX3FUaDb06VaHERb5iCVw9gYcJADRRQU9jqCFP2XT22czN31QSS2sTQvoDg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5yiZMNGSQ2ENrth8ojUK6JTgzBGPPfTn4tyN1aQ5KBbH                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 491                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0074013da9fafb951f802bca8f2cc8c2f3f1840e03fd5d3849bf8a164c58e252                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906972                                                                             │
│  │ Digest: HyrEVg4bbM6cz81z4on5dMSBDqGYq6f5HYzjEPpRGe4P                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Owner: Shared( 320906969 )                                                                     │
│  │ Version: 320906972                                                                             │
│  │ Digest: 3dX2TpSWJQA6nngJRQU75VZps1fsTVMQNdttaxUx6H4i                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906972                                                                             │
│  │ Digest: BprzUggMkR21mwUjPmhUhWMPFHQjKxDTZuMEEM3xXFjz                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                         │
│  │ Version: 320906971                                                                             │
│  │ Digest: 6vkNSBwF2YWagLSzYxzwAP4uzDdtZW9VS5Zo6tZUKy2B                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 65715117                                                                              │
│  │ Digest: BkPcLLmqscVfJyLxQzrxRgHQbBNEnE2g6Jrhvs22G7wz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                         │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )  │
│  │ Version: 320906972                                                                             │
│  │ Digest: BprzUggMkR21mwUjPmhUhWMPFHQjKxDTZuMEEM3xXFjz                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3762000 MIST                                                                     │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 2324916 MIST                                                                   │
│    Non-refundable Storage Fee: 23484 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    85irxXiAV6AC5foe4MTEdc4WP9PUPoQVver68LRdKevC                                                   │
│    CbwmYEeVotCzNjqdhEZr7zLXSyMwpQfoDFzeri9kaadQ                                                   │
│    FE7qza8uK749g14fGtrNHgk5Z9Vfo5Va3w7FoQfnj6Qk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: 5yiZMNGSQ2ENrth8ojUK6JTgzBGPPfTn4tyN1aQ5KBbH:0                                                  │
│  │ PackageID: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927                            │
│  │ Transaction Module: guess_hand                                                                           │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                               │
│  │ EventType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game_Finished │
│  │ ParsedJSON:                                                                                              │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                       │
│  │   │ address │ 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d │                       │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                       │
│  │   │ winner  │ user                                                               │                       │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                       │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x0074013da9fafb951f802bca8f2cc8c2f3f1840e03fd5d3849bf8a164c58e252                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                            │
│  │ ObjectType: 0x2::coin::Coin<0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND>  │
│  │ Version: 320906972                                                                                                       │
│  │ Digest: HyrEVg4bbM6cz81z4on5dMSBDqGYq6f5HYzjEPpRGe4P                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Shared( 320906969 )                                                                                               │
│  │ ObjectType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::Game                         │
│  │ Version: 320906972                                                                                                       │
│  │ Digest: 3dX2TpSWJQA6nngJRQU75VZps1fsTVMQNdttaxUx6H4i                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x3e850c7ced14016f7c26631beec84a4fb7bd5cda1bd6f17db07325969f0cc230                                             │
│  │ Sender: 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d                                               │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 320906972                                                                                                       │
│  │ Digest: BprzUggMkR21mwUjPmhUhWMPFHQjKxDTZuMEEM3xXFjz                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2194084                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d )         │
│  │ CoinType: 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927::guess_hand::GUESS_HAND  │
│  │ Amount: 1000000000                                                                                    │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```


