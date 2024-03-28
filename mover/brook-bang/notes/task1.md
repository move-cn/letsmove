# Task1 hello move
package链接: https://testnet.suivision.xyz/package/0x04365c465ccbf1ef81e2b2f7a1247a2232d5e1412dcee2bba3c47b78f7d78aea

hellomove链接: https://testnet.suivision.xyz/object/0x365c53fd933f00c060d865430763e2206ba4e0969182644f9f5acee9daaf58ca

```
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: J29jyoFsKdrVm5zuq4GEHddonEhFDRiXCpkaA55sstY1
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
│  │ Version: 870953                                                                                           │
│  │ Digest: 7jsQayrWRFvUJxrY7j9ksKgyPfBi3dfrWBYKQk9NYzZT                                                      │
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
│    pYnpjxpvGZRZ6q+GKn5YP6FQq8u4D1T/6QqCYInm4DDsH6YQ4B5X5+Z1OFeklj/IuEsoOgaAnH7h95/e7AcTAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: J29jyoFsKdrVm5zuq4GEHddonEhFDRiXCpkaA55sstY1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 320                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x04365c465ccbf1ef81e2b2f7a1247a2232d5e1412dcee2bba3c47b78f7d78aea                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AEPGfMvvZcpFwchboh86dAYv5g135aMMJR4n6nxLbhcM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4f99a3e037494b656d93f2ff59c629e11be41c6c857a28a0fb76b8fed62a3b6b                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870954                                                                                │
│  │ Digest: 2y79goFGbaT1sSHbDRB8BZMu51jHbw2PK2QAjj5Hp3Yd                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870954                                                                                │
│  │ Digest: 4PsP6T5mym7WWaEHP28mMhmRiFeG86SxzUxDR4M2e943                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870954                                                                                │
│  │ Digest: 4PsP6T5mym7WWaEHP28mMhmRiFeG86SxzUxDR4M2e943                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7896400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    2CNf6G1GFvoZgS9UZzmt7Mr2ZPdPDE4jTPfAvkajT3ot                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x4f99a3e037494b656d93f2ff59c629e11be41c6c857a28a0fb76b8fed62a3b6b                  │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                    │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 870954                                                                               │
│  │ Digest: 2y79goFGbaT1sSHbDRB8BZMu51jHbw2PK2QAjj5Hp3Yd                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                  │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                    │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 870954                                                                               │
│  │ Digest: 4PsP6T5mym7WWaEHP28mMhmRiFeG86SxzUxDR4M2e943                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x04365c465ccbf1ef81e2b2f7a1247a2232d5e1412dcee2bba3c47b78f7d78aea                 │
│  │ Version: 1                                                                                    │
│  │ Digest: AEPGfMvvZcpFwchboh86dAYv5g135aMMJR4n6nxLbhcM                                          │
│  │ Modules: hello_move                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7918280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
Transaction Digest: GCuiNsBiyNmDCYdsWZcVLqsBEg1cRJGjVT3gUxhdMJdU
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                  │
│ Gas Owner: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669               │
│ Gas Budget: 30000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                   │
│  │ Version: 870954                                                                          │
│  │ Digest: 4PsP6T5mym7WWaEHP28mMhmRiFeG86SxzUxDR4M2e943                                     │
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
│ │  │ Package:   0x04365c465ccbf1ef81e2b2f7a1247a2232d5e1412dcee2bba3c47b78f7d78aea │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    jVLzn6pXOj6s3Fdmgce+3ChMKIGJ8vA0FD6Ej4CQ508267H3QnaT+tj1IlbTwlodQUT3/b0Q4KaPH7tb36jGAA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GCuiNsBiyNmDCYdsWZcVLqsBEg1cRJGjVT3gUxhdMJdU                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 320                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x365c53fd933f00c060d865430763e2206ba4e0969182644f9f5acee9daaf58ca                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870955                                                                                │
│  │ Digest: diLfSB8zYcs8t9MJdLwhMi1WuLcfVWrhkVBwGZt3nbr                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870955                                                                                │
│  │ Digest: 4CqGuEeivH13Z92Sq1inDgYKJ8i1EnQFhpCrS64cdB1G                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870955                                                                                │
│  │ Digest: 4CqGuEeivH13Z92Sq1inDgYKJ8i1EnQFhpCrS64cdB1G                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2454800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    J29jyoFsKdrVm5zuq4GEHddonEhFDRiXCpkaA55sstY1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x365c53fd933f00c060d865430763e2206ba4e0969182644f9f5acee9daaf58ca                                │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                  │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )               │
│  │ ObjectType: 0x4365c465ccbf1ef81e2b2f7a1247a2232d5e1412dcee2bba3c47b78f7d78aea::hello_move::HelloMoveObject  │
│  │ Version: 870955                                                                                             │
│  │ Digest: diLfSB8zYcs8t9MJdLwhMi1WuLcfVWrhkVBwGZt3nbr                                                         │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                                │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                  │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 870955                                                                                             │
│  │ Digest: 4CqGuEeivH13Z92Sq1inDgYKJ8i1EnQFhpCrS64cdB1G                                                        │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2476680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```