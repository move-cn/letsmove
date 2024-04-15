# Task2

## Faucet

```rust
sui client publish --gas-budget 20000000 --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: 5nM4MqFaB4qLjZyaAS2UEGGWkfdScDeD5cbxCH5sEffu
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6
│
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6
│
│ Gas Budget: 20000000 MIST
│
│ Gas Price: 750 MIST
│
│ Gas Payment:
│
│  ┌──
│
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c
│
│  │ Version: 88253678
│
│  │ Digest: B4QZ1tRppaq7qCCyoeqQ4Uji24BKH1wGaUE9nJ5WUhRo
│
│  └──
│
│
│
│ Transaction Kind: Programmable
│
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects
│ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮
│
│ │ Commands                                                                │
│
│ ├─────────────────────────────────────────────────────────────────────────┤
│
│ │ 0  Publish:                                                             │
│
│ │  ┌                                                                      │
│
│ │  │ Dependencies:                                                        │
│
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │
│
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │
│
│ │  └                                                                      │
│
│ │                                                                         │
│
│ │ 1  TransferObjects:                                                     │
│
│ │  ┌                                                                      │
│
│ │  │ Arguments:                                                           │
│
│ │  │   Result 0                                                           │
│
│ │  │ Address: Input  0                                                    │
│
│ │  └                                                                      │
│
│ ╰─────────────────────────────────────────────────────────────────────────╯
│
│
│
│ Signatures:
│
│    /bJaMki3AVRWH+lobZ7DLcOszeSinf526H5GgU2v/jyau9kO5NtDqkGxT1ItJggy9XrE7HOHSB35RFeDapjaBg==                  │
│
│
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects
│
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5nM4MqFaB4qLjZyaAS2UEGGWkfdScDeD5cbxCH5sEffu
│
│ Status: Success
│
│ Executed Epoch: 366
│
│
│
│ Created Objects:
│
│  ┌──
│
│  │ ID: 0x3304afcefa8d7ccbdcf509de4b137a10b6817b34d85077702738056f4b045fe8
│
│  │ Owner: Immutable
│
│  │ Version: 1
│
│  │ Digest: 5u8crDz4GfuJy9rbqtKoG5n5QM2r5iMFtsVY622FbeHE
│
│  └──
│
│  ┌──
│
│  │ ID: 0x95daced3d343344a4b0e10ca2ec91e9fe0c27f0d73ad81f364d09f6d7fe393dc
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253679
│
│  │ Digest: 986Cn4J2rezbvdDQopXQGF1v91fu1M5Gv8FpFtjsjrjj
│
│  └──
│
│  ┌──
│
│  │ ID: 0xaaee0479f9d6d0ee4e851abea263b559b06fd56f2fac8f3d79db25044ecd4715
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253679
│
│  │ Digest: 3widGkSSoAKcQ7gqZq5jzLuRp15bBxwd5QFyBGExnyEg
│
│  └──
│
│  ┌──
│
│  │ ID: 0xb211d699318f39c9f0869d0bd7c3445b98c0b121b99b4423673f9efc217d1292
│
│  │ Owner: Immutable
│
│  │ Version: 88253679
│
│  │ Digest: APT9LSiFGMFpkAQKfotSSzj3nsynRzQJ7i8sJG3TfRYU
│
│  └──
│
│ Mutated Objects:
│
│  ┌──
│
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253679
│
│  │ Digest: DwTs1uv4pAknDPZ6YEvhDoNTMh4WYGkGASRofgPW1gwn
│
│  └──
│
│ Gas Object:
│
│  ┌──
│
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253679
│
│  │ Digest: DwTs1uv4pAknDPZ6YEvhDoNTMh4WYGkGASRofgPW1gwn
│
│  └──
│
│ Gas Cost Summary:
│
│    Storage Cost: 13391200 MIST
│
│    Computation Cost: 750000 MIST
│
│    Storage Rebate: 978120 MIST
│
│    Non-refundable Storage Fee: 9880 MIST
│
│
│
│ Transaction Dependencies:
│
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN
│
│    8jdj2y7HDWVgxrAs6NzCYEaKKbHfnxoib5qMmVTfmKYh
│
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
│
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
│
│  ┌──
│
│  │ ObjectID: 0x95daced3d343344a4b0e10ca2ec91e9fe0c27f0d73ad81f364d09f6d7fe393dc
│
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap[0x3304afcefa8d7ccbdcf509de4b137a10b6817b34d85077702738056f4b045fe8::fcoin::FCOIN](0x3304afcefa8d7ccbdcf509de4b137a10b6817b34d85077702738056f4b045fe8::fcoin::FCOIN)   │
│  │ Version: 88253679
│
│  │ Digest: 986Cn4J2rezbvdDQopXQGF1v91fu1M5Gv8FpFtjsjrjj
│
│  └──
│
│  ┌──
│
│  │ ObjectID: 0xaaee0479f9d6d0ee4e851abea263b559b06fd56f2fac8f3d79db25044ecd4715
│
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                          │
│  │ ObjectType: 0x2::package::UpgradeCap
│
│  │ Version: 88253679
│
│  │ Digest: 3widGkSSoAKcQ7gqZq5jzLuRp15bBxwd5QFyBGExnyEg
│
│  └──
│
│  ┌──
│
│  │ ObjectID: 0xb211d699318f39c9f0869d0bd7c3445b98c0b121b99b4423673f9efc217d1292
│
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6
│
│  │ Owner: Immutable
│
│  │ ObjectType: 0x2::coin::CoinMetadata[0x3304afcefa8d7ccbdcf509de4b137a10b6817b34d85077702738056f4b045fe8::fcoin::FCOIN](0x3304afcefa8d7ccbdcf509de4b137a10b6817b34d85077702738056f4b045fe8::fcoin::FCOIN)  │
│  │ Version: 88253679
│
│  │ Digest: APT9LSiFGMFpkAQKfotSSzj3nsynRzQJ7i8sJG3TfRYU
│
│  └──
│
│ Mutated Objects:
│
│  ┌──
│
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c
│
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6
│
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                          │
│  │ ObjectType: 0x2::coin::Coin[0x2::sui::SUI](0x2::sui::SUI)
│
│  │ Version: 88253679
│
│  │ Digest: DwTs1uv4pAknDPZ6YEvhDoNTMh4WYGkGASRofgPW1gwn
│
│  └──
│
│ Published Objects:
│
│  ┌──
│
│  │ PackageID: 0x3304afcefa8d7ccbdcf509de4b137a10b6817b34d85077702738056f4b045fe8                                          │
│  │ Version: 1
│
│  │ Digest: 5u8crDz4GfuJy9rbqtKoG5n5QM2r5iMFtsVY622FbeHE
│
│  │ Modules: fcoin
│
│  └──
│
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes
│
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13163080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

## mycoin

```rust
sui client publish --gas-budget 20000000 --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: 6YzC5RKjACwr1CN8B7UtGeB7M4BnpoPDnBezGUQWcpKt
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                              
                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6    
                     │
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6   
                     │
│ Gas Budget: 20000000 MIST                                                     
                     │
│ Gas Price: 750 MIST                                                           
                     │
│ Gas Payment:                                                                  
                     │
│  ┌──                                                                          
                     │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c     
                     │
│  │ Version: 88253672                                                          
                     │
│  │ Digest: 22jbKxtsYrNeurgm7kZgJgmksk9sNu1WYRcvcjroigEc                       
                     │
│  └──                                                                          
                     │
│                                                                               
                     │
│ Transaction Kind: Programmable                                                
                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                               
                   │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮   
                     │
│ │ Commands                                                                │   
                     │
│ ├─────────────────────────────────────────────────────────────────────────┤   
                     │
│ │ 0  Publish:                                                             │   
                     │
│ │  ┌                                                                      │   
                     │
│ │  │ Dependencies:                                                        │   
                     │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │   
                     │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │   
                     │
│ │  └                                                                      │   
                     │
│ │                                                                         │   
                     │
│ │ 1  TransferObjects:                                                     │   
                     │
│ │  ┌                                                                      │   
                     │
│ │  │ Arguments:                                                           │   
                     │
│ │  │   Result 0                                                           │   
                     │
│ │  │ Address: Input  0                                                    │   
                     │
│ │  └                                                                      │   
                     │
│ ╰─────────────────────────────────────────────────────────────────────────╯   
                     │
│                                                                               
                     │
│ Signatures:                                                                   
                     │
│    djVXI8blw1cOcXgRAxoKvEKDwjfXhs9NP1r2cXGhrdBJxQkrORjG2uskGSiS143PyTr9WbA0Y/AvgOv8RGnJDQ==                  │
│                                                                               
                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                           
          │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6YzC5RKjACwr1CN8B7UtGeB7M4BnpoPDnBezGUQWcpKt                          
          │
│ Status: Success                                                               
          │
│ Executed Epoch: 366                                                           
          │
│                                                                               
          │
│ Created Objects:                                                              
          │
│  ┌──                                                                          
          │
│  │ ID: 0x425cef5d3785787007634f3b28dac6223301a28ea09ef18a450290482c53e759     
          │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253673                                                          
          │
│  │ Digest: BrBmR8ZSh55PCEH896mqYV8D3STESGyXVVyuTk8TFp3t                       
          │
│  └──                                                                          
          │
│  ┌──                                                                          
          │
│  │ ID: 0xc426bfddef85111f83ab6ad71c3283c2cc9bc8d4686d44ed0068a063d0a68ca0     
          │
│  │ Owner: Immutable                                                           
          │
│  │ Version: 88253673                                                          
          │
│  │ Digest: FgazsRcQRteWM1PRaeBxzNdraigkVWWEu8uNx3rsSKUz                       
          │
│  └──                                                                          
          │
│  ┌──                                                                          
          │
│  │ ID: 0xc796205cbe3a60f7d0ea70813a5979a68b68d4dec34b1a824c11b30d61e1abf8     
          │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253673                                                          
          │
│  │ Digest: yVuW9Yukodt8u2dynUSxc3HBi6KJ1VccciCDnSoPsWe                        
          │
│  └──                                                                          
          │
│  ┌──                                                                          
          │
│  │ ID: 0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8     
          │
│  │ Owner: Immutable                                                           
          │
│  │ Version: 1                                                                 
          │
│  │ Digest: 2KZGEyVrMqCFKQm4cCvtNbSZXxa41TooasegaRv5PTmY                       
          │
│  └──                                                                          
          │
│ Mutated Objects:                                                              
          │
│  ┌──                                                                          
          │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c     
          │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253673                                                          
          │
│  │ Digest: GJVFSVSV7iMPgqWopmpHnc7YDRLLUqD9pjWaaxFDC1nG                       
          │
│  └──                                                                          
          │
│ Gas Object:                                                                   
          │
│  ┌──                                                                          
          │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c     
          │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253673                                                          
          │
│  │ Digest: GJVFSVSV7iMPgqWopmpHnc7YDRLLUqD9pjWaaxFDC1nG                       
          │
│  └──                                                                          
          │
│ Gas Cost Summary:                                                             
          │
│    Storage Cost: 13368400 MIST                                                
          │
│    Computation Cost: 750000 MIST                                              
          │
│    Storage Rebate: 978120 MIST                                                
          │
│    Non-refundable Storage Fee: 9880 MIST                                      
          │
│                                                                               
          │
│ Transaction Dependencies:                                                     
          │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                               
          │
│    Bknmh2M8N9Q6BBHaLihup9ZcLSKKGhDtbBX4gTR6wSbx                               
          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                
                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                              
                                    │
│  ┌──                                                                          
                                    │
│  │ ObjectID: 0x425cef5d3785787007634f3b28dac6223301a28ea09ef18a450290482c53e759   
                                    │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6   
                                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                       
                                    │
│  │ Version: 88253673                                                          
                                    │
│  │ Digest: BrBmR8ZSh55PCEH896mqYV8D3STESGyXVVyuTk8TFp3t                       
                                    │
│  └──                                                                          
                                    │
│  ┌──                                                                          
                                    │
│  │ ObjectID: 0xc426bfddef85111f83ab6ad71c3283c2cc9bc8d4686d44ed0068a063d0a68ca0   
                                    │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6   
                                    │
│  │ Owner: Immutable                                                           
                                    │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8::mycoin::MYCOIN>  │
│  │ Version: 88253673                                                          
                                    │
│  │ Digest: FgazsRcQRteWM1PRaeBxzNdraigkVWWEu8uNx3rsSKUz                       
                                    │
│  └──                                                                          
                                    │
│  ┌──                                                                          
                                    │
│  │ ObjectID: 0xc796205cbe3a60f7d0ea70813a5979a68b68d4dec34b1a824c11b30d61e1abf8   
                                    │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6   
                                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8::mycoin::MYCOIN>   │
│  │ Version: 88253673                                                          
                                    │
│  │ Digest: yVuW9Yukodt8u2dynUSxc3HBi6KJ1VccciCDnSoPsWe                        
                                    │
│  └──                                                                          
                                    │
│ Mutated Objects:                                                              
                                    │
│  ┌──                                                                          
                                    │
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c   
                                    │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6   
                                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                 
                                    │
│  │ Version: 88253673                                                          
                                    │
│  │ Digest: GJVFSVSV7iMPgqWopmpHnc7YDRLLUqD9pjWaaxFDC1nG                       
                                    │
│  └──                                                                          
                                    │
│ Published Objects:                                                            
                                    │
│  ┌──                                                                          
                                    │
│  │ PackageID: 0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8                                            │
│  │ Version: 1                                                                 
                                    │
│  │ Digest: 2KZGEyVrMqCFKQm4cCvtNbSZXxa41TooasegaRv5PTmY                       
                                    │
│  │ Modules: mycoin                                                            
                                    │
│  └──                                                                          
                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                               
          │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                          
          │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13140280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## transfer

```rust
sui client call --function mint --module mycoin --package 0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8 --gas-budget 5000000 --args 0xc796205cbe3a60f7d0ea70813a5979a68b68d4dec34b1a824c11b30d61e1abf8 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
Transaction Digest: BGvn9UHxTasxAp223bb4PcqzurQpGaCzYVL1axJFX5tJ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮  
│ Transaction Data                                                                                             │  
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤  
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   │  
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                │  
│ Gas Budget: 5000000 MIST                                                                                     │  
│ Gas Price: 750 MIST                                                                                          │  
│ Gas Payment:                                                                                                 │  
│  ┌──                                                                                                         │  
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                                    │  
│  │ Version: 88253679                                                                                         │  
│  │ Digest: DwTs1uv4pAknDPZ6YEvhDoNTMh4WYGkGASRofgPW1gwn                                                      │  
│  └──                                                                                                         │  
│                                                                                                              │  
│ Transaction Kind: Programmable                                                                               │  
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │  
│ │ Input Objects                                                                                            │ │  
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │  
│ │ 0   Imm/Owned Object ID: 0xc796205cbe3a60f7d0ea70813a5979a68b68d4dec34b1a824c11b30d61e1abf8              │ │  
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │  
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │  
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │  
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │  
│ │ Commands                                                                         │                         │  
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │  
│ │ 0  MoveCall:                                                                     │                         │  
│ │  ┌                                                                               │                         │  
│ │  │ Function:  mint                                                               │                         │  
│ │  │ Module:    mycoin                                                             │                         │  
│ │  │ Package:   0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8 │                         │  
│ │  │ Arguments:                                                                    │                         │  
│ │  │   Input  0                                                                    │                         │  
│ │  │   Input  1                                                                    │                         │  
│ │  │   Input  2                                                                    │                         │  
│ │  └                                                                               │                         │  
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │  
│                                                                                                              │  
│ Signatures:                                                                                                  │  
│    g+NfZoB9+37FIajby08dJFTdsG1bst+ykjYlWEjwlzFd+e6+R/OGPnOpAu0dnAdowMpkQLYpz6XjU2EMelkKBQ==                  │  
│                                                                                                              │  
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯  
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BGvn9UHxTasxAp223bb4PcqzurQpGaCzYVL1axJFX5tJ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0688bf8241cec996f1777ab2fad7743e847e15f04fcc9c36b322f9c55f65d2e4                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 88253680                                                                              │
│  │ Digest: 5o7UnKdQT1QNJGWRgjEVu19s3myg77R35tHuxZPxWXFF                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xc796205cbe3a60f7d0ea70813a5979a68b68d4dec34b1a824c11b30d61e1abf8                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253680                                                                              │
│  │ Digest: 3ABw5tQF2iUrFBALo7XstsUViMg4GRcTZPfMcFPQG2i1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253680                                                                              │
│  │ Digest: 4aGkeZRzZEq2Zo7aqJPS2SmNiewgd7q6qYhirSCyZztY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253680                                                                              │
│  │ Digest: 4aGkeZRzZEq2Zo7aqJPS2SmNiewgd7q6qYhirSCyZztY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5nM4MqFaB4qLjZyaAS2UEGGWkfdScDeD5cbxCH5sEffu                                                   │
│    6YzC5RKjACwr1CN8B7UtGeB7M4BnpoPDnBezGUQWcpKt                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  
           │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                
           │
│  ┌──                                                                                                            
           │
│  │ ObjectID: 0x0688bf8241cec996f1777ab2fad7743e847e15f04fcc9c36b322f9c55f65d2e4                                 
           │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   
           │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                
           │
│  │ ObjectType: 0x2::coin::Coin<0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8::mycoin::MYCOIN>         │
│  │ Version: 88253680                                                                                            
           │
│  │ Digest: 5o7UnKdQT1QNJGWRgjEVu19s3myg77R35tHuxZPxWXFF                                                         
           │
│  └──                                                                                                            
           │
│ Mutated Objects:                                                                                                
           │
│  ┌──                                                                                                            
           │
│  │ ObjectID: 0xc796205cbe3a60f7d0ea70813a5979a68b68d4dec34b1a824c11b30d61e1abf8                                 
           │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   
           │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                
           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8::mycoin::MYCOIN>  │
│  │ Version: 88253680                                                                                            
           │
│  │ Digest: 3ABw5tQF2iUrFBALo7XstsUViMg4GRcTZPfMcFPQG2i1                                                         
           │
│  └──                                                                                                            
           │
│  ┌──                                                                                                            
           │
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                                 
           │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   
           │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                
           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   
           │
│  │ Version: 88253680                                                                                            
           │
│  │ Digest: 4aGkeZRzZEq2Zo7aqJPS2SmNiewgd7q6qYhirSCyZztY                                                         
           │
│  └──                                                                                                            
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯    
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ CoinType: 0xe83ebf2446452b1e79f737e61ce1bd099fcadd7af8676be7d17a2e44e2aadad8::mycoin::MYCOIN   │
│  │ Amount: 100                                                                                    │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
