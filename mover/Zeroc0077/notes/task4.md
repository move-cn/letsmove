# Task4

Deploy:
```bash
❯ sui client publish --gas-budget 50000000 .
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING game
Successfully verified dependencies on-chain against source.
Transaction Digest: DRUXGdf5jGEZiZUM3u3jvMQUFSQL27bsn36gu6mfLki7
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                                    │
│  │ Version: 81601569                                                                                         │
│  │ Digest: A4VqU2AvjCGLJvR91qc99PVphLGVjdVp3UNGL8Ruh3MZ                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6" │ │
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
│    35XOes9dVZ1kLHw1WrtsdhtghlTE2Qe9n6LohpAs62vQbHs13KE2EYLRjWx5vFAESjRwdr4YnXgI9ETdDyikAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DRUXGdf5jGEZiZUM3u3jvMQUFSQL27bsn36gu6mfLki7                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 350                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81601570                                                                              │
│  │ Digest: 7oHcCPw32sqV5jS2Rb6dszeqiL7qFNoQYJ8x9GuhCKP6                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5ddc5cc36252f9f4f73987a1151be919a7ff98db8610d180cba08ee86463cd70                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601570                                                                              │
│  │ Digest: AiKjaKn4CThXEyFhBJriPNNB3Xqt3i5c5iiK4YjLMH7B                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5P9cxtBGtPoDe7eYWBcrVdyjwaiKRcjQk7weRC2sNxn9                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601570                                                                              │
│  │ Digest: GHqRJKFWTfLsAVPjfnUqw3QiRWa6iVjCMMcusNLiATM9                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601570                                                                              │
│  │ Digest: GHqRJKFWTfLsAVPjfnUqw3QiRWa6iVjCMMcusNLiATM9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 20368000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4BxXHDfokMiqPzuSe8YfXM5PVrAQojyaCQHnFKqHPR2f                                                   │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Shared                                                                                     │
│  │ ObjectType: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df::mygame::GamePool  │
│  │ Version: 81601570                                                                                 │
│  │ Digest: 7oHcCPw32sqV5jS2Rb6dszeqiL7qFNoQYJ8x9GuhCKP6                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x5ddc5cc36252f9f4f73987a1151be919a7ff98db8610d180cba08ee86463cd70                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0x2::package::UpgradeCap                                                              │
│  │ Version: 81601570                                                                                 │
│  │ Digest: AiKjaKn4CThXEyFhBJriPNNB3Xqt3i5c5iiK4YjLMH7B                                              │
│  └──                                                                                                 │
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 81601570                                                                                 │
│  │ Digest: GHqRJKFWTfLsAVPjfnUqw3QiRWa6iVjCMMcusNLiATM9                                              │
│  └──                                                                                                 │
│ Published Objects:                                                                                   │
│  ┌──                                                                                                 │
│  │ PackageID: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df                     │
│  │ Version: 1                                                                                        │
│  │ Digest: 5P9cxtBGtPoDe7eYWBcrVdyjwaiKRcjQk7weRC2sNxn9                                              │
│  │ Modules: mygame, random                                                                           │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20139880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Participate:
```bash
❯ sui client call --package 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df --module mygame --function participate --args 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4 0 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976 --gas-budget 50000000
Transaction Digest: 6UJtBF5qSDQDD9vRnTxkRB9gKW6QfjphiWqMDcVURXY2
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                      │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                   │
│ Gas Budget: 50000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                       │
│  │ Version: 81601570                                                                            │
│  │ Digest: GHqRJKFWTfLsAVPjfnUqw3QiRWa6iVjCMMcusNLiATM9                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4 │ │
│ │ 1   Pure Arg: Type: u64, Value: "0"                                                         │ │
│ │ 2   Imm/Owned Object ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  participate                                                        │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    81aVS1X9O3ktt90EoBmFvbk2sFjLnAh9SYH+Np2Tx1COz+MmPyeNyWdVtARLJEke5t+bNgDmTEuSWQKujOPuDg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6UJtBF5qSDQDD9vRnTxkRB9gKW6QfjphiWqMDcVURXY2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 350                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3bc8c0d4b62734e8ca7b43210b6ac5d5e07ddaa20fd52006b17dfea52dda0019                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601571                                                                              │
│  │ Digest: 5z5rF34rEXV9vndG5hMhZfuqHULVwo7tt9cJEomh7DRr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81601571                                                                              │
│  │ Digest: EiWZ1gm3aJD7Yr85pwekSNyc8CVkQ86BMKmXiZxWghnt                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601571                                                                              │
│  │ Digest: Dg5WLXTxvjWApnsaa5EGpBAwSZcdJjCShRvf9YFLie6M                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601571                                                                              │
│  │ Digest: 2XyHkgpYZGPtfUUyAZ8Y7FvjguXmKX6qjfF7rzHBgfbh                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                         │
│  │ Version: 81601570                                                                              │
│  │ Digest: 7oHcCPw32sqV5jS2Rb6dszeqiL7qFNoQYJ8x9GuhCKP6                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601571                                                                              │
│  │ Digest: Dg5WLXTxvjWApnsaa5EGpBAwSZcdJjCShRvf9YFLie6M                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4947600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3543804 MIST                                                                   │
│    Non-refundable Storage Fee: 35796 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DRUXGdf5jGEZiZUM3u3jvMQUFSQL27bsn36gu6mfLki7                                                   │
│    EsRzt2aN3c1X6CqFbZCTL46WFr9UhAPA6gPJnrjwaAqx                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x3bc8c0d4b62734e8ca7b43210b6ac5d5e07ddaa20fd52006b17dfea52dda0019                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df::mygame::Mora      │
│  │ Version: 81601571                                                                                 │
│  │ Digest: 5z5rF34rEXV9vndG5hMhZfuqHULVwo7tt9cJEomh7DRr                                              │
│  └──                                                                                                 │
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Shared                                                                                     │
│  │ ObjectType: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df::mygame::GamePool  │
│  │ Version: 81601571                                                                                 │
│  │ Digest: EiWZ1gm3aJD7Yr85pwekSNyc8CVkQ86BMKmXiZxWghnt                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 81601571                                                                                 │
│  │ Digest: Dg5WLXTxvjWApnsaa5EGpBAwSZcdJjCShRvf9YFLie6M                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 81601571                                                                                 │
│  │ Digest: 2XyHkgpYZGPtfUUyAZ8Y7FvjguXmKX6qjfF7rzHBgfbh                                              │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2153797                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Battle:
```bash
❯ sui client call --package 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df --module mygame --function battle --args 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4 0x3bc8c0d4b62734e8ca7b43210b6ac5d5e07ddaa20fd52006b17dfea52dda0019 --gas-budget 5000000 
Transaction Digest: Gopknqueoiq8eRvGKwz5Lf2B2odeVhpcSUyRjJ5GiGtK
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                      │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                   │
│ Gas Budget: 5000000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                       │
│  │ Version: 81601572                                                                            │
│  │ Digest: 2aBQcHQymjZSPao18yRywQFhukBwmsT67W13PNwHiqsD                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4 │ │
│ │ 1   Imm/Owned Object ID: 0x3bc8c0d4b62734e8ca7b43210b6ac5d5e07ddaa20fd52006b17dfea52dda0019 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  battle                                                             │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    6hMbslJ0GMG8Mo8AKJpXzGDlnHR7quV3q6iA+KOzE9Y/yaxuP6C2kRqa3bJOFzEWThhQL1mbbdl7yzJ6MGz1Bw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Gopknqueoiq8eRvGKwz5Lf2B2odeVhpcSUyRjJ5GiGtK                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 350                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81601573                                                                              │
│  │ Digest: 2mqneuY6mmxhexKzMHzJMtL8e7qF7SArMfZjc9wCB9Sn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3bc8c0d4b62734e8ca7b43210b6ac5d5e07ddaa20fd52006b17dfea52dda0019                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601573                                                                              │
│  │ Digest: CosUKyChLjcP8FmL5grEoHKRLCH1XMKjrEiZw5Ec7mLu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601573                                                                              │
│  │ Digest: 3bJwEJ28Dda3PxYmeRwPbJyvTRUtQjmSyJmkdREhN18A                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                         │
│  │ Version: 81601572                                                                              │
│  │ Digest: 66aBwdskNucaf3E1h3ey3pYnV8ARnudS72t7UEnvMi7J                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601573                                                                              │
│  │ Digest: 3bJwEJ28Dda3PxYmeRwPbJyvTRUtQjmSyJmkdREhN18A                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3959600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3920004 MIST                                                                   │
│    Non-refundable Storage Fee: 39596 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DRUXGdf5jGEZiZUM3u3jvMQUFSQL27bsn36gu6mfLki7                                                   │
│    H69EW3BXqxHDBFHTCFx4kK5DFkK6CqgvogivhnUfDnLh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x06f75212391b962a97f1ed8f3af1c6af549c64d0ed59db15ab36a471bb4fbfc4                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Shared                                                                                     │
│  │ ObjectType: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df::mygame::GamePool  │
│  │ Version: 81601573                                                                                 │
│  │ Digest: 2mqneuY6mmxhexKzMHzJMtL8e7qF7SArMfZjc9wCB9Sn                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x3bc8c0d4b62734e8ca7b43210b6ac5d5e07ddaa20fd52006b17dfea52dda0019                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0xc649c7e67d2d8aa8781f1f418123ed9aed2853360e7cc16e54b206746e6e23df::mygame::Mora      │
│  │ Version: 81601573                                                                                 │
│  │ Digest: CosUKyChLjcP8FmL5grEoHKRLCH1XMKjrEiZw5Ec7mLu                                              │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                      │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                        │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 81601573                                                                                 │
│  │ Digest: 3bJwEJ28Dda3PxYmeRwPbJyvTRUtQjmSyJmkdREhN18A                                              │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -789596                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```