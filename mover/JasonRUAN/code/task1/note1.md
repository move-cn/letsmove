# Task1交互记录

## 编译
```bash
$ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
```

## 部署
```bash
$ sui client publish

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: C7bFftNpy9uZxyockT1djmhDSWjyk7pLo4Xx7ARuRWZR
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca                                   │
│ Gas Owner: 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca                                │
│ Gas Budget: 11925600 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x4e35761870ba9fee703bbfa8731187ca913ac73bab88a53e4b2a2391fe704e49                                    │
│  │ Version: 263842595                                                                                        │
│  │ Digest: 5G4WZjR1eA6L8uEh3tQd6PybK5G6DrXWAgJscR8w17Wc                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca" │ │
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
│    wtQfzKhRkQvjpAdhPPET5VfTlCkSjwJJKScRWQbBrjLntYbXu3QrYymzCsxciWZzDHl4LjIspB9jZRp83ylJDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: C7bFftNpy9uZxyockT1djmhDSWjyk7pLo4Xx7ARuRWZR                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 572                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x292bd4aca912c711a3885ed8d1d25f95cb3475b7dba4729cdd0460d684296bf0                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )  │
│  │ Version: 263842596                                                                             │
│  │ Digest: 8h99d2j23zt9QzpPXttVFEKdXd4QAcjD1VwZrgfNhNbu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7f95f89b253d7687b8fa2ec6457b57f42eaeb4783fb0f3ec6f1c45cca94d76df                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: H8hWzN7QrRsjPELpn5GkesxSRDgjvRyfyt4FKiH8Yiy6                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x852b154ba5f1109973c662c8f490a1c02dfcac5ee4c0ffca12b7ed7837bd5bf0                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )  │
│  │ Version: 263842596                                                                             │
│  │ Digest: 6owMaKdM4gzKLy53Yis72taHNTCrb4wGWUyfNqiSEtF9                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4e35761870ba9fee703bbfa8731187ca913ac73bab88a53e4b2a2391fe704e49                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )  │
│  │ Version: 263842596                                                                             │
│  │ Digest: DqdfAzTshqHM3eUi242kM2FY9sy2kdhcchM74J64ofew                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4e35761870ba9fee703bbfa8731187ca913ac73bab88a53e4b2a2391fe704e49                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )  │
│  │ Version: 263842596                                                                             │
│  │ Digest: DqdfAzTshqHM3eUi242kM2FY9sy2kdhcchM74J64ofew                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9925600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4VNJArjZeoawwRb7Smzp3FxZTUTWdnfpomzT1XDjbcHW                                                   │
│    GMBJA2gEEvtwv1wGGT7ZEDkQdrmUTKaE4TeinNGQ2feC                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ EventID: C7bFftNpy9uZxyockT1djmhDSWjyk7pLo4Xx7ARuRWZR:0                                               │
│  │ PackageID: 0x7f95f89b253d7687b8fa2ec6457b57f42eaeb4783fb0f3ec6f1c45cca94d76df                         │
│  │ Transaction Module: hello_move                                                                        │
│  │ Sender: 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca                            │
│  │ EventType: 0x7f95f89b253d7687b8fa2ec6457b57f42eaeb4783fb0f3ec6f1c45cca94d76df::hello_move::HelloEvent │
│  │ ParsedJSON:                                                                                           │
│  │   ┌──────┬───────────┐                                                                                │
│  │   │ text │ JasonRUAN │                                                                                │
│  │   └──────┴───────────┘                                                                                │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x292bd4aca912c711a3885ed8d1d25f95cb3475b7dba4729cdd0460d684296bf0                       │
│  │ Sender: 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                               │
│  │ Version: 263842596                                                                                 │
│  │ Digest: 8h99d2j23zt9QzpPXttVFEKdXd4QAcjD1VwZrgfNhNbu                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x852b154ba5f1109973c662c8f490a1c02dfcac5ee4c0ffca12b7ed7837bd5bf0                       │
│  │ Sender: 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )      │
│  │ ObjectType: 0x7f95f89b253d7687b8fa2ec6457b57f42eaeb4783fb0f3ec6f1c45cca94d76df::hello_move::Hello  │
│  │ Version: 263842596                                                                                 │
│  │ Digest: 6owMaKdM4gzKLy53Yis72taHNTCrb4wGWUyfNqiSEtF9                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x4e35761870ba9fee703bbfa8731187ca913ac73bab88a53e4b2a2391fe704e49                       │
│  │ Sender: 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca                         │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 263842596                                                                                 │
│  │ Digest: DqdfAzTshqHM3eUi242kM2FY9sy2kdhcchM74J64ofew                                               │
│  └──                                                                                                  │
│ Published Objects:                                                                                    │
│  ┌──                                                                                                  │
│  │ PackageID: 0x7f95f89b253d7687b8fa2ec6457b57f42eaeb4783fb0f3ec6f1c45cca94d76df                      │
│  │ Version: 1                                                                                         │
│  │ Digest: H8hWzN7QrRsjPELpn5GkesxSRDgjvRyfyt4FKiH8Yiy6                                               │
│  │ Modules: hello_move                                                                                │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa6199518f5ca56ccd3a37f3496d740807df41fffac9149d5ab177162e285a6ca )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9947480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```