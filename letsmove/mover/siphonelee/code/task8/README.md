% sui client call  --package 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf  --module lets_move --function get_flag --gas-budget 10000000 --args  43370155 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff 0x8

[warn] Client/Server api version mismatch, client api version : 1.26.0, server api version : 1.26.1
Transaction Digest: 75HirpDVMgx6aZmJf3AsrxdrSAfdRoKaNSxS4xTiTpL7
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                      │
│ Gas Owner: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                       │
│  │ Version: 48027164                                                                            │
│  │ Digest: 4xRnTTDzS7pq8rijBnr911D7qUAcHQHUqVK5k4j2jCYC                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "43370155"                                           │ │
│ │ 1   Shared Object    ID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  get_flag                                                           │            │
│ │  │ Module:    lets_move                                                          │            │
│ │  │ Package:   0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    wP7ENsmwuqBBlbcaS0yX4rmr2W43RZa5CEfSScGOjRmjdPI8vlX5lAUx1xB3M6s+MX5jkVLn7rG3AXKbK09tDg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 75HirpDVMgx6aZmJf3AsrxdrSAfdRoKaNSxS4xTiTpL7                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 395                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                         │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )  │
│  │ Version: 48027326                                                                              │
│  │ Digest: 5ub1hAoKZsmHLfzjmh5oYFj9XgJms2ndascyDSJfKXdk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff                         │
│  │ Owner: Shared( 48002537 )                                                                      │
│  │ Version: 48027326                                                                              │
│  │ Digest: 7gXuotrga38JmdvbG8QtUuaBAuQGwr3ctUdz2jff16Uo                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff                         │
│  │ Version: 48027325                                                                              │
│  │ Digest: 8373swQ5XtYg66pgC86Wj4QrUBdndqGmdSkkMdW2jJmo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008                         │
│  │ Version: 45422107                                                                              │
│  │ Digest: 5kfE7wQjkcMxoumtnNksQavNpxUBmvWXd2PPdWJLM33j                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                         │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )  │
│  │ Version: 48027326                                                                              │
│  │ Digest: 5ub1hAoKZsmHLfzjmh5oYFj9XgJms2ndascyDSJfKXdk                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2599200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2490444 MIST                                                                   │
│    Non-refundable Storage Fee: 25156 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Xh741dPy22C9S63hREhCbWFe6JmtCdU1xpH8QRu5SHd                                                    │
│    8oCdTqoYcsUGA1pxQ1UJStv2bqCNyAyAoJQ37vzQHxCa                                                   │
│    CFx6DSW2dCk4VejTCZZrFu11KfxmhdZetrRM3Rrx4caP                                                   │
│    E84Do7wyH65fKjBRZBZyvfP5z6QRjWAYfGCRnoBpEAdM                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                          │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ EventID: 75HirpDVMgx6aZmJf3AsrxdrSAfdRoKaNSxS4xTiTpL7:0                                        │
│  │ PackageID: 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf                  │
│  │ Transaction Module: lets_move                                                                  │
│  │ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                     │
│  │ EventType: 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf::lets_move::Flag │
│  │ ParsedJSON:                                                                                    │
│  │   ┌────────┬────────────────────────────────────────────────────────────────────┐              │
│  │   │ flag   │ true                                                               │              │
│  │   ├────────┼────────────────────────────────────────────────────────────────────┤              │
│  │   │ sender │ 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 │              │
│  │   └────────┴────────────────────────────────────────────────────────────────────┘              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                          │
│  │ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                            │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 48027326                                                                                     │
│  │ Digest: 5ub1hAoKZsmHLfzjmh5oYFj9XgJms2ndascyDSJfKXdk                                                  │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff                          │
│  │ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                            │
│  │ Owner: Shared( 48002537 )                                                                             │
│  │ ObjectType: 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf::lets_move::Challenge  │
│  │ Version: 48027326                                                                                     │
│  │ Digest: 7gXuotrga38JmdvbG8QtUuaBAuQGwr3ctUdz2jff16Uo                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1108756                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
