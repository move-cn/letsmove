task3 nft学习视频链接：

https://us06web.zoom.us/rec/share/NhIpYEXW8DcO1gcZ7pSksWxUz570-U7P7RktcFeQ7jXBKAzb_s1SXkPO8FdFXoAt.us1mNdO8S6xiDB4v 
密码: ec%4sz3D

视频 43分左右 开始 mint NFT 

代码相关：

以下发布在 主网上操作，可以根据情况在 testnet 或 mainnet 实践，主网记得充值gas.

# 发布

```cmake
  sui move build                 
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_nft
 ~/Documents/sui/letsmove/mover/june5753/code/task3/my_nft   main ●✚  sui  client switch --env mainnet 
Active environment switched to [mainnet]
 ~/Documents/sui/letsmove/mover/june5753/code/task3/my_nft   main ●✚  sui client addresses            
╭────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias          │ address                                                            │ active address │
├────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ nice-malachite │ 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 │ *              │
│ gracious-beryl │ 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca │                │
╰────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
 ~/Documents/sui/letsmove/mover/june5753/code/task3/my_nft   main ●✚  sui client publish              
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_nft
Successfully verified dependencies on-chain against source.
Transaction Digest: 3uBL5FAutbAcuk2mL7mdgyp1DKq9WNdRExR6Vr5W1NZf
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                   │
│ Gas Owner: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                │
│ Gas Budget: 25102400 MIST                                                                                    │
│ Gas Price: 756 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                                    │
│  │ Version: 317768427                                                                                        │
│  │ Digest: F265PgUeoSdvMEV16yecfitdqUfc68mWFd35LnuQb3fa                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049" │ │
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
│    m8Ie9Ks+XOHhfhA1E0LUBXTOlsanJRtaE1j2kUUWcukLED+i9QAILApk68b3L9fb11xbkVJyVf9l+xecJdFQBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3uBL5FAutbAcuk2mL7mdgyp1DKq9WNdRExR6Vr5W1NZf                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 486                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x095c953c26c0b0c2109524731055e15defa9b139583ae80ac513ad82ba327f0c                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768428                                                                             │
│  │ Digest: CghoXg9bdmquxNf2nxq3evXzv46McxZQuEft73s17E4h                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6                         │
│  │ Owner: Shared( 317768428 )                                                                     │
│  │ Version: 317768428                                                                             │
│  │ Digest: 85XyJ6bEcEAiGR5dTSTR5rdZ7G9P1GBQQzx7qQWVuzca                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: F95HpfYqJvCVGx4F7tBMVtNS7qP62oQEND75LZUWrgW5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa4a8a74c2b675ed19dfea36d7be3b558c8a8b72614e5b633a2da0c8b0955737a                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768428                                                                             │
│  │ Digest: 2BrYSDLnQ1U1G3oZzyzT8rjxQS3QCq6Ajvvcza2BELTh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdd19f8c575bc8ae7a3d5e4216d0c8b986aba622c5307dfe25660e9382f751558                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768428                                                                             │
│  │ Digest: FhQ2jfK5MYoVyBL7juxaG3Xd4wJufpor9DTVpdVPNuf5                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768428                                                                             │
│  │ Digest: 835rmqf6x58My9HENj2V6UBGvxHs7yDLYLK3tSMuU4wK                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768428                                                                             │
│  │ Digest: 835rmqf6x58My9HENj2V6UBGvxHs7yDLYLK3tSMuU4wK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 23590400 MIST                                                                    │
│    Computation Cost: 756000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4dtme37qSmePs3adgPXcnLGU571DYxJSWD8J3BthpKhc                                                   │
│    7xVipyUK46Pj6XFoAeeKXYMeHjgGXEvHaNB3eCvHKHvr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                           │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                               │
│  │ EventID: 3uBL5FAutbAcuk2mL7mdgyp1DKq9WNdRExR6Vr5W1NZf:0                                                                         │
│  │ PackageID: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead                                                   │
│  │ Transaction Module: my_nft                                                                                                      │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                      │
│  │ EventType: 0x2::display::DisplayCreated<0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::Github_Nft> │
│  │ ParsedJSON:                                                                                                                     │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                   │
│  │   │ id │ 0xa4a8a74c2b675ed19dfea36d7be3b558c8a8b72614e5b633a2da0c8b0955737a │                                                   │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                   │
│  └──                                                                                                                               │
│  ┌──                                                                                                                               │
│  │ EventID: 3uBL5FAutbAcuk2mL7mdgyp1DKq9WNdRExR6Vr5W1NZf:1                                                                         │
│  │ PackageID: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead                                                   │
│  │ Transaction Module: my_nft                                                                                                      │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                      │
│  │ EventType: 0x2::display::VersionUpdated<0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::Github_Nft> │
│  │ ParsedJSON:                                                                                                                     │
│  │   ┌─────────┬──────────┬───────┬──────────────────────────────────────────────────────┐                                         │
│  │   │ fields  │ contents │ key   │ name                                                 │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {name} ${nft_id}                                     │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ description                                          │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ A NFT for your Github avata                          │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ image_url                                            │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ https://avatars.githubusercontent.com/u/12596742?v=4 │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ creator                                              │                                         │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ This is June5753 MyNFT                               │                                         │
│  │   ├─────────┼──────────┴───────┴──────────────────────────────────────────────────────┤                                         │
│  │   │ id      │ 0xa4a8a74c2b675ed19dfea36d7be3b558c8a8b72614e5b633a2da0c8b0955737a      │                                         │
│  │   ├─────────┼─────────────────────────────────────────────────────────────────────────┤                                         │
│  │   │ version │ 1                                                                       │                                         │
│  │   └─────────┴─────────────────────────────────────────────────────────────────────────┘                                         │
│  └──                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x095c953c26c0b0c2109524731055e15defa9b139583ae80ac513ad82ba327f0c                                               │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                 │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                       │
│  │ Version: 317768428                                                                                                         │
│  │ Digest: CghoXg9bdmquxNf2nxq3evXzv46McxZQuEft73s17E4h                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6                                               │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                 │
│  │ Owner: Shared( 317768428 )                                                                                                 │
│  │ ObjectType: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::MintRecord                         │
│  │ Version: 317768428                                                                                                         │
│  │ Digest: 85XyJ6bEcEAiGR5dTSTR5rdZ7G9P1GBQQzx7qQWVuzca                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xa4a8a74c2b675ed19dfea36d7be3b558c8a8b72614e5b633a2da0c8b0955737a                                               │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                 │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )                              │
│  │ ObjectType: 0x2::display::Display<0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::Github_Nft>  │
│  │ Version: 317768428                                                                                                         │
│  │ Digest: 2BrYSDLnQ1U1G3oZzyzT8rjxQS3QCq6Ajvvcza2BELTh                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xdd19f8c575bc8ae7a3d5e4216d0c8b986aba622c5307dfe25660e9382f751558                                               │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                 │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )                              │
│  │ ObjectType: 0x2::package::Publisher                                                                                        │
│  │ Version: 317768428                                                                                                         │
│  │ Digest: FhQ2jfK5MYoVyBL7juxaG3Xd4wJufpor9DTVpdVPNuf5                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                                               │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                                 │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 317768428                                                                                                         │
│  │ Digest: 835rmqf6x58My9HENj2V6UBGvxHs7yDLYLK3tSMuU4wK                                                                       │
│  └──                                                                                                                          │
│ Published Objects:                                                                                                            │
│  ┌──                                                                                                                          │
│  │ PackageID: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead                                              │
│  │ Version: 1                                                                                                                 │
│  │ Digest: F95HpfYqJvCVGx4F7tBMVtNS7qP62oQEND75LZUWrgW5                                                                       │
│  │ Modules: my_nft                                                                                                            │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -23368280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
                                                                                            
```



# mint

```
sui client call --package $PACKAGE --module $MODULE --function mint --args $MINTRECORD——id（packageid） 名称 url 接收者
```

```
 sui client call --package 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead --module my_nft --function mint --args 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6 "JUNE5753 NFT" "https://avatars.githubusercontent.com/u/12596742?v=4" 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3
Transaction Digest: 9bJ87phAd1EeW4CwzHhLjajVqqn8XvQYtjLqZxYsJHHj
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                   │
│ Gas Owner: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                                │
│ Gas Budget: 6528988 MIST                                                                                     │
│ Gas Price: 756 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                                    │
│  │ Version: 317768428                                                                                        │
│  │ Digest: 835rmqf6x58My9HENj2V6UBGvxHs7yDLYLK3tSMuU4wK                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6              │ │
│ │ 1   Pure Arg: Type: 0x1::string::String, Value: "JUNE5753 NFT"                                           │ │
│ │ 2   Pure Arg: Type: 0x1::string::String, Value: "https://avatars.githubusercontent.com/u/12596742?v=4"   │ │
│ │ 3   Pure Arg: Type: address, Value: "0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    my_nft                                                             │                         │
│ │  │ Package:   0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  │   Input  3                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    6aztRvIzviEHo6k8vPeoyi2RY6OzxUynILZOgKfu+7BpN3PT/v0blLj2hafy/eaT8AIZT0q70hDCtuwbFSmSCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9bJ87phAd1EeW4CwzHhLjajVqqn8XvQYtjLqZxYsJHHj                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 486                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x162fcf3199e2f8b8e963866968d6105412ed460ef8725753b5731704e5e12c6e                         │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )  │
│  │ Version: 317768429                                                                             │
│  │ Digest: DUcf1pc6GeUDTWQbXRvMTDLfsn6ASPXkUBpjPEvQrgMG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe03f2815a615f8d5ce3b594701c3d5bd69bcecbbf4cf9230c91dc50e1fc4748a                         │
│  │ Owner: Object ID: ( 0x22960c326c553fc48c051061916804f1f2f95e21518ff754c55c1dc9fb8d34d3 )       │
│  │ Version: 317768429                                                                             │
│  │ Digest: ESd9pxKdPdL13Q8wfVza5pKZUkzDHewRScD1tfQU6rKF                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768429                                                                             │
│  │ Digest: EnP99fuHZxQgejETBMqbv9zzp2vTLhLHiPgwA2FYYEMj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6                         │
│  │ Owner: Shared( 317768428 )                                                                     │
│  │ Version: 317768429                                                                             │
│  │ Digest: BdvzZ39jva3pS6RQi1CARhuYrPmS2wkS7PHSzts1sBv5                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6                         │
│  │ Version: 317768428                                                                             │
│  │ Digest: 85XyJ6bEcEAiGR5dTSTR5rdZ7G9P1GBQQzx7qQWVuzca                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                         │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ Version: 317768429                                                                             │
│  │ Digest: EnP99fuHZxQgejETBMqbv9zzp2vTLhLHiPgwA2FYYEMj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 6619600 MIST                                                                     │
│    Computation Cost: 756000 MIST                                                                  │
│    Storage Rebate: 2580732 MIST                                                                   │
│    Non-refundable Storage Fee: 26068 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3uBL5FAutbAcuk2mL7mdgyp1DKq9WNdRExR6Vr5W1NZf                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                │
│  │ EventID: 9bJ87phAd1EeW4CwzHhLjajVqqn8XvQYtjLqZxYsJHHj:0                                          │
│  │ PackageID: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead                    │
│  │ Transaction Module: my_nft                                                                       │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                       │
│  │ EventType: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::NFTMinted │
│  │ ParsedJSON:                                                                                      │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐             │
│  │   │ creator   │ 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 │             │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤             │
│  │   │ name      │ JUNE5753 NFT                                                       │             │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤             │
│  │   │ object_id │ 0x162fcf3199e2f8b8e963866968d6105412ed460ef8725753b5731704e5e12c6e │             │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘             │
│  └──                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                       │
│  ┌──                                                                                                   │
│  │ ObjectID: 0x162fcf3199e2f8b8e963866968d6105412ed460ef8725753b5731704e5e12c6e                        │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                          │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )       │
│  │ ObjectType: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::Github_Nft  │
│  │ Version: 317768429                                                                                  │
│  │ Digest: DUcf1pc6GeUDTWQbXRvMTDLfsn6ASPXkUBpjPEvQrgMG                                                │
│  └──                                                                                                   │
│  ┌──                                                                                                   │
│  │ ObjectID: 0xe03f2815a615f8d5ce3b594701c3d5bd69bcecbbf4cf9230c91dc50e1fc4748a                        │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                          │
│  │ Owner: Object ID: ( 0x22960c326c553fc48c051061916804f1f2f95e21518ff754c55c1dc9fb8d34d3 )            │
│  │ ObjectType: 0x2::dynamic_field::Field<address, u64>                                                 │
│  │ Version: 317768429                                                                                  │
│  │ Digest: ESd9pxKdPdL13Q8wfVza5pKZUkzDHewRScD1tfQU6rKF                                                │
│  └──                                                                                                   │
│ Mutated Objects:                                                                                       │
│  ┌──                                                                                                   │
│  │ ObjectID: 0x35a78065a83895f6071f83d60411e550a8c71b3bae3a6b378492af5fcea83e99                        │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                          │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                          │
│  │ Version: 317768429                                                                                  │
│  │ Digest: EnP99fuHZxQgejETBMqbv9zzp2vTLhLHiPgwA2FYYEMj                                                │
│  └──                                                                                                   │
│  ┌──                                                                                                   │
│  │ ObjectID: 0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6                        │
│  │ Sender: 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049                          │
│  │ Owner: Shared( 317768428 )                                                                          │
│  │ ObjectType: 0x70bee25061b84faf1d03692ef5c678fc40ab99207f85255798632d9a5f7d6ead::my_nft::MintRecord  │
│  │ Version: 317768429                                                                                  │
│  │ Digest: BdvzZ39jva3pS6RQi1CARhuYrPmS2wkS7PHSzts1sBv5                                                │
│  └──                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -4794868                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

```cmake
// sui call 中对应 4个参数
    public entry fun mint(mint_record:&mut MintRecord,name:String,image_url:String,recipient: address,ctx:&mut TxContext){
        assert!(!table::contains(&mint_record.record,recipient),EDontMintAgain);
        let nft_id = table::length(&mint_record.record)+1;
        assert!(nft_id <= MAX_SUPPLY,ENotEnoughSupply);
        table::add(&mut mint_record.record,recipient,nft_id);
        let nft:Github_Nft = Github_Nft{
            id:object::new(ctx),
            name,
            image_url,
            nft_id,
            recipient,
            creator:ctx.sender(),
        };
        event::emit(NFTMinted{
            object_id:object::id(&nft),
            name,
            creator:ctx.sender(),
        });
        transfer::public_transfer(nft,recipient);
    }
    // mint中注意 mint_record中的id
//https://suiscan.xyz/mainnet/object/0x519749e34e829531fa9f68405d416e3b4bc20bf36c36d4b39ee16f0da45cd6c6
```

最后成功的nft 地址：

https://suiscan.xyz/mainnet/object/0x162fcf3199e2f8b8e963866968d6105412ed460ef8725753b5731704e5e12c6e