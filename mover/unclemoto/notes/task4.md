# Task4

## deploy

```rust
sui client publish --gas-budget 50000000 --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
Successfully verified dependencies on-chain against source.
Transaction Digest: 9VJYGTfcM3eKNW56t2vocQmJ2PbfJJAYGGGwqppbS5PS
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   │
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                                    │
│  │ Version: 88253683                                                                                         │
│  │ Digest: BKdbYFr75oZ4zE8idRNGKa7MR9JjT3BZmBMFMZMPnTNM                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6" │ │
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
│    uu4q6WpDj7YxRGqaMGSjuPJKueyA3KD4U3M22knJ9/G5LxLLUoJHxalxYktMXHIDS2WD1N5/UVKOJhImVpmyCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9VJYGTfcM3eKNW56t2vocQmJ2PbfJJAYGGGwqppbS5PS                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0dd3b596d1da3dab0341ea1a89216b5766e4895cd808e69b3ea175bdfc85ce31                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253684                                                                              │
│  │ Digest: 6AxEeV1iu5HC1PUFxPSwNEjNuUL7ax3axG22SsL7k5Hx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5d48c508be45b2d92e78dabbc8d7862d8239f46cae3471291eb531748592f738                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8WBo6yUtVte6HPEt6cXMiZrMrToNUGGYrzGWEiusViZD                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253684                                                                              │
│  │ Digest: BvNp6GntD2bxd7hX7bBWrRXs84CAakvQw72rJjgapHAB                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253684                                                                              │
│  │ Digest: BvNp6GntD2bxd7hX7bBWrRXs84CAakvQw72rJjgapHAB                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11141600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    F7xyF9rjEwcEUrfHNQwrPeF7fVngiUJD3vAcWThZJ6Gr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0dd3b596d1da3dab0341ea1a89216b5766e4895cd808e69b3ea175bdfc85ce31                  │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 88253684                                                                             │
│  │ Digest: 6AxEeV1iu5HC1PUFxPSwNEjNuUL7ax3axG22SsL7k5Hx                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                  │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 88253684                                                                             │
│  │ Digest: BvNp6GntD2bxd7hX7bBWrRXs84CAakvQw72rJjgapHAB                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x5d48c508be45b2d92e78dabbc8d7862d8239f46cae3471291eb531748592f738                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 8WBo6yUtVte6HPEt6cXMiZrMrToNUGGYrzGWEiusViZD                                          │
│  │ Modules: rock_paper_scissors                                                                  │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10913480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## play

```rust
sui client call --gas-budget 5000000 --package 0x5d48c508be45b2d92e78dabbc8d7862d8239f46cae3471291eb531748592f738 --module rock_paper_scissors --function play --args 0 0x6
Transaction Digest: 8CWxLqUqPM19CdYKLGPYSWdovhtBkrjBodn1av63Mpwu
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                      │
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                   │
│ Gas Budget: 5000000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                       │
│  │ Version: 88253684                                                                            │
│  │ Digest: BvNp6GntD2bxd7hX7bBWrRXs84CAakvQw72rJjgapHAB                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u8, Value: 0                                                            │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    rock_paper_scissors                                                │            │
│ │  │ Package:   0x5d48c508be45b2d92e78dabbc8d7862d8239f46cae3471291eb531748592f738 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    x5Po9ariCnxLXeMa6NuBkAC7zZNctll2/Yg60ibxtIjN+BDF5xh7wvPKGAHpnlQfg10w3c3IdypwWaC6mSE5Cw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8CWxLqUqPM19CdYKLGPYSWdovhtBkrjBodn1av63Mpwu                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253685                                                                              │
│  │ Digest: 9kS7KZsjpcyg6eB3svw6yyvkMzS9t7rCPpshEc3jUj6s                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 31330228                                                                              │
│  │ Digest: EHUycr66GC6m2p9n8n2vXD7DTPDV9NiesN3Vbte3bNN2                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253685                                                                              │
│  │ Digest: 9kS7KZsjpcyg6eB3svw6yyvkMzS9t7rCPpshEc3jUj6s                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8K7Q45eFZ339wQhqHtvqt6dCa6iUJsAJAAfiQubtpnKF                                                   │
│    9VJYGTfcM3eKNW56t2vocQmJ2PbfJJAYGGGwqppbS5PS                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮    
│ Transaction Block Events                                                                                                 │    
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤    
│  ┌──                                                                                                                     │    
│  │ EventID: 8CWxLqUqPM19CdYKLGPYSWdovhtBkrjBodn1av63Mpwu:0                                                               │    
│  │ PackageID: 0x5d48c508be45b2d92e78dabbc8d7862d8239f46cae3471291eb531748592f738                                         │    
│  │ Transaction Module: rock_paper_scissors                                                                               │    
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                            │    
│  │ EventType: 0x5d48c508be45b2d92e78dabbc8d7862d8239f46cae3471291eb531748592f738::rock_paper_scissors::GamingResultEvent │    
│  │ ParsedJSON:                                                                                                           │    
│  │   ┌─────────────────┬───────┐                                                                                         │    
│  │   │ computer_choice │ paper │                                                                                         │    
│  │   ├─────────────────┼───────┤                                                                                         │    
│  │   │ is_win          │ true  │                                                                                         │    
│  │   ├─────────────────┼───────┤                                                                                         │    
│  │   │ result          │ Win   │                                                                                         │    
│  │   ├─────────────────┼───────┤                                                                                         │    
│  │   │ your_choice     │ rock  │                                                                                         │    
│  │   └─────────────────┴───────┘                                                                                         │    
│  └──                                                                                                                     │    
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯    
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                  │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 88253685                                                                             │
│  │ Digest: 9kS7KZsjpcyg6eB3svw6yyvkMzS9t7rCPpshEc3jUj6s                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -759880                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
