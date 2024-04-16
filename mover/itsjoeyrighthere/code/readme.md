# Note

## task 1
创建项目
```
sui move new task1 
```

代码
```
module task1::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun hello(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello itsjoeyrighthere!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}
```

编译
```
sui move build
```

发布
```
sui client publish --gas-budget 10000000
```

输出
```
Transaction Digest: 6XpAb8aLS5C7tH8Eh386GsbB1VKCgu7ucRxUnKMMom6p
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                   │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                                    │
│  │ Version: 26404381                                                                                         │
│  │ Digest: 2hQX4q9JbdR2NqTuT6CyAwLZBTdsppdCbw11TwfhTRNc                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583" │ │
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
│    ykurku1MGNA5jsaLVbBSjYZyuNfp2N7JHx6sDtVSR9lmNXfASK8Vrrvp2QmLd/7KR5kCWyw7wE31Cdnd25T28g==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6XpAb8aLS5C7tH8Eh386GsbB1VKCgu7ucRxUnKMMom6p                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 340                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x195e48790b41ec01acb5ed6d67b15eb5f65381a8f5d688706ddda3c6c59525cc                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: J3Waute7DQDXQsFD3v61NY72Q8wbYPHiZNeGLQeyCGba                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x28e940bcad39ba773d34fa0711e045f1ae0c15b884b8ebf6be8f409c01223a66                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 26404382                                                                              │
│  │ Digest: 8Q9YSQKDvEhnzFSMsbB3rHjYY7cWNqpTdmE4wgYFGm4p                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 26404382                                                                              │
│  │ Digest: Ba84sLyGCoEqUFNaZzvq38ieL7SgFiy1DDwaxE2Auf2D                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 26404382                                                                              │
│  │ Digest: Ba84sLyGCoEqUFNaZzvq38ieL7SgFiy1DDwaxE2Auf2D                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8040800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    8yJTaipfFRVsxtx4u79w1HPvoz8WxDgVHL6QiMBLzG1n                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x28e940bcad39ba773d34fa0711e045f1ae0c15b884b8ebf6be8f409c01223a66                  │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                    │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 26404382                                                                             │
│  │ Digest: 8Q9YSQKDvEhnzFSMsbB3rHjYY7cWNqpTdmE4wgYFGm4p                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                  │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                    │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 26404382                                                                             │
│  │ Digest: Ba84sLyGCoEqUFNaZzvq38ieL7SgFiy1DDwaxE2Auf2D                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x195e48790b41ec01acb5ed6d67b15eb5f65381a8f5d688706ddda3c6c59525cc                 │
│  │ Version: 1                                                                                    │
│  │ Digest: J3Waute7DQDXQsFD3v61NY72Q8wbYPHiZNeGLQeyCGba                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8062680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用
```
sui client call --package 0x195e48790b41ec01acb5ed6d67b15eb5f65381a8f5d688706ddda3c6c59525cc --module hello_world --function mint --gas-budget 10000000
```

输出
```
Transaction Digest: FTDab8G23wDXow1Q7VYQQ1fR7ohF3Dht5SnKHQgnbRGv
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                  │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                   │
│  │ Version: 26404382                                                                        │
│  │ Digest: Ba84sLyGCoEqUFNaZzvq38ieL7SgFiy1DDwaxE2Auf2D                                     │
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
│ │  │ Package:   0x195e48790b41ec01acb5ed6d67b15eb5f65381a8f5d688706ddda3c6c59525cc │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    4aPMONz2qS/eYX1ItBw1P5AxBC3od67zJomRfsOvor4+tRH8svA2R9IPleQaeSJm/A/OkC9iZo+UAYX3C5NBLQ== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FTDab8G23wDXow1Q7VYQQ1fR7ohF3Dht5SnKHQgnbRGv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 340                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x531fb1749555d6de286c48ee40ddfb0ee4c91035ea5fb0407f10cc359d237384                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 26404383                                                                              │
│  │ Digest: FUKncf9Hmb3WByjGN7FW1SzcZL1berrTV8k1BUH5CfgZ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 26404383                                                                              │
│  │ Digest: F6Y3qy3di8UdQv6QpmCzX3SnWtu3Cxvi48MtfX1a32wb                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 26404383                                                                              │
│  │ Digest: F6Y3qy3di8UdQv6QpmCzX3SnWtu3Cxvi48MtfX1a32wb                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2568800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6XpAb8aLS5C7tH8Eh386GsbB1VKCgu7ucRxUnKMMom6p                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x531fb1749555d6de286c48ee40ddfb0ee4c91035ea5fb0407f10cc359d237384                                   │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                     │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )                  │
│  │ ObjectType: 0x195e48790b41ec01acb5ed6d67b15eb5f65381a8f5d688706ddda3c6c59525cc::hello_world::HelloWorldObject  │
│  │ Version: 26404383                                                                                              │
│  │ Digest: FUKncf9Hmb3WByjGN7FW1SzcZL1berrTV8k1BUH5CfgZ                                                           │
│  └──                                                                                                              │
│ Mutated Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x33c2b630557a4efa4d5391921e42193d4855d44ce8f56e7d12f5f31227482b3c                                   │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                     │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                     │
│  │ Version: 26404383                                                                                              │
│  │ Digest: F6Y3qy3di8UdQv6QpmCzX3SnWtu3Cxvi48MtfX1a32wb                                                           │
│  └──                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2590680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

[suiexplorer](https://suiexplorer.com/object/0x74e3c292713101af2788f146312edf11855ed44b13436793878edf134c8f8c08?network=testnet)

