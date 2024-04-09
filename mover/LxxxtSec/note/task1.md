# Deploy

```
lxxxt@lxxxt-None:~/桌面/Sui Move/hello_move$ sui client publish --gas-budget 300000000
UPDATING GIT DEPENDENCY https://gitee.com/WGB5445/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Transaction Digest: 7LSwYn8t1tauBG7dXR3ChMharYVZujSkLp897vdnG41S
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                                   │
│ Gas Owner: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                                │
│ Gas Budget: 300000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                                    │
│  │ Version: 719224                                                                                           │
│  │ Digest: 5nHxt4sqEgT7p314JrVmGfqnkMJHtkoyKLftkii7BR11                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813" │ │
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
│    aUk83upnW6uKSAEqE6dJDX7cPDt+GftKuDfIxgfFYDi74JtooxOOU1o8FfVr56e8bh7lvM19zsngbiOwC45SDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7LSwYn8t1tauBG7dXR3ChMharYVZujSkLp897vdnG41S                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 332                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x24d6c193ba8cddd2493eb62743b597b5ad232198c3022566c1f6c56c6adf6ddd                         │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ Version: 719225                                                                                │
│  │ Digest: CZx8Ebt4CJ5ki8me44BkXPhSAkcaQYNQzgY1z6Sgs7uZ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4f94ef664be833706863295256418d66485cd9f6fc80a464087ee17b1b4744ca                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: J3SiVxTmAPze7u54jSwGdTyjaqVYZgeKPpxibPWCPvkq                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                         │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ Version: 719225                                                                                │
│  │ Digest: Apm4Bx2pGYvybo6sNCQN67gP5vPBeaniRsN95AHzed2n                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                         │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ Version: 719225                                                                                │
│  │ Digest: Apm4Bx2pGYvybo6sNCQN67gP5vPBeaniRsN95AHzed2n                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7790000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    HFczSpsdToDKJVG86vnL3kvQYp2Fw6mjwMhkycgRoSK1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x24d6c193ba8cddd2493eb62743b597b5ad232198c3022566c1f6c56c6adf6ddd                  │
│  │ Sender: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                    │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 719225                                                                               │
│  │ Digest: CZx8Ebt4CJ5ki8me44BkXPhSAkcaQYNQzgY1z6Sgs7uZ                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                  │
│  │ Sender: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                    │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 719225                                                                               │
│  │ Digest: Apm4Bx2pGYvybo6sNCQN67gP5vPBeaniRsN95AHzed2n                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x4f94ef664be833706863295256418d66485cd9f6fc80a464087ee17b1b4744ca                 │
│  │ Version: 1                                                                                    │
│  │ Digest: J3SiVxTmAPze7u54jSwGdTyjaqVYZgeKPpxibPWCPvkq                                          │
│  │ Modules: hello_move                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7811880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

# Call Function

```
lxxxt@lxxxt-None:~/桌面/Sui Move/hello_move$ sui client call --function mint --module hello_move --package $PACKAGE_ID --gas-budget 300000000
Transaction Digest: HPkjH3rSwrkgd39skHt6CLRwhqSSAkJSZR4TbjkLSogW
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                  │
│ Gas Owner: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813               │
│ Gas Budget: 300000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                   │
│  │ Version: 719225                                                                          │
│  │ Digest: Apm4Bx2pGYvybo6sNCQN67gP5vPBeaniRsN95AHzed2n                                     │
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
│ │  │ Package:   0x4f94ef664be833706863295256418d66485cd9f6fc80a464087ee17b1b4744ca │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    3rjq4l6JBrCSkYpGZffHcb++74C9em7VdTGc/uORa2Zc2c3jRqx9DabPA1v8s1jiYT4sQbTWuGeUxf91yRpYAw== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HPkjH3rSwrkgd39skHt6CLRwhqSSAkJSZR4TbjkLSogW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 332                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e329bed2e9a1a8b777b7bf35157ffb4f4fdb3c41088d496a07bf002a669cb68                         │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ Version: 719226                                                                                │
│  │ Digest: DUx8aHXJDjgWx7RDcgeNu5vem1xD5fYtmow6WSGLN2i4                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                         │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ Version: 719226                                                                                │
│  │ Digest: DwXxsF85qjCQu5ra5RuGnVmKPRUSE81ped2XY9a7J1Pv                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                         │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ Version: 719226                                                                                │
│  │ Digest: DwXxsF85qjCQu5ra5RuGnVmKPRUSE81ped2XY9a7J1Pv                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2470000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7LSwYn8t1tauBG7dXR3ChMharYVZujSkLp897vdnG41S                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x8e329bed2e9a1a8b777b7bf35157ffb4f4fdb3c41088d496a07bf002a669cb68                                 │
│  │ Sender: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                                   │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )                │
│  │ ObjectType: 0x4f94ef664be833706863295256418d66485cd9f6fc80a464087ee17b1b4744ca::hello_move::HelloMoveObject  │
│  │ Version: 719226                                                                                              │
│  │ Digest: DUx8aHXJDjgWx7RDcgeNu5vem1xD5fYtmow6WSGLN2i4                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0ed0d3998f3b7def50fd2fc4df77b5e0cc8193e004aeb06bb2390d0c5899eb01                                 │
│  │ Sender: 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813                                   │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 719226                                                                                              │
│  │ Digest: DwXxsF85qjCQu5ra5RuGnVmKPRUSE81ped2XY9a7J1Pv                                                         │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x57712cdd1dc723f19fe6bfd1daeac54215821380602d965e5460d23cee350813 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2491880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

