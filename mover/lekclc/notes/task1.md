## 1 发布
```
sui client publish --gas-budget 20000000 . 
```
## 2 发布后的输出

```
Transaction Digest: 35M4yUQ4ogYukPQB1MdWF8hGhmLCPwac3XrJyQgkEDd5
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                   │
│ Gas Owner: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                                    │
│  │ Version: 767803                                                                                           │
│  │ Digest: 8R6wpQsXMD7h2fZ7gsXfjKLuLfrNS2zybkw9F33baL78                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3" │ │
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
│    ySyAFWqFoMM6SUzpWYr8iJRo0KRi58cSajFTuGCkS1sOV1ukM3proFM8OKew/Mxc1xpIu1S1NFsjJwaWRDUEDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 35M4yUQ4ogYukPQB1MdWF8hGhmLCPwac3XrJyQgkEDd5                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 324                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0c313601fbe90e52f3fb607d4c1163ebfbe5b998f23df490ba44169ec8171d30                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 767804                                                                                │
│  │ Digest: 8VGRG7o9ezpU4XmvNja7XRiRs4HQemDDLanTr3Tx17Jj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4d089c8ae199d2102b999735d3c1e196701b72d7b31d1ad42e89a9677c6ebabb                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: FfmmwX3hdN2FFVbR6ZRodmvv3Kd1vWgQJgnfo64u8cGS                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 767804                                                                                │
│  │ Digest: 9dCWdRHRudAPoo4LFZYXfhkYx6n9DuSAxJwFvu2GRqZp                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 767804                                                                                │
│  │ Digest: 9dCWdRHRudAPoo4LFZYXfhkYx6n9DuSAxJwFvu2GRqZp                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    44VFka255XJyDEV4tLDPEV3ZkycKUbVc1kHV29uwYerS                                                   │
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
│  │ ObjectID: 0x0c313601fbe90e52f3fb607d4c1163ebfbe5b998f23df490ba44169ec8171d30                  │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                    │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 767804                                                                               │
│  │ Digest: 8VGRG7o9ezpU4XmvNja7XRiRs4HQemDDLanTr3Tx17Jj                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                  │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                    │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 767804                                                                               │
│  │ Digest: 9dCWdRHRudAPoo4LFZYXfhkYx6n9DuSAxJwFvu2GRqZp                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x4d089c8ae199d2102b999735d3c1e196701b72d7b31d1ad42e89a9677c6ebabb                 │
│  │ Version: 1                                                                                    │
│  │ Digest: FfmmwX3hdN2FFVbR6ZRodmvv3Kd1vWgQJgnfo64u8cGS                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
可以看到 package ID 为 `0x4d089c8ae199d2102b999735d3c1e196701b72d7b31d1ad42e89a9677c6ebabb`

## 3 调用函数
```
public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
```
使用如下调用
```
sui client call --function mint --module hello_world --package 0x4d089c8ae199d2102b999735d3c1e196701b72d7b31d1ad42e89a9677c6ebabb --gas-budget 300000000
```
执行正确,生成下列信息
```
Transaction Digest: HZh4EyVpgGpeTgYBUBJJozxBkaijsKCVL8cbZZunATh
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                  │
│ Gas Owner: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3               │
│ Gas Budget: 300000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                   │
│  │ Version: 767804                                                                          │
│  │ Digest: 9dCWdRHRudAPoo4LFZYXfhkYx6n9DuSAxJwFvu2GRqZp                                     │
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
│ │  │ Module:    hello_world                                                        │        │
│ │  │ Package:   0x4d089c8ae199d2102b999735d3c1e196701b72d7b31d1ad42e89a9677c6ebabb │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    bZtFBHPvjqPZvK/jYmeVrcCUJOkD79YTRDPd0H93wstOzApVvWAFqn/PVdHfnBYLTHRPzoURZkD87xZGioSXCg== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HZh4EyVpgGpeTgYBUBJJozxBkaijsKCVL8cbZZunATh                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 324                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd9ffc51e54e6b5a4af4167bf1178408dd415ae99554b6deb03ec0041d6922275                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 767805                                                                                │
│  │ Digest: 7bm8jphWWs8PAa4ZdJgS4WGB6gYsUtNUbtXgVnScYfQ3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 767805                                                                                │
│  │ Digest: 45sLXHvDTDtb3y82uasbJUzaE1euvxW2y5v3RCUhs9AV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 767805                                                                                │
│  │ Digest: 45sLXHvDTDtb3y82uasbJUzaE1euvxW2y5v3RCUhs9AV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    35M4yUQ4ogYukPQB1MdWF8hGhmLCPwac3XrJyQgkEDd5                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0xd9ffc51e54e6b5a4af4167bf1178408dd415ae99554b6deb03ec0041d6922275                                   │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                     │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                  │
│  │ ObjectType: 0x4d089c8ae199d2102b999735d3c1e196701b72d7b31d1ad42e89a9677c6ebabb::hello_world::HelloWorldObject  │
│  │ Version: 767805                                                                                                │
│  │ Digest: 7bm8jphWWs8PAa4ZdJgS4WGB6gYsUtNUbtXgVnScYfQ3                                                           │
│  └──                                                                                                              │
│ Mutated Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                                   │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                     │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                     │
│  │ Version: 767805                                                                                                │
│  │ Digest: 45sLXHvDTDtb3y82uasbJUzaE1euvxW2y5v3RCUhs9AV                                                           │
│  └──                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2507080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
此时有一个新的object被创建,ID为`0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7 `