# Task5

```bash
sui move build          
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task5
```


```bash
sui client publish --gas-budget 50000000

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task5
Successfully verified dependencies on-chain against source.
Transaction Digest: 99uGLzU8mr1grWb63mRYA49vj4QsmnWBc7enARkyp1hP
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
│  │ Version: 481611                                                                                           │
│  │ Digest: AP9hKNyUYNZA5EB4PJUGGm2KQ1S8SKfZ7y7YcCtteg9                                                       │
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
│    bWSjaFOGqxmRgbjQtCAEARJtmbQWxACy0UjlSnGJuqxxEaGiJaq53HuazVFYPGOHBIqUuRMbg64+gVt89TUiBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 99uGLzU8mr1grWb63mRYA49vj4QsmnWBc7enARkyp1hP                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1132                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: CA1APHuCcR3Un3t6poF7gyaHzxhyayek5xpXUXdxNVij                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe670b91084ff1817fd4dead12daf3830caa9ebe907965f298c7aab1079582eaa                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481612                                                                                │
│  │ Digest: moN7UPkU93Pwu3Lu6k4pYTP8W6i3ku8yEbE5UN4S3br                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481612                                                                                │
│  │ Digest: DaoSJQCpkWCsRpzmmUHgQKZY4XdzG3DhCKtj3mxMkHN2                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481612                                                                                │
│  │ Digest: DaoSJQCpkWCsRpzmmUHgQKZY4XdzG3DhCKtj3mxMkHN2                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 30894000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7Ukrc5GqdFqTA41wvWgreCdHn2vRLfgQ3YMFkdks72Vk                                                   │
│    DKYS6cEF8YDvvTqK2PNssmH28VJ3MzGDHa97QLdegAVA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xe670b91084ff1817fd4dead12daf3830caa9ebe907965f298c7aab1079582eaa                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 481612                                                                               │
│  │ Digest: moN7UPkU93Pwu3Lu6k4pYTP8W6i3ku8yEbE5UN4S3br                                           │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 481612                                                                               │
│  │ Digest: DaoSJQCpkWCsRpzmmUHgQKZY4XdzG3DhCKtj3mxMkHN2                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d                 │
│  │ Version: 1                                                                                    │
│  │ Digest: CA1APHuCcR3Un3t6poF7gyaHzxhyayek5xpXUXdxNVij                                          │
│  │ Modules: move_swap                                                                            │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -30915880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

```bash
sui client balance
[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
╭───────────────────────────────────────────────╮
│ Balance of coins owned by this address        │
├───────────────────────────────────────────────┤
│ ╭───────────────────────────────────────────╮ │
│ │ coin  balance (raw)  balance              │ │
│ ├───────────────────────────────────────────┤ │
│ │ Sui   139909365400   139.90   SUI         │ │
│ │ FC    100            0.00     FAUCET_COIN │ │
│ ╰───────────────────────────────────────────╯ │
╰───────────────────────────────────────────────╯
```

```bash
sui client call --function mint --module mycoin --package 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800 --gas-budget 5000000 --args 0xedf85f5e8c1dabdc44a749ed48b24d36d787982dcb89eefa9d1594cfa3533be7 100 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: 8dhet3gq5adTcNc6DFXcu2bA24vcxk9txaweeUPffUtr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 481607                                                                                           │
│  │ Digest: BqPRPEmJvh1R56DUpLrERauRn1KygXwYezqeG7yUuPwp                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xedf85f5e8c1dabdc44a749ed48b24d36d787982dcb89eefa9d1594cfa3533be7              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    t6Q8gtjmHnc31J0TeXBZvvVXXhOqzQ4QXR3v/TOWHPVt/m59/Eg9Arq0zC2qEmwGHR/hGP1yM1E2lY+Et7akBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8dhet3gq5adTcNc6DFXcu2bA24vcxk9txaweeUPffUtr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1104                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x90ff4bee2326aac8d893518af966c5cc6d381241a319a9c6026c81a9fa19d54c                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481608                                                                                │
│  │ Digest: DUzxeHmV7CcRBukGgwrDJAqVq312jUEmWFxLq7KKQPKn                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481608                                                                                │
│  │ Digest: 7LLeAx4gBrKH3Z3a3Dyw35tZ6yNDd6esDtByz5aD9JH6                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xedf85f5e8c1dabdc44a749ed48b24d36d787982dcb89eefa9d1594cfa3533be7                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481608                                                                                │
│  │ Digest: 2fRoJMc1AxAr9bLNUQc2vxQFTCN7wMXM8EBGHDkc9vr4                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481608                                                                                │
│  │ Digest: 7LLeAx4gBrKH3Z3a3Dyw35tZ6yNDd6esDtByz5aD9JH6                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                                   │
│    EZLNVQd1wq3bHVtH6HftjZPtuDq7XBn6GWNKar5PZYsX                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x90ff4bee2326aac8d893518af966c5cc6d381241a319a9c6026c81a9fa19d54c                                            │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                           │
│  │ ObjectType: 0x2::coin::Coin<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN>         │
│  │ Version: 481608                                                                                                         │
│  │ Digest: DUzxeHmV7CcRBukGgwrDJAqVq312jUEmWFxLq7KKQPKn                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                            │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 481608                                                                                                         │
│  │ Digest: 7LLeAx4gBrKH3Z3a3Dyw35tZ6yNDd6esDtByz5aD9JH6                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xedf85f5e8c1dabdc44a749ed48b24d36d787982dcb89eefa9d1594cfa3533be7                                            │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN>  │
│  │ Version: 481608                                                                                                         │
│  │ Digest: 2fRoJMc1AxAr9bLNUQc2vxQFTCN7wMXM8EBGHDkc9vr4                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2380008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN   │
│  │ Amount: 100                                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

```bash
sui client balance
[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
╭───────────────────────────────────────────────╮
│ Balance of coins owned by this address        │
├───────────────────────────────────────────────┤
│ ╭───────────────────────────────────────────╮ │
│ │ coin  balance (raw)  balance              │ │
│ ├───────────────────────────────────────────┤ │
│ │ Sui   139904929456   139.90   SUI         │ │
│ │ FC    100            0.00     FAUCET_COIN │ │
│ │ MC    100            0.00     MYCOIN      │ │
│ ╰───────────────────────────────────────────╯ │
╰───────────────────────────────────────────────╯
```

```bash
export AMM_PKG="0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d"
export COIN_A="0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN"
export COIN_B="0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN"

sui client call --package $AMM_PKG --module move_swap --function generate_pool  --type-args $COIN_A $COIN_B


[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: ALQtovYaJtRrAEwZ4EHj9RkGeTL9z9gGzjndHgKo6c9J
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                            │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│ Gas Budget: 100000000 MIST                                                                            │
│ Gas Price: 1000 MIST                                                                                  │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                             │
│  │ Version: 481612                                                                                    │
│  │ Digest: DaoSJQCpkWCsRpzmmUHgQKZY4XdzG3DhCKtj3mxMkHN2                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│   No input objects for this transaction                                                               │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  generate_pool                                                                       │ │
│ │  │ Module:    move_swap                                                                           │ │
│ │  │ Package:   0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN           │ │
│ │  │   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    kDjQ/apIp/jh9LbSvEML3Gm3yWKkvnqzZsakdeTDB5bivvEhaIWXN+idARgul384qk0GV424dzWQkNkJTx0IBQ==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: ALQtovYaJtRrAEwZ4EHj9RkGeTL9z9gGzjndHgKo6c9J                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1133                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 481613                                                                                │
│  │ Digest: 4eWfuwSY9xEzr7ErSRPMN26ShhpYPeAud4UhuojftfMG                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481613                                                                                │
│  │ Digest: 2KXJuC6ZKxt6qsDboLTTivXWKeE6hbKVK3gpurpDdrfq                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481613                                                                                │
│  │ Digest: 2KXJuC6ZKxt6qsDboLTTivXWKeE6hbKVK3gpurpDdrfq                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3268000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                                   │
│    99uGLzU8mr1grWb63mRYA49vj4QsmnWBc7enARkyp1hP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                                                                                                                                                                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                         │
│  │ Owner: Shared                                                                                                                                                                                                                                                                      │
│  │ ObjectType: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::Pool<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN, 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>  │
│  │ Version: 481613                                                                                                                                                                                                                                                                    │
│  │ Digest: 4eWfuwSY9xEzr7ErSRPMN26ShhpYPeAud4UhuojftfMG                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                                                                                                                                                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 481613                                                                                                                                                                                                                                                                    │
│  │ Digest: 2KXJuC6ZKxt6qsDboLTTivXWKeE6hbKVK3gpurpDdrfq                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3289880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --package $AMM_PKG --module move_swap --function create_pocket 

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: 4CNfQ4DohgNipjn4xnaaEVon5RaqZ2oFScu3KaSd5ETa
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                  │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                   │
│  │ Version: 481613                                                                          │
│  │ Digest: 2KXJuC6ZKxt6qsDboLTTivXWKeE6hbKVK3gpurpDdrfq                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  create_pocket                                                      │        │
│ │  │ Module:    move_swap                                                          │        │
│ │  │ Package:   0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    KSlowcspHSos25iDz4j99V5xmAKE3RLM9xou8kdhN2evYoMxHJDM9GtgIF1E6S2zV5m+OuSq7WRh72VjQJz2Cw== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4CNfQ4DohgNipjn4xnaaEVon5RaqZ2oFScu3KaSd5ETa                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1133                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1b3724c412885a2170345bf1be7447023c5bbf7a79c2dc1dc39f47eb58068340                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481614                                                                                │
│  │ Digest: 9F2DHdDiVogTTmL9gBEBsVCb2C3dm2B2gdBYJ49ZMCHn                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481614                                                                                │
│  │ Digest: 4WdPcmSZyL1jhkUVrPtttBh9jabTVHL3NswTwTtghRko                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481614                                                                                │
│  │ Digest: 4WdPcmSZyL1jhkUVrPtttBh9jabTVHL3NswTwTtghRko                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2599200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    99uGLzU8mr1grWb63mRYA49vj4QsmnWBc7enARkyp1hP                                                   │
│    ALQtovYaJtRrAEwZ4EHj9RkGeTL9z9gGzjndHgKo6c9J                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x1b3724c412885a2170345bf1be7447023c5bbf7a79c2dc1dc39f47eb58068340                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::Pocket  │
│  │ Version: 481614                                                                                    │
│  │ Digest: 9F2DHdDiVogTTmL9gBEBsVCb2C3dm2B2gdBYJ49ZMCHn                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 481614                                                                                    │
│  │ Digest: 4WdPcmSZyL1jhkUVrPtttBh9jabTVHL3NswTwTtghRko                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2621080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

```bash
export POOL_ID="0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7"
export POCKET_ID="0x1b3724c412885a2170345bf1be7447023c5bbf7a79c2dc1dc39f47eb58068340"

sui client call --package $AMM_PKG --module move_swap --function deposit_totally  --type-args  $COIN_A $COIN_B --args $POOL_ID 0x90ff4bee2326aac8d893518af966c5cc6d381241a319a9c6026c81a9fa19d54c 0xae13e1c8e2fa65bccfba044bf8ad20cc4afb26eb97d1ba04776bbfe295d08c86 $POCKET_ID

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: DPREixURvBMogfsxuiXPEreJ7XXe8uM6rDWuqETMt5iZ
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                            │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│ Gas Budget: 100000000 MIST                                                                            │
│ Gas Price: 1000 MIST                                                                                  │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                             │
│  │ Version: 481615                                                                                    │
│  │ Digest: 3dDhJDyF8DMNQYwq5oFdUY4rD3MwouQsLgCKiMrQeMjj                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7 │       │
│ │ 1   Imm/Owned Object ID: 0x90ff4bee2326aac8d893518af966c5cc6d381241a319a9c6026c81a9fa19d54c │       │
│ │ 2   Imm/Owned Object ID: 0xae13e1c8e2fa65bccfba044bf8ad20cc4afb26eb97d1ba04776bbfe295d08c86 │       │
│ │ 3   Imm/Owned Object ID: 0x1b3724c412885a2170345bf1be7447023c5bbf7a79c2dc1dc39f47eb58068340 │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  deposit_totally                                                                     │ │
│ │  │ Module:    move_swap                                                                           │ │
│ │  │ Package:   0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN           │ │
│ │  │   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  │   Input  3                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    CrV8T7UZ+3UVxqNyStHf+m7tPWniVxmnl1PZEHH7/AwswysuT768EkjfwoJqbc8uMqxDIJhhzBXGmxCNu+65Bw==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DPREixURvBMogfsxuiXPEreJ7XXe8uM6rDWuqETMt5iZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1134                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x983695daaa0e2899cf3c6cb7ecd4c3f9f6dc0ee03b1269b07bef1a6fb08baead                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481616                                                                                │
│  │ Digest: 5bQQiDqE75RBvhVYQcy3HkqrKvmA1mKveYg5WqRHzzSr                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xce7e5f8ae773ea20573a41ead965c0678dee517fc0d98eebf98a80fe9384e0c7                         │
│  │ Owner: Object ID: ( 0xdbb9228fffb3b7dbc447aeff33eb4bae2cea02e748742922dcbd18927fa29f64 )       │
│  │ Version: 481616                                                                                │
│  │ Digest: 2X2k3HQFJFJ2HZNH1EnS1eexKH9DguutPpPwR6eq2eoF                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1b3724c412885a2170345bf1be7447023c5bbf7a79c2dc1dc39f47eb58068340                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481616                                                                                │
│  │ Digest: 5XCShBDRogJ6Dabszk3JPMd8Cfs7kZCWtob1GAkhQTcp                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481616                                                                                │
│  │ Digest: FjLzoT6SaeBX1XxPpB1FvRMZBKXMxoCYThWNtERtLYYD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 481616                                                                                │
│  │ Digest: 14PA1EuDY3Rhsn7nntkg63Suga9BG97nXHt75iFmijt9                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                         │
│  │ Version: 481615                                                                                │
│  │ Digest: 5h5PJnzwunQzGDM2z8n2tPC99FYXF3AxGunMwoxxD4kQ                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x90ff4bee2326aac8d893518af966c5cc6d381241a319a9c6026c81a9fa19d54c                         │
│  │ Version: 481616                                                                                │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xae13e1c8e2fa65bccfba044bf8ad20cc4afb26eb97d1ba04776bbfe295d08c86                         │
│  │ Version: 481616                                                                                │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481616                                                                                │
│  │ Digest: FjLzoT6SaeBX1XxPpB1FvRMZBKXMxoCYThWNtERtLYYD                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9082000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 7584192 MIST                                                                   │
│    Non-refundable Storage Fee: 76608 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    26TT2y5nSH2ywLvcx7DaRjapjVuCJda9mrxUmEYPcSxr                                                   │
│    7JKKsYAbyqHhHhd5XAFsrybm51zkYzegmA2uvkUNWF71                                                   │
│    7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                                   │
│    99uGLzU8mr1grWb63mRYA49vj4QsmnWBc7enARkyp1hP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                     │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x983695daaa0e2899cf3c6cb7ecd4c3f9f6dc0ee03b1269b07bef1a6fb08baead                                                                                                                                                                                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                                     │
│  │ ObjectType: 0x2::coin::Coin<0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::LP<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN, 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>>  │
│  │ Version: 481616                                                                                                                                                                                                                                                                                   │
│  │ Digest: 5bQQiDqE75RBvhVYQcy3HkqrKvmA1mKveYg5WqRHzzSr                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0xce7e5f8ae773ea20573a41ead965c0678dee517fc0d98eebf98a80fe9384e0c7                                                                                                                                                                                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                                        │
│  │ Owner: Object ID: ( 0xdbb9228fffb3b7dbc447aeff33eb4bae2cea02e748742922dcbd18927fa29f64 )                                                                                                                                                                                                          │
│  │ ObjectType: 0x2::dynamic_field::Field<0x2::object::ID, vector<u64>>                                                                                                                                                                                                                               │
│  │ Version: 481616                                                                                                                                                                                                                                                                                   │
│  │ Digest: 2X2k3HQFJFJ2HZNH1EnS1eexKH9DguutPpPwR6eq2eoF                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│ Mutated Objects:                                                                                                                                                                                                                                                                                     │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x1b3724c412885a2170345bf1be7447023c5bbf7a79c2dc1dc39f47eb58068340                                                                                                                                                                                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                                     │
│  │ ObjectType: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::Pocket                                                                                                                                                                                                 │
│  │ Version: 481616                                                                                                                                                                                                                                                                                   │
│  │ Digest: 5XCShBDRogJ6Dabszk3JPMd8Cfs7kZCWtob1GAkhQTcp                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                                                                                                                                                                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                        │
│  │ Version: 481616                                                                                                                                                                                                                                                                                   │
│  │ Digest: FjLzoT6SaeBX1XxPpB1FvRMZBKXMxoCYThWNtERtLYYD                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                                                                                                                                                                                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                                        │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                     │
│  │ ObjectType: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::Pool<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN, 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>                 │
│  │ Version: 481616                                                                                                                                                                                                                                                                                   │
│  │ Digest: 14PA1EuDY3Rhsn7nntkg63Suga9BG97nXHt75iFmijt9                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                                                                                                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                  │
│  │ CoinType: 0x2::sui::SUI                                                                                                                                                                                                                                                        │
│  │ Amount: -2497808                                                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                  │
│  │ CoinType: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::LP<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN, 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>  │
│  │ Amount: 200                                                                                                                                                                                                                                                                    │
│  └──                                                                                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                  │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN                                                                                                                                                                         │
│  │ Amount: -100                                                                                                                                                                                                                                                                   │
│  └──                                                                                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                  │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN                                                                                                                                                                                   │
│  │ Amount: -100                                                                                                                                                                                                                                                                   │
│  └──                                                                                                                                                                                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --function mint --module faucet_coin --package 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800 --gas-budget 5000000 --args 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406 1000 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc 

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: HF5wvp1sWm967LcFH6UjjYfTciSTLTVWWwEhUY1vSprs
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 481616                                                                                           │
│  │ Digest: FjLzoT6SaeBX1XxPpB1FvRMZBKXMxoCYThWNtERtLYYD                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000"                                                                   │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    bOSUijzmNkiU3eWQC6dvAKAsTFBfhaNBUrMRTcOrU0dgt+udB5PfKVuWQBzPiUeDdnITsqL7NveYhhEA5vbmBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HF5wvp1sWm967LcFH6UjjYfTciSTLTVWWwEhUY1vSprs                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1136                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x28ef00d9dc55d7f08c9a13b7ebcfc7ef5611b75446b1029c1bdfb6998e8b8ef9                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481617                                                                                │
│  │ Digest: 6QoR5kuUz9AnY9Qht51Ag2BtFN7Q5dPd3zWnvKJ3B9b                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481617                                                                                │
│  │ Digest: GxLcFQgyy5GYcSVUaiEA8ybs3jQjboH17g7posXkrmso                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481617                                                                                │
│  │ Digest: 86sBAi37upVExwdyGP18JeGWaywBiMvYf6KPn8bYRyLw                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481617                                                                                │
│  │ Digest: GxLcFQgyy5GYcSVUaiEA8ybs3jQjboH17g7posXkrmso                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7JKKsYAbyqHhHhd5XAFsrybm51zkYzegmA2uvkUNWF71                                                   │
│    7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                                   │
│    DPREixURvBMogfsxuiXPEreJ7XXe8uM6rDWuqETMt5iZ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x28ef00d9dc55d7f08c9a13b7ebcfc7ef5611b75446b1029c1bdfb6998e8b8ef9                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>         │
│  │ Version: 481617                                                                                                                   │
│  │ Digest: 6QoR5kuUz9AnY9Qht51Ag2BtFN7Q5dPd3zWnvKJ3B9b                                                                               │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 481617                                                                                                                   │
│  │ Digest: GxLcFQgyy5GYcSVUaiEA8ybs3jQjboH17g7posXkrmso                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>  │
│  │ Version: 481617                                                                                                                   │
│  │ Digest: 86sBAi37upVExwdyGP18JeGWaywBiMvYf6KPn8bYRyLw                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2456768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN  │
│  │ Amount: 1000                                                                                            │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

```bash
sui client call --package $AMM_PKG --module move_swap --function swap_b_to_a  --type-args $COIN_A $COIN_B --args $POOL_ID \
    '["0x28ef00d9dc55d7f08c9a13b7ebcfc7ef5611b75446b1029c1bdfb6998e8b8ef9"]' \"66\"


[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: EmvPHJfKTB7Zw9xtD3L3khzcjNYtFR6NCt9juHt3enBc
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                            │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│ Gas Budget: 100000000 MIST                                                                            │
│ Gas Price: 1000 MIST                                                                                  │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                             │
│  │ Version: 481617                                                                                    │
│  │ Digest: GxLcFQgyy5GYcSVUaiEA8ybs3jQjboH17g7posXkrmso                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7 │       │
│ │ 1   Imm/Owned Object ID: 0x28ef00d9dc55d7f08c9a13b7ebcfc7ef5611b75446b1029c1bdfb6998e8b8ef9 │       │
│ │ 2   Pure Arg: Type: u64, Value: "66"                                                        │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MakeMoveVec:                                                                                   │ │
│ │  ┌                                                                                                │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  └                                                                                                │ │
│ │                                                                                                   │ │
│ │ 1  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  swap_b_to_a                                                                         │ │
│ │  │ Module:    move_swap                                                                           │ │
│ │  │ Package:   0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN           │ │
│ │  │   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Result 0                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    5k+rBxElFWoYSYBpdm/qdup+Tp3jJqpv8H99lpOe7bAq1Lzg3d9oZInxixVfOtV3HPtlK5aYvZw6xk2haGCtAA==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EmvPHJfKTB7Zw9xtD3L3khzcjNYtFR6NCt9juHt3enBc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1136                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7cb5ecb9a10830d1d1af01fa1073f8c6d0ee88cbb336c8e42eb7f18c3dc97c68                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481618                                                                                │
│  │ Digest: CRxoNpsEnZc77WBp5CvJsyUbdJ5s14rsqL66hMqSMvqM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa30bc55ca2ceca25dd865ccbed26d75ae197cd170d4ab12cfcd768ecaf111a10                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481618                                                                                │
│  │ Digest: 5nPHtcQJZqB52HDHyyfSsYc9d7fsZz952BLzTdFaMjxB                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481618                                                                                │
│  │ Digest: 9M8KrY3jvxA63avPdVFxLfe1T1ovCSdno4XghVBdKoyR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 481618                                                                                │
│  │ Digest: DvLeXpyZuoH6ruioJ8DJDzu4hvbu2MCGDFnk4JXtQZ1D                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                         │
│  │ Version: 481616                                                                                │
│  │ Digest: 14PA1EuDY3Rhsn7nntkg63Suga9BG97nXHt75iFmijt9                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x28ef00d9dc55d7f08c9a13b7ebcfc7ef5611b75446b1029c1bdfb6998e8b8ef9                         │
│  │ Version: 481618                                                                                │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481618                                                                                │
│  │ Digest: 9M8KrY3jvxA63avPdVFxLfe1T1ovCSdno4XghVBdKoyR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 6049600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 4649832 MIST                                                                   │
│    Non-refundable Storage Fee: 46968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                                   │
│    99uGLzU8mr1grWb63mRYA49vj4QsmnWBc7enARkyp1hP                                                   │
│    DPREixURvBMogfsxuiXPEreJ7XXe8uM6rDWuqETMt5iZ                                                   │
│    HF5wvp1sWm967LcFH6UjjYfTciSTLTVWWwEhUY1vSprs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x7cb5ecb9a10830d1d1af01fa1073f8c6d0ee88cbb336c8e42eb7f18c3dc97c68                                                                                                                                                                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN>                                                                                                                                                                    │
│  │ Version: 481618                                                                                                                                                                                                                                                                    │
│  │ Digest: CRxoNpsEnZc77WBp5CvJsyUbdJ5s14rsqL66hMqSMvqM                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xa30bc55ca2ceca25dd865ccbed26d75ae197cd170d4ab12cfcd768ecaf111a10                                                                                                                                                                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>                                                                                                                                                          │
│  │ Version: 481618                                                                                                                                                                                                                                                                    │
│  │ Digest: 5nPHtcQJZqB52HDHyyfSsYc9d7fsZz952BLzTdFaMjxB                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                                                                                                                                                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 481618                                                                                                                                                                                                                                                                    │
│  │ Digest: 9M8KrY3jvxA63avPdVFxLfe1T1ovCSdno4XghVBdKoyR                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xea7fad53bfae04eacc72316686d8477344dc8773f6ecbb3377dcd193867bc0e7                                                                                                                                                                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                                                                                                                                                                         │
│  │ Owner: Shared                                                                                                                                                                                                                                                                      │
│  │ ObjectType: 0x82baebc7a93f60c1f1e575371565e387171b3e5d69f7c4455be39e4630e6846d::move_swap::Pool<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN, 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>  │
│  │ Version: 481618                                                                                                                                                                                                                                                                    │
│  │ Digest: DvLeXpyZuoH6ruioJ8DJDzu4hvbu2MCGDFnk4JXtQZ1D                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2399768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN  │
│  │ Amount: -66                                                                                             │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN            │
│  │ Amount: 66                                                                                              │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```