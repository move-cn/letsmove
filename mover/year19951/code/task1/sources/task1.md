# task 1

build：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
```

发布合约：
```bash
❯ sui client publish --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.24.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: 2EzPADtos7eRJ24mjWYWgBt36gv5nUrLmCh5zCVNyge8
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                                   │
│ Gas Owner: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                                    │
│  │ Version: 22152846                                                                                         │
│  │ Digest: Fnw3uMUkQLzsTBQHjCtTAw2JHAUHjSqRGeRCDgmsdsEa                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171" │ │
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
│    kjchDwedYJmRqdHq8qlHKdiRFPWOCtnRzCwlzvkpI1XKZ1xB1HRaxmd/t+SxSz7ivR3tATTF/ZIL0ZdO5nSjDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2EzPADtos7eRJ24mjWYWgBt36gv5nUrLmCh5zCVNyge8                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 355                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5422c88deab64ad7e3a41c347b9955f2ea62ac2d69870afacd1d534777b624dc                         │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ Version: 22152847                                                                              │
│  │ Digest: 7iqiqXVuq2RhqK287dUy5TYBWsoyEcyoc8XjDncTofBs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x96f91ace439ed95c14d29799993088078a4c116eea0681aeb828045cdc741017                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5DZbBH1tmAFHqnpfoB2NRi9eumL5VJFogfSZfWEjRLtz                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                         │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ Version: 22152847                                                                              │
│  │ Digest: CNYDsCw2orpeMjpaSJqigsR6puYyrF4gxUCuCESeAXbd                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                         │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ Version: 22152847                                                                              │
│  │ Digest: CNYDsCw2orpeMjpaSJqigsR6puYyrF4gxUCuCESeAXbd                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8010400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    GgdUMC2KshZtcQnxj6k9aGRk3F5tA6siPuVrjY9Wex6z                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5422c88deab64ad7e3a41c347b9955f2ea62ac2d69870afacd1d534777b624dc                  │
│  │ Sender: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                    │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 22152847                                                                             │
│  │ Digest: 7iqiqXVuq2RhqK287dUy5TYBWsoyEcyoc8XjDncTofBs                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                  │
│  │ Sender: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                    │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 22152847                                                                             │
│  │ Digest: CNYDsCw2orpeMjpaSJqigsR6puYyrF4gxUCuCESeAXbd                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x96f91ace439ed95c14d29799993088078a4c116eea0681aeb828045cdc741017                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 5DZbBH1tmAFHqnpfoB2NRi9eumL5VJFogfSZfWEjRLtz                                          │
│  │ Modules: hello_word                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8032280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用合约函数：
```bash
❯ sui client call --package 0x96f91ace439ed95c14d29799993088078a4c116eea0681aeb828045cdc741017 --module hello_word --function mint --gas-budget 100000000 
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.24.0
Transaction Digest: 2R4Kj8F54Ls4DRGUdzyLYQvFckQbn6rycDbh4qiparB3
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                  │
│ Gas Owner: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                   │
│  │ Version: 22152847                                                                        │
│  │ Digest: CNYDsCw2orpeMjpaSJqigsR6puYyrF4gxUCuCESeAXbd                                     │
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
│ │  │ Module:    hello_word                                                         │        │
│ │  │ Package:   0x96f91ace439ed95c14d29799993088078a4c116eea0681aeb828045cdc741017 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    z9gcdF4s/n+khB7oZVENxa25neHpPZLyJGG1J/jNGxBdmYWFpfiwisYUi1y0mBmuiIA/l8sBTw+7J0WKAm/ACg== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2R4Kj8F54Ls4DRGUdzyLYQvFckQbn6rycDbh4qiparB3                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 355                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9a05e8378606646d9f03f35798f0d712f3533d4f06ef81f057fbe33171970871                         │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ Version: 22152848                                                                              │
│  │ Digest: DTiUp5E2X27uHFh8uUuvBkZwdxD9RiVowmk4vUkkcFw6                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                         │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ Version: 22152848                                                                              │
│  │ Digest: EPvBubUdPq5aRrLKQVXUmJdAC99hYaRYwnRwzDTJxmje                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                         │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ Version: 22152848                                                                              │
│  │ Digest: EPvBubUdPq5aRrLKQVXUmJdAC99hYaRYwnRwzDTJxmje                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2477600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2EzPADtos7eRJ24mjWYWgBt36gv5nUrLmCh5zCVNyge8                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x9a05e8378606646d9f03f35798f0d712f3533d4f06ef81f057fbe33171970871                                │
│  │ Sender: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                                  │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )               │
│  │ ObjectType: 0x96f91ace439ed95c14d29799993088078a4c116eea0681aeb828045cdc741017::hello_word::HelloYear19951  │
│  │ Version: 22152848                                                                                           │
│  │ Digest: DTiUp5E2X27uHFh8uUuvBkZwdxD9RiVowmk4vUkkcFw6                                                        │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x8e81a8756beeb46d330236782289bc58ffb4a0f96ed06ae3879621ea89d19b5a                                │
│  │ Sender: 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171                                  │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 22152848                                                                                           │
│  │ Digest: EPvBubUdPq5aRrLKQVXUmJdAC99hYaRYwnRwzDTJxmje                                                        │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x5390ec807fcd5b70788736a180717067d63776bae5b2d6735a87a8bb9ccc9171 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2499480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
