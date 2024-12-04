# Nft

实例 很简单 https://examples.sui-book.com/samples/nft.html

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.20.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING dexnft
Skipping dependency verification
Transaction Digest: BSjAo8hg15qYuHp74f3CNnsA3U96Ypv8PLV1rYbnr6x1
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                    │
│  │ Version: 80879229                                                                                         │
│  │ Digest: 3QeVc1NiSHVKDzj9fedhLQg3Hxtn7aMHkBnakadSgQMs                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c" │ │
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
│    uwhd0zjVIDWU1BR8N2UZtXDp8/i2Sed9VkyTEpAQNiFJ1gL3E6t08vERpD2GZJQQsue8kI4o6AabsMB2Sg4zDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BSjAo8hg15qYuHp74f3CNnsA3U96Ypv8PLV1rYbnr6x1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 345                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x78c801d1fc88bd19895475964b91c342471a5a896de3f40ac90faf3f7526a080                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879230                                                                              │
│  │ Digest: 2LQpDfaw6PT2RcTU9Pg8iRG9kBKX3CvmbDw4MtqB9ZgF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2KvrM2guS8YWiSH5qb1PmdmTyYGuvBaGGj99Mto2v5EP                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879230                                                                              │
│  │ Digest: 2JeNGgtDTuMDgxiUjgWfb1FBB3D22K5hDJp5E6Py41U8                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879230                                                                              │
│  │ Digest: 2JeNGgtDTuMDgxiUjgWfb1FBB3D22K5hDJp5E6Py41U8                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11111200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    H2CEoeU3K93fqgzMdb6KTiWqGA3dBa8H3YJ2K7Qm6iAV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x78c801d1fc88bd19895475964b91c342471a5a896de3f40ac90faf3f7526a080                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 80879230                                                                             │
│  │ Digest: 2LQpDfaw6PT2RcTU9Pg8iRG9kBKX3CvmbDw4MtqB9ZgF                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 80879230                                                                             │
│  │ Digest: 2JeNGgtDTuMDgxiUjgWfb1FBB3D22K5hDJp5E6Py41U8                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 2KvrM2guS8YWiSH5qb1PmdmTyYGuvBaGGj99Mto2v5EP                                          │
│  │ Modules: dex_nft                                                                              │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10883080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

```rust
packid 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6

moulde: dex_nft

sui client call --function mint_to_sender --module dex_nft --package 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6 --gas-budget 4000000 --args DexNFT001 "First DexNFT in the world" "https://gravatar.com/avatar/28156c4954bb094df294c71730cfd71f?s=200&d=wavatar&r=pg" 
```

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.20.1
Transaction Digest: 8g3wQg6X5WaKB8gkXA4VPRg4kvd5o5nNk8mTcpvf2GgJ
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                               │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                     │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                  │
│ Gas Budget: 4000000 MIST                                                                                                       │
│ Gas Price: 750 MIST                                                                                                            │
│ Gas Payment:                                                                                                                   │
│  ┌──                                                                                                                           │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                                      │
│  │ Version: 80879230                                                                                                           │
│  │ Digest: 2JeNGgtDTuMDgxiUjgWfb1FBB3D22K5hDJp5E6Py41U8                                                                        │
│  └──                                                                                                                           │
│                                                                                                                                │
│ Transaction Kind: Programmable                                                                                                 │
│ ╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                                              │ │
│ ├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "DexNFT001"                                                                         │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "First DexNFT in the world"                                                         │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://gravatar.com/avatar/28156c4954bb094df294c71730cfd71f?s=200&d=wavatar&r=pg" │ │
│ ╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                                           │
│ │ Commands                                                                         │                                           │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                                           │
│ │ 0  MoveCall:                                                                     │                                           │
│ │  ┌                                                                               │                                           │
│ │  │ Function:  mint_to_sender                                                     │                                           │
│ │  │ Module:    dex_nft                                                            │                                           │
│ │  │ Package:   0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6 │                                           │
│ │  │ Arguments:                                                                    │                                           │
│ │  │   Input  0                                                                    │                                           │
│ │  │   Input  1                                                                    │                                           │
│ │  │   Input  2                                                                    │                                           │
│ │  └                                                                               │                                           │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                                           │
│                                                                                                                                │
│ Signatures:                                                                                                                    │
│    Or3RScFQw8rPIVjnZbVrizp4CWIqiKY1IfMTpWxMS1uAVEwCd8aHP4GLCVt3o/s/H1+9sSg3y4frXlPNm9WZCg==                                    │
│                                                                                                                                │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8g3wQg6X5WaKB8gkXA4VPRg4kvd5o5nNk8mTcpvf2GgJ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 345                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4a39c423f100643688195d446c35ada4321eedc953a5c6e3fe03f5e9cb69a0ca                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879231                                                                              │
│  │ Digest: AH7EFNgfCs1tsacsBpGKyXzdUggrL1Mq7AmySvuoJ9jX                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879231                                                                              │
│  │ Digest: DyQifZRjvXCVDk45W71cZsVVfpfeis6bDGddsrrDLL5m                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879231                                                                              │
│  │ Digest: DyQifZRjvXCVDk45W71cZsVVfpfeis6bDGddsrrDLL5m                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3176800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    BSjAo8hg15qYuHp74f3CNnsA3U96Ypv8PLV1rYbnr6x1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                           │
│  │ EventID: 8g3wQg6X5WaKB8gkXA4VPRg4kvd5o5nNk8mTcpvf2GgJ:0                                                     │
│  │ PackageID: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6                               │
│  │ Transaction Module: dex_nft                                                                                 │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                  │
│  │ EventType: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6::dex_nft::DexNftTransferEvent │
│  │ ParsedJSON:                                                                                                 │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                        │
│  │   │ creator   │ 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c │                        │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                        │
│  │   │ name      │ DexNFT001                                                          │                        │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                        │
│  │   │ object_id │ 0x4a39c423f100643688195d446c35ada4321eedc953a5c6e3fe03f5e9cb69a0ca │                        │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                        │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0x4a39c423f100643688195d446c35ada4321eedc953a5c6e3fe03f5e9cb69a0ca                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )    │
│  │ ObjectType: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6::dex_nft::DexNFT  │
│  │ Version: 80879231                                                                                │
│  │ Digest: AH7EFNgfCs1tsacsBpGKyXzdUggrL1Mq7AmySvuoJ9jX                                             │
│  └──                                                                                                │
│ Mutated Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                       │
│  │ Version: 80879231                                                                                │
│  │ Digest: DyQifZRjvXCVDk45W71cZsVVfpfeis6bDGddsrrDLL5m                                             │
│  └──                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2948680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

```rust
publish 2

sui client call --function mint_to_sender --module dex_nft --package 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6 --gas-budget 4000000 --args DexNFT002 "Second DexNFT in the world, wavata" "https://gravatar.com/avatar/c27f993f258ca148e55e0177f6cf70e7?s=400&d=wavatar&r=x" 
```

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.20.1
Transaction Digest: 6yYC3WLwy7BuzAKFvJ5bTe5XCnmJfibfVD2myJ5RzjkB
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                              │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                    │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                 │
│ Gas Budget: 4000000 MIST                                                                                                      │
│ Gas Price: 750 MIST                                                                                                           │
│ Gas Payment:                                                                                                                  │
│  ┌──                                                                                                                          │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                                     │
│  │ Version: 80879231                                                                                                          │
│  │ Digest: DyQifZRjvXCVDk45W71cZsVVfpfeis6bDGddsrrDLL5m                                                                       │
│  └──                                                                                                                          │
│                                                                                                                               │
│ Transaction Kind: Programmable                                                                                                │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                                             │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "DexNFT002"                                                                        │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "Second DexNFT in the world, wavata"                                               │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://gravatar.com/avatar/c27f993f258ca148e55e0177f6cf70e7?s=400&d=wavatar&r=x" │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                                          │
│ │ Commands                                                                         │                                          │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                                          │
│ │ 0  MoveCall:                                                                     │                                          │
│ │  ┌                                                                               │                                          │
│ │  │ Function:  mint_to_sender                                                     │                                          │
│ │  │ Module:    dex_nft                                                            │                                          │
│ │  │ Package:   0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6 │                                          │
│ │  │ Arguments:                                                                    │                                          │
│ │  │   Input  0                                                                    │                                          │
│ │  │   Input  1                                                                    │                                          │
│ │  │   Input  2                                                                    │                                          │
│ │  └                                                                               │                                          │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                                          │
│                                                                                                                               │
│ Signatures:                                                                                                                   │
│    Eh874fv85PJ4YomME3a3OVxqM4cHhl0sLsyL0NWe5+P0i5E7FM5vnfk8sPsuDGI+sthtAEpN/fBuBtNmwblOAg==                                   │
│                                                                                                                               │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6yYC3WLwy7BuzAKFvJ5bTe5XCnmJfibfVD2myJ5RzjkB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 345                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb86617ec5278821faa4074c9731555104c5ce580c6ef5621a306d6bd49f7c35e                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879232                                                                              │
│  │ Digest: B12nZD566GhdEAfnwznoje6HSiA4ZsxiDgzF8yP6pjqD                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879232                                                                              │
│  │ Digest: HToEcmNuF4HQwx839rEEd8KDx6iio6YzV2CdonLL8ctA                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879232                                                                              │
│  │ Digest: HToEcmNuF4HQwx839rEEd8KDx6iio6YzV2CdonLL8ctA                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3237600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8g3wQg6X5WaKB8gkXA4VPRg4kvd5o5nNk8mTcpvf2GgJ                                                   │
│    BSjAo8hg15qYuHp74f3CNnsA3U96Ypv8PLV1rYbnr6x1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                           │
│  │ EventID: 6yYC3WLwy7BuzAKFvJ5bTe5XCnmJfibfVD2myJ5RzjkB:0                                                     │
│  │ PackageID: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6                               │
│  │ Transaction Module: dex_nft                                                                                 │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                  │
│  │ EventType: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6::dex_nft::DexNftTransferEvent │
│  │ ParsedJSON:                                                                                                 │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                        │
│  │   │ creator   │ 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c │                        │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                        │
│  │   │ name      │ DexNFT002                                                          │                        │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                        │
│  │   │ object_id │ 0xb86617ec5278821faa4074c9731555104c5ce580c6ef5621a306d6bd49f7c35e │                        │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                        │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0xb86617ec5278821faa4074c9731555104c5ce580c6ef5621a306d6bd49f7c35e                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )    │
│  │ ObjectType: 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6::dex_nft::DexNFT  │
│  │ Version: 80879232                                                                                │
│  │ Digest: B12nZD566GhdEAfnwznoje6HSiA4ZsxiDgzF8yP6pjqD                                             │
│  └──                                                                                                │
│ Mutated Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                       │
│  │ Version: 80879232                                                                                │
│  │ Digest: HToEcmNuF4HQwx839rEEd8KDx6iio6YzV2CdonLL8ctA                                             │
│  └──                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3009480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

发送给制定地址

```rust
sui client call --function transfer --module dex_nft --package 0xcb96dae65b3b074c0c0e9144e1adaf92a8e522c8d3cc9ffd42e4b316834073b6 --gas-budget 2000000 --args 0xb86617ec5278821faa4074c9731555104c5ce580c6ef5621a306d6bd49f7c35e 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

输出