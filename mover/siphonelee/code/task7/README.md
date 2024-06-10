% sui client call  --package 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd  --module check_in --function get_flag --gas-budget 10000000 --args "j4kF<9wT^ZqGh;i^gmmmX6j_z?To"  0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 0x8

[warn] Client/Server api version mismatch, client api version : 1.26.0, server api version : 1.26.1
Transaction Digest: 3vheaNaQv4kYsLJ4vesuqzkb31aZ8zw7Ji8ryBQNFPXb
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
│  │ Version: 48002538                                                                            │
│  │ Digest: CM2z19DcJqNpEss1gymDyC171bsgqsjaXN2PYRyyTM8F                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "j4kF<9wT^ZqGh;i^gmmmX6j_z?To"                       │ │
│ │ 1   Shared Object    ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  get_flag                                                           │            │
│ │  │ Module:    check_in                                                           │            │
│ │  │ Package:   0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    A6H/pzzfYW3dkV4b0srqsr1FkdMTh1izpmlrLInMfOLuft6JI54PJH95Ms/tGW9xstvrOXGoeuXt/QvZWG2YDA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3vheaNaQv4kYsLJ4vesuqzkb31aZ8zw7Ji8ryBQNFPXb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 395                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                         │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )  │
│  │ Version: 48002539                                                                              │
│  │ Digest: 5A7Je7fqWd2miZdMHJDuqezFdtHm1hgXyL4tk871UYQM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                         │
│  │ Owner: Shared( 12674957 )                                                                      │
│  │ Version: 48002539                                                                              │
│  │ Digest: 2sJcWjbVdqFyuy5f5jjRGbhrSdm35oCKuhxBTtjejfrd                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                         │
│  │ Version: 48002538                                                                              │
│  │ Digest: 2WWaJgtheDxHbQvqJvVJSRg8by3Yp9EWR3crBmjwCtNr                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008                         │
│  │ Version: 45218622                                                                              │
│  │ Digest: 214qYWfbRxcudzsL2z7JKkPWKX7fN9PNbLbUWTFvP4dt                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                         │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )  │
│  │ Version: 48002539                                                                              │
│  │ Digest: 5A7Je7fqWd2miZdMHJDuqezFdtHm1hgXyL4tk871UYQM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2500400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2573208 MIST                                                                   │
│    Non-refundable Storage Fee: 25992 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DgKTWVMgjdabXqzKFJsu4PuyYELLRx9xPpw7fUia4efL                                                   │
│    FP182EWYALKzusAcoKRpBVY96FTV2VB9EyPogAZNEAY7                                                   │
│    GvtDcAEMFwzCSEPUqkaPGxD4CpKyD7DDfhLrnU8KuMBR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                             │
│  │ EventID: 3vheaNaQv4kYsLJ4vesuqzkb31aZ8zw7Ji8ryBQNFPXb:0                                       │
│  │ PackageID: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd                 │
│  │ Transaction Module: check_in                                                                  │
│  │ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                    │
│  │ EventType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::Flag │
│  │ ParsedJSON:                                                                                   │
│  │   ┌────────┬────────────────────────────────────────────────────────────────────┐             │
│  │   │ flag   │ true                                                               │             │
│  │   ├────────┼────────────────────────────────────────────────────────────────────┤             │
│  │   │ sender │ 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 │             │
│  │   └────────┴────────────────────────────────────────────────────────────────────┘             │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x0d88c19652e28037726369d17aef70b9037e4ca4a0424d98173d336a90238ba5                          │
│  │ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                            │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 48002539                                                                                     │
│  │ Digest: 5A7Je7fqWd2miZdMHJDuqezFdtHm1hgXyL4tk871UYQM                                                  │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                          │
│  │ Sender: 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694                            │
│  │ Owner: Shared( 12674957 )                                                                             │
│  │ ObjectType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::FlagString  │
│  │ Version: 48002539                                                                                     │
│  │ Digest: 2sJcWjbVdqFyuy5f5jjRGbhrSdm35oCKuhxBTtjejfrd                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x70665717fc8d06f2c0526ae6c0493dd95c1a02cc6c95c56d0531f44a202a1694 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -927192                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
