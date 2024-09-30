# Task3

```bash
> sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
```

```bash
> sui client publish --gas-budget 50000000 --skip-dependency-verification
[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Skipping dependency verification
Transaction Digest: 6gGdrHdhwk6BAme6CK8eKczxep6xUh9FBrAUgNHn7wT9
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 853                                                                                              │
│  │ Digest: JpfZh58ZjzBhcTfz5jAuQ6q5qrGFYhz2VfL7ZTbzVfE                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
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
│    ka8xnOBz+kP1s9cu6m2cgnugMhj/RUUq3+DZPmwnrgMNS2w9CIBRo1TRws75diaDJ6WFyvZZUHn3xSRXajGcDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6gGdrHdhwk6BAme6CK8eKczxep6xUh9FBrAUgNHn7wT9                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 927                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: E1MqxDicekdSCefJbuNDhQjGq6HJgciqeRFjt7DBkFcj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xde34dbe6bc485f2fcb6797fa5725dddab94f4a8f390e72613fb8885efd433d89                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 854                                                                                   │
│  │ Digest: yt8mBbki5KsN2zdXRxwVVJrUBdVZf3CyZcCLPtSJWWb                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 854                                                                                   │
│  │ Digest: 8VBPHbPLnangzZUQcxor2F9ETs9iSWsfba7BQgXo4BGq                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 854                                                                                   │
│  │ Digest: 8VBPHbPLnangzZUQcxor2F9ETs9iSWsfba7BQgXo4BGq                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11172000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4DiiEfmtUGx1Hke6B7xcfMbSxuW3QNmBgYtfwamUmQ3R                                                   │
│    7Ukrc5GqdFqTA41wvWgreCdHn2vRLfgQ3YMFkdks72Vk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xde34dbe6bc485f2fcb6797fa5725dddab94f4a8f390e72613fb8885efd433d89                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 854                                                                                  │
│  │ Digest: yt8mBbki5KsN2zdXRxwVVJrUBdVZf3CyZcCLPtSJWWb                                           │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 854                                                                                  │
│  │ Digest: 8VBPHbPLnangzZUQcxor2F9ETs9iSWsfba7BQgXo4BGq                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25                 │
│  │ Version: 1                                                                                    │
│  │ Digest: E1MqxDicekdSCefJbuNDhQjGq6HJgciqeRFjt7DBkFcj                                          │
│  │ Modules: move_nft                                                                             │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -11193880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --function mint_to_sender --module move_nft --package 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25 --gas-budget 4000000 --args MoveNFT001 "First MoveNFT in the World" "https://avatars.githubusercontent.com/u/4446580?v=4" 

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: 5UTsKGLqrDiGMfdXcjwrPBz63g7B773C1difksKtAU6h
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                       │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│ Gas Budget: 4000000 MIST                                                                         │
│ Gas Price: 1000 MIST                                                                             │
│ Gas Payment:                                                                                     │
│  ┌──                                                                                             │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                        │
│  │ Version: 854                                                                                  │
│  │ Digest: 8VBPHbPLnangzZUQcxor2F9ETs9iSWsfba7BQgXo4BGq                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Transaction Kind: Programmable                                                                   │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "MoveNFT001"                                          │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "First MoveNFT in the World"                          │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/u/4446580?v=4" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮             │
│ │ Commands                                                                         │             │
│ ├──────────────────────────────────────────────────────────────────────────────────┤             │
│ │ 0  MoveCall:                                                                     │             │
│ │  ┌                                                                               │             │
│ │  │ Function:  mint_to_sender                                                     │             │
│ │  │ Module:    move_nft                                                           │             │
│ │  │ Package:   0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25 │             │
│ │  │ Arguments:                                                                    │             │
│ │  │   Input  0                                                                    │             │
│ │  │   Input  1                                                                    │             │
│ │  │   Input  2                                                                    │             │
│ │  └                                                                               │             │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯             │
│                                                                                                  │
│ Signatures:                                                                                      │
│    FeR4Sv8VaG9Q+Ghn9Zs2df+tyLg0+6IjY6o+2DYRdvnjAZS+RX0aEde61dDkKhpDgMcYy154GYkT2w2ZBkRrBg==      │
│                                                                                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5UTsKGLqrDiGMfdXcjwrPBz63g7B773C1difksKtAU6h                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 928                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 855                                                                                   │
│  │ Digest: GftRuuudFr5RrJU78enydf3R3eoGcSGhTG3WhRHrPJqE                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 855                                                                                   │
│  │ Digest: EK5bYyM3jv8TVpYQegrNLgQd44apxnCFcdjyVQorhrWu                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 855                                                                                   │
│  │ Digest: EK5bYyM3jv8TVpYQegrNLgQd44apxnCFcdjyVQorhrWu                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2979200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6gGdrHdhwk6BAme6CK8eKczxep6xUh9FBrAUgNHn7wT9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 5UTsKGLqrDiGMfdXcjwrPBz63g7B773C1difksKtAU6h:0                                                       │
│  │ PackageID: 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25                                 │
│  │ Transaction Module: move_nft                                                                                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                    │
│  │ EventType: 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25::move_nft::MoveNFTTransferEvent │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                          │
│  │   │ creator   │ 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc │                          │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                          │
│  │   │ name      │ MoveNFT001                                                         │                          │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                          │
│  │   │ object_id │ 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561 │                          │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                          │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25::move_nft::MoveNFT  │
│  │ Version: 855                                                                                       │
│  │ Digest: GftRuuudFr5RrJU78enydf3R3eoGcSGhTG3WhRHrPJqE                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 855                                                                                       │
│  │ Digest: EK5bYyM3jv8TVpYQegrNLgQd44apxnCFcdjyVQorhrWu                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3001080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --function transfer --module move_nft --package 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25 --gas-budget 2000000 --args 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: 9sYLffjQf6yqboha4GAktYxRLLiTFGecuxhzrLGCiFzB
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 2000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 855                                                                                              │
│  │ Digest: EK5bYyM3jv8TVpYQegrNLgQd44apxnCFcdjyVQorhrWu                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561              │ │
│ │ 1   Pure Arg: Type: address, Value: "0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    move_nft                                                           │                         │
│ │  │ Package:   0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    CyBapLYYXDUWsUkBCrcPNxRdpC/HG1gPz7FhY2pqhj/020oysx7E3aB53AOV+g+vv2rN9VS07xP3TvhA4X7WAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9sYLffjQf6yqboha4GAktYxRLLiTFGecuxhzrLGCiFzB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 929                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561                         │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )  │
│  │ Version: 856                                                                                   │
│  │ Digest: DbjWMt1PC5bYo9UTwJ5erP7QhJWo8Xwf1Kno1ynBZFwk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 856                                                                                   │
│  │ Digest: B7WPp4dbUPfuozFfjbyFaE7rZYAA7ce7g1aNntWTZ7Ud                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 856                                                                                   │
│  │ Digest: B7WPp4dbUPfuozFfjbyFaE7rZYAA7ce7g1aNntWTZ7Ud                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2979200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2949408 MIST                                                                   │
│    Non-refundable Storage Fee: 29792 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5UTsKGLqrDiGMfdXcjwrPBz63g7B773C1difksKtAU6h                                                   │
│    6gGdrHdhwk6BAme6CK8eKczxep6xUh9FBrAUgNHn7wT9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x02b9a8db18e0ebe512ba89a822ac6a3eb5438034621409509a83f6916fa53561                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )      │
│  │ ObjectType: 0x3d9e898b6486e338c698db7f31048e597b593ceb99d49604c7cdb0bd1b768f25::move_nft::MoveNFT  │
│  │ Version: 856                                                                                       │
│  │ Digest: DbjWMt1PC5bYo9UTwJ5erP7QhJWo8Xwf1Kno1ynBZFwk                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 856                                                                                       │
│  │ Digest: B7WPp4dbUPfuozFfjbyFaE7rZYAA7ce7g1aNntWTZ7Ud                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1029792                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```