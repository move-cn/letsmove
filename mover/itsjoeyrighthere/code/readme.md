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

## task2

My Coin:
```
/// Module: my_coin
module my_coin::joeycoin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct JOEYCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: JOEYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,                // decimals
            b"JOEY",           // symbol
            b"Joey Coin",       // name
            b"itsjoeyrighthere", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/48686956")), // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    /// Manager can mint new coins
    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<JOEYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<JOEYCOIN>, target: coin::Coin<JOEYCOIN>) {
        coin::burn(treasury_cap, target);
    }
}

```

发布
```
sui client publish 
```

输出
```
Transaction Digest: DNJjg7GgXf4A2GjjLFWdiiW6bRp61YFJSCGrPb7QSucR
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                   │
│ Gas Owner: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                    │
│  │ Version: 94632014                                                                                         │
│  │ Digest: 2qm3otftnxCSEk5kkteHGGUFFeqjgvWdknSMMT3Nxha7                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521" │ │
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
│    YtqeWOj8XgMw9b9FAkhtUYs7XFIqKc96GC8863HMWSi6E/ynSkuP4l6lm1/jt2R+yJ8dqhHv6AAy8ToQ+D5rCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DNJjg7GgXf4A2GjjLFWdiiW6bRp61YFJSCGrPb7QSucR                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x25f8980fc7f85975fa09a93eea80925c765c1eec272019c1a5eea949fab36978                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632015                                                                              │
│  │ Digest: tpRshnDPYyj7exuputfHs7cFsfR8i2EMmkyVouukWnG                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x2c876d31a27c0e3ced1508f1c490f88bc05c21b8d0ca6f83f27e71a42625ee82                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 94632015                                                                              │
│  │ Digest: FZZ9Q5st5WSBiWhLCWfcFKBUoNtpnY4uEjUTqwKRYx5p                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7r6RBgCohGJVcuAKdm4hJiTygbmCn8xAnJpHx5698iBb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf4fa1a54531dd70e1259d79f3d980d6bf5f23e94d9febb75d3bc392f76d5ef35                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632015                                                                              │
│  │ Digest: 75GkHf8xSRW83xpShKUrEgzxP5SbTKw3Sua22kvfujp1                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632015                                                                              │
│  │ Digest: D7sNjsQGBaEJ9nWoxfbKunuR46ztR5aTPwPUzLXi6eMn                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632015                                                                              │
│  │ Digest: D7sNjsQGBaEJ9nWoxfbKunuR46ztR5aTPwPUzLXi6eMn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14956800 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    bnBiUdbBN6gQk6HExYxFrn5C3FVsCyug6wdf7R1AMhd                                                    │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                │
│  ┌──                                                                                                                            │
│  │ ObjectID: 0x25f8980fc7f85975fa09a93eea80925c765c1eec272019c1a5eea949fab36978                                                 │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                   │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                                │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc::joeycoin::JOEYCOIN>   │
│  │ Version: 94632015                                                                                                            │
│  │ Digest: tpRshnDPYyj7exuputfHs7cFsfR8i2EMmkyVouukWnG                                                                          │
│  └──                                                                                                                            │
│  ┌──                                                                                                                            │
│  │ ObjectID: 0x2c876d31a27c0e3ced1508f1c490f88bc05c21b8d0ca6f83f27e71a42625ee82                                                 │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                   │
│  │ Owner: Immutable                                                                                                             │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc::joeycoin::JOEYCOIN>  │
│  │ Version: 94632015                                                                                                            │
│  │ Digest: FZZ9Q5st5WSBiWhLCWfcFKBUoNtpnY4uEjUTqwKRYx5p                                                                         │
│  └──                                                                                                                            │
│  ┌──                                                                                                                            │
│  │ ObjectID: 0xf4fa1a54531dd70e1259d79f3d980d6bf5f23e94d9febb75d3bc392f76d5ef35                                                 │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                   │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                                │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                         │
│  │ Version: 94632015                                                                                                            │
│  │ Digest: 75GkHf8xSRW83xpShKUrEgzxP5SbTKw3Sua22kvfujp1                                                                         │
│  └──                                                                                                                            │
│ Mutated Objects:                                                                                                                │
│  ┌──                                                                                                                            │
│  │ ObjectID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                                 │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                   │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                   │
│  │ Version: 94632015                                                                                                            │
│  │ Digest: D7sNjsQGBaEJ9nWoxfbKunuR46ztR5aTPwPUzLXi6eMn                                                                         │
│  └──                                                                                                                            │
│ Published Objects:                                                                                                              │
│  ┌──                                                                                                                            │
│  │ PackageID: 0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc                                                │
│  │ Version: 1                                                                                                                   │
│  │ Digest: 7r6RBgCohGJVcuAKdm4hJiTygbmCn8xAnJpHx5698iBb                                                                         │
│  │ Modules: joeycoin                                                                                                            │
│  └──                                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14728680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Faucet Coin:
```

/// Module: faucet_coin
module faucet_coin::joeyfaucetcoin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct JOEYFAUCETCOIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: JOEYFAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,                // decimals
            b"JOEYF",           // symbol
            b"Joey Faucet Coin",       // name
            b"itsjoeyrighthere", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/48686956")), // icon url
            ctx
        );
        
        transfer::public_freeze_object(metadata);
        
        transfer::public_share_object(treasury)
    }

    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<JOEYFAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<JOEYFAUCETCOIN>, target: coin::Coin<JOEYFAUCETCOIN>) {
        coin::burn(treasury_cap, target);
    }
}

```

发布
```
sui client publish 
```

输出
```
Transaction Digest: 2qXVbhXwYw4ncZwGn6vW8UKMK1phsWz1nXUeX29NjYQw
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                   │
│ Gas Owner: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                    │
│  │ Version: 94632016                                                                                         │
│  │ Digest: HxrfQNEJmkrU9imZzj7eFi3S3yzjhC19gMPsBvxkAHc1                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521" │ │
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
│    LM0uXXue0opg13kAO4CQQ/93vQc3i4z8YWTBckGemNM3TKwQPMU7luNImteXHiRoYJNdPfMKEWkiUwN5OlcdAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2qXVbhXwYw4ncZwGn6vW8UKMK1phsWz1nXUeX29NjYQw                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x024b1b1b2ad32a86336bc65afe70e8f95ed89489f1f0c82bf20d8dfbc6164d8e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 94632017                                                                              │
│  │ Digest: 95wJ6MRGFvVb8MNmBtmZ9suFwRE7wDdVkhwyFKGYkuAE                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x2187be0d22842a8467b2033c4c2ac3fbf30f4afdd84951ec08899edc1aabcf4e                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 94632017                                                                              │
│  │ Digest: J2MB8e3tH8XGRFBGteJpZyWVmHaU8jATey84hvL7c5Vy                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x493a7f234f147d073112909f1dbe6657b625277c73f63ec6dcf806570119447b                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632017                                                                              │
│  │ Digest: 2aRYQNdwtsHTj8TDaQzUjjQXN8Jg7biu1rYNkXM5B4y2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x88c06e4b5335c32b48333ee79862378b19fcc4842ae55fec129021ff2414cc47                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AhjJQ4FeswBno9Tfc4qEjwYtTKE7TyJCEY2fYEQv4hwb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632017                                                                              │
│  │ Digest: GQJgtz9ipWuhpTyiNbZG1NHebAyX4KiZPbrppVxBCVHz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632017                                                                              │
│  │ Digest: GQJgtz9ipWuhpTyiNbZG1NHebAyX4KiZPbrppVxBCVHz                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15428000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    73Vt6vV1f75avqKdjhWgAvZwuNVGy17Q2rptce2KGsH3                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x024b1b1b2ad32a86336bc65afe70e8f95ed89489f1f0c82bf20d8dfbc6164d8e                                                             │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                               │
│  │ Owner: Immutable                                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x88c06e4b5335c32b48333ee79862378b19fcc4842ae55fec129021ff2414cc47::joeyfaucetcoin::JOEYFAUCETCOIN>  │
│  │ Version: 94632017                                                                                                                        │
│  │ Digest: 95wJ6MRGFvVb8MNmBtmZ9suFwRE7wDdVkhwyFKGYkuAE                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x2187be0d22842a8467b2033c4c2ac3fbf30f4afdd84951ec08899edc1aabcf4e                                                             │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                               │
│  │ Owner: Shared                                                                                                                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x88c06e4b5335c32b48333ee79862378b19fcc4842ae55fec129021ff2414cc47::joeyfaucetcoin::JOEYFAUCETCOIN>   │
│  │ Version: 94632017                                                                                                                        │
│  │ Digest: J2MB8e3tH8XGRFBGteJpZyWVmHaU8jATey84hvL7c5Vy                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x493a7f234f147d073112909f1dbe6657b625277c73f63ec6dcf806570119447b                                                             │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                               │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                     │
│  │ Version: 94632017                                                                                                                        │
│  │ Digest: 2aRYQNdwtsHTj8TDaQzUjjQXN8Jg7biu1rYNkXM5B4y2                                                                                     │
│  └──                                                                                                                                        │
│ Mutated Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                                             │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                               │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                               │
│  │ Version: 94632017                                                                                                                        │
│  │ Digest: GQJgtz9ipWuhpTyiNbZG1NHebAyX4KiZPbrppVxBCVHz                                                                                     │
│  └──                                                                                                                                        │
│ Published Objects:                                                                                                                          │
│  ┌──                                                                                                                                        │
│  │ PackageID: 0x88c06e4b5335c32b48333ee79862378b19fcc4842ae55fec129021ff2414cc47                                                            │
│  │ Version: 1                                                                                                                               │
│  │ Digest: AhjJQ4FeswBno9Tfc4qEjwYtTKE7TyJCEY2fYEQv4hwb                                                                                     │
│  │ Modules: joeyfaucetcoin                                                                                                                  │
│  └──                                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15199880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


发送 My Coin 给地址 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

```
sui client call --package 0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc --module joeycoin  --function mint --args 0x25f8980fc7f85975fa09a93eea80925c765c1eec272019c1a5eea949fab36978 1000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000
```

```
Transaction Digest: 73Vt6vV1f75avqKdjhWgAvZwuNVGy17Q2rptce2KGsH3
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                   │
│ Gas Owner: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                    │
│  │ Version: 94632015                                                                                         │
│  │ Digest: D7sNjsQGBaEJ9nWoxfbKunuR46ztR5aTPwPUzLXi6eMn                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x25f8980fc7f85975fa09a93eea80925c765c1eec272019c1a5eea949fab36978              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000000"                                                             │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    joeycoin                                                           │                         │
│ │  │ Package:   0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    dv6/HImJNGUBntJtWfacQM3dU8abudfucP5L046+XzEUG9P3+1IzTtJmF+QXArrDUVG6GkqO8X7TiFaHnvfLCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 73Vt6vV1f75avqKdjhWgAvZwuNVGy17Q2rptce2KGsH3                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xfadacc8bd85d4f4bd931cfafc8e48450d4c99976b311537b4113df3d2300cd5b                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 94632016                                                                              │
│  │ Digest: 2jhuUqaQq4zM9RnqPgdn4CYj9mAEMgPLcGBjq1dZfEWn                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x25f8980fc7f85975fa09a93eea80925c765c1eec272019c1a5eea949fab36978                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632016                                                                              │
│  │ Digest: GVN3XxSyFKkRq6ofsQP4AJb2rVtmcBFK2gM7ihBVaDU5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632016                                                                              │
│  │ Digest: HxrfQNEJmkrU9imZzj7eFi3S3yzjhC19gMPsBvxkAHc1                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632016                                                                              │
│  │ Digest: HxrfQNEJmkrU9imZzj7eFi3S3yzjhC19gMPsBvxkAHc1                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4134400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2723688 MIST                                                                   │
│    Non-refundable Storage Fee: 27512 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DNJjg7GgXf4A2GjjLFWdiiW6bRp61YFJSCGrPb7QSucR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                               │
│  ┌──                                                                                                                           │
│  │ ObjectID: 0xfadacc8bd85d4f4bd931cfafc8e48450d4c99976b311537b4113df3d2300cd5b                                                │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                  │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                               │
│  │ ObjectType: 0x2::coin::Coin<0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc::joeycoin::JOEYCOIN>         │
│  │ Version: 94632016                                                                                                           │
│  │ Digest: 2jhuUqaQq4zM9RnqPgdn4CYj9mAEMgPLcGBjq1dZfEWn                                                                        │
│  └──                                                                                                                           │
│ Mutated Objects:                                                                                                               │
│  ┌──                                                                                                                           │
│  │ ObjectID: 0x25f8980fc7f85975fa09a93eea80925c765c1eec272019c1a5eea949fab36978                                                │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                  │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                               │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc::joeycoin::JOEYCOIN>  │
│  │ Version: 94632016                                                                                                           │
│  │ Digest: GVN3XxSyFKkRq6ofsQP4AJb2rVtmcBFK2gM7ihBVaDU5                                                                        │
│  └──                                                                                                                           │
│  ┌──                                                                                                                           │
│  │ ObjectID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                                │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                  │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                  │
│  │ Version: 94632016                                                                                                           │
│  │ Digest: HxrfQNEJmkrU9imZzj7eFi3S3yzjhC19gMPsBvxkAHc1                                                                        │
│  └──                                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )     │
│  │ CoinType: 0x2::sui::SUI                                                                           │
│  │ Amount: -2160712                                                                                  │
│  └──                                                                                                 │
│  ┌──                                                                                                 │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )     │
│  │ CoinType: 0x811305a24e28edb4f791b688a027f5775566b47a235274aadaf2f25d885d40bc::joeycoin::JOEYCOIN  │
│  │ Amount: 1000000000                                                                                │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

交易哈希：https://suivision.xyz/txblock/73Vt6vV1f75avqKdjhWgAvZwuNVGy17Q2rptce2KGsH3

## task3

代码：
```
/// Module: task3
module task3::joey_nft {
    use std::string::{Self,utf8};
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::package;
    use sui::display;


    /// 一个允许任何人铸造NFT的示例
    /// An example NFT that can be minted by anybody
    public struct NFT has key, store {
        id: UID,
        /// Name for the token 代币（NFT）名
        name: string::String,
        /// Description of the token 代币（NFT）描述
        description: string::String,
        /// URL for the token 代币（NFT）链接
        image_url: string::String,
        // TODO: allow custom attributes 
    }

    // ===== Events =====  事件

    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT 新铸造的NFT的ID
        object_id: ID,
        // The creator of the NFT 新铸造的NFT的创造者
        creator: address,
        // The name of the NFT 新铸造的NFT的名
        name: string::String,
    }

    // 模块的One-Time-Witness.
    public struct JOEY_NFT has drop {}

    // 显示
    fun init(otw: JOEY_NFT, ctx: &mut TxContext) {
        let keys = vector[utf8(b"name"), utf8(b"description"), utf8(b"image_url")];
        let values = vector[utf8(b"{name}"), utf8(b"{description}"), utf8(b"{image_url}")];
        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<NFT>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    // ===== Public view functions ===== 公共视图函数


    /// 获取NFT的名称
    /// Get the NFT's `name` 
    public fun name(nft: &NFT): &string::String {
        &nft.name
    }
    
    /// 获取NFT的介绍
    /// Get the NFT's `description`
    public fun description(nft: &NFT): &string::String {
        &nft.description
    }

    /// 获取NFT的链接
    /// Get the NFT's `url`
    public fun image_url(nft: &NFT): &string::String{
        &nft.image_url
    }

    // ===== Entrypoints ===== 入口函数

    /// 创建新的NFT
    /// Create a new devnet_nft
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            image_url: string::utf8(image_url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// 转移NFT给新的所有者
    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// 更新NFT的介绍
    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// 永久删除NFT
    /// Permanently delete `nft`
    public entry fun burn(nft: NFT, _: &mut TxContext) {
        let NFT { id, name: _, description: _, image_url: _ } = nft;
        object::delete(id)
    }
}
```

发布：
```
sui client publish 
```

输出：
```
Transaction Digest: AkZsQvRnUDsNFSYQWubuF5fAGC9wQwCZy4CiWfd3Ustp
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                   │
│ Gas Owner: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                    │
│  │ Version: 94632018                                                                                         │
│  │ Digest: Gmka8qn7ZzSjt2pe2SPdTWnKKSJcefW8yxfF8piauWMx                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521" │ │
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
│    0v8exqdWAeN68kwuk0wwPuG7ei9jPYrBc6B3S6KkaYaaPAkotb/0sh4o2OWBXzm72kPCW3vDwEjjmI69enB9Cg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AkZsQvRnUDsNFSYQWubuF5fAGC9wQwCZy4CiWfd3Ustp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa303f3bb3b87d7e5f0d11a2247ebe4676f8cdf0a4cf22ada7769096e9d9f9d5b                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632019                                                                              │
│  │ Digest: BzXs2QGRaUr3bCyrvbC76K1rdFqjvrXj88QdMeticiGA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc1b78d4f980de24668ade1586bfe9eaa90d63b3aeefec4feb88339d6c2a3d347                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632019                                                                              │
│  │ Digest: AMN2hHoouKdHMg6wHfjuiPRC2rCjYpTCEGNNTzfU23no                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 77BaQBMwhFqVDiBgWinmK7sBq4vu19Kp6EMnsFcjB3P5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd7aa63282c5e4758f043e0bffe4ff4b0cbb7788f08f12c0297546d0e6febc5fb                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632019                                                                              │
│  │ Digest: CYEhemXY66FVku8YX5KmpRm1bJQJNLHJjxMibBnhBRqo                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632019                                                                              │
│  │ Digest: 6RP5LwZzPY3HLrP9idQc4aQ5JFbwNyVcB1429rzry1yP                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632019                                                                              │
│  │ Digest: 6RP5LwZzPY3HLrP9idQc4aQ5JFbwNyVcB1429rzry1yP                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 18065200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    swSZyqMGLrVHCBf4PESfm6jgm1qAjmaZKgwrGWNraZf                                                    │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                          │
│  │ EventID: AkZsQvRnUDsNFSYQWubuF5fAGC9wQwCZy4CiWfd3Ustp:0                                                                    │
│  │ PackageID: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46                                              │
│  │ Transaction Module: joey_nft                                                                                               │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                 │
│  │ EventType: 0x2::display::DisplayCreated<0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46::joey_nft::NFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                              │
│  │   │ id │ 0xa303f3bb3b87d7e5f0d11a2247ebe4676f8cdf0a4cf22ada7769096e9d9f9d5b │                                              │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                              │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ EventID: AkZsQvRnUDsNFSYQWubuF5fAGC9wQwCZy4CiWfd3Ustp:1                                                                    │
│  │ PackageID: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46                                              │
│  │ Transaction Module: joey_nft                                                                                               │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                                 │
│  │ EventType: 0x2::display::VersionUpdated<0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46::joey_nft::NFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                         │
│  │   │ fields  │ contents │ key   │ name                                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {name}                                          │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ description                                     │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {description}                                   │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ image_url                                       │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {image_url}                                     │                                         │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                         │
│  │   │ id      │ 0xa303f3bb3b87d7e5f0d11a2247ebe4676f8cdf0a4cf22ada7769096e9d9f9d5b │                                         │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                         │
│  │   │ version │ 1                                                                  │                                         │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                         │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xa303f3bb3b87d7e5f0d11a2247ebe4676f8cdf0a4cf22ada7769096e9d9f9d5b                                          │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                            │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                         │
│  │ ObjectType: 0x2::display::Display<0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46::joey_nft::NFT>  │
│  │ Version: 94632019                                                                                                     │
│  │ Digest: BzXs2QGRaUr3bCyrvbC76K1rdFqjvrXj88QdMeticiGA                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xc1b78d4f980de24668ade1586bfe9eaa90d63b3aeefec4feb88339d6c2a3d347                                          │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                            │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                         │
│  │ ObjectType: 0x2::package::Publisher                                                                                   │
│  │ Version: 94632019                                                                                                     │
│  │ Digest: AMN2hHoouKdHMg6wHfjuiPRC2rCjYpTCEGNNTzfU23no                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xd7aa63282c5e4758f043e0bffe4ff4b0cbb7788f08f12c0297546d0e6febc5fb                                          │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                            │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                         │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                  │
│  │ Version: 94632019                                                                                                     │
│  │ Digest: CYEhemXY66FVku8YX5KmpRm1bJQJNLHJjxMibBnhBRqo                                                                  │
│  └──                                                                                                                     │
│ Mutated Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                          │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                            │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                            │
│  │ Version: 94632019                                                                                                     │
│  │ Digest: 6RP5LwZzPY3HLrP9idQc4aQ5JFbwNyVcB1429rzry1yP                                                                  │
│  └──                                                                                                                     │
│ Published Objects:                                                                                                       │
│  ┌──                                                                                                                     │
│  │ PackageID: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46                                         │
│  │ Version: 1                                                                                                            │
│  │ Digest: 77BaQBMwhFqVDiBgWinmK7sBq4vu19Kp6EMnsFcjB3P5                                                                  │
│  │ Modules: joey_nft                                                                                                     │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -17837080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用：
```
sui client call --function mint_to_sender --module joey_nft --package 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46 --args Joey itsjoeyrighthere https://avatars.githubusercontent.com/u/48686956 
```

```
Transaction Digest: 3gCSBRJDLjKG6qsx3SnVKkxEwXQZc38qr6CN8QremTkM
╭───────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                              │
├───────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                    │
│ Gas Owner: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                 │
│ Gas Budget: 100000000 MIST                                                                    │
│ Gas Price: 750 MIST                                                                           │
│ Gas Payment:                                                                                  │
│  ┌──                                                                                          │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                     │
│  │ Version: 94632019                                                                          │
│  │ Digest: 6RP5LwZzPY3HLrP9idQc4aQ5JFbwNyVcB1429rzry1yP                                       │
│  └──                                                                                          │
│                                                                                               │
│ Transaction Kind: Programmable                                                                │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                             │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "Joey"                                             │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "itsjoeyrighthere"                                 │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/u/48686956" │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮          │
│ │ Commands                                                                         │          │
│ ├──────────────────────────────────────────────────────────────────────────────────┤          │
│ │ 0  MoveCall:                                                                     │          │
│ │  ┌                                                                               │          │
│ │  │ Function:  mint_to_sender                                                     │          │
│ │  │ Module:    joey_nft                                                           │          │
│ │  │ Package:   0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46 │          │
│ │  │ Arguments:                                                                    │          │
│ │  │   Input  0                                                                    │          │
│ │  │   Input  1                                                                    │          │
│ │  │   Input  2                                                                    │          │
│ │  └                                                                               │          │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯          │
│                                                                                               │
│ Signatures:                                                                                   │
│    0ZsCRCrqJyWLaXK1mhUBmb1h9hWMezWOrQV00xGrjtH4p6MV9sohz821CmyFzve5DeE7lbj7eaGRS0EUy2MbAw==   │
│                                                                                               │
╰───────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3gCSBRJDLjKG6qsx3SnVKkxEwXQZc38qr6CN8QremTkM                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 374                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632020                                                                              │
│  │ Digest: D6uDSCtbxLjhXq4ty88uTv6QeGPAmfyCBY523wCWpFcv                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632020                                                                              │
│  │ Digest: Ej1K8AknsXYfST6DEUoddFFZsyBc3764oNZoZc8nt497                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632020                                                                              │
│  │ Digest: Ej1K8AknsXYfST6DEUoddFFZsyBc3764oNZoZc8nt497                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2804400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AkZsQvRnUDsNFSYQWubuF5fAGC9wQwCZy4CiWfd3Ustp                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                              │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                  │
│  │ EventID: 3gCSBRJDLjKG6qsx3SnVKkxEwXQZc38qr6CN8QremTkM:0                                            │
│  │ PackageID: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46                      │
│  │ Transaction Module: joey_nft                                                                       │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                         │
│  │ EventType: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46::joey_nft::NFTMinted │
│  │ ParsedJSON:                                                                                        │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐               │
│  │   │ creator   │ 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 │               │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤               │
│  │   │ name      │ Joey                                                               │               │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤               │
│  │   │ object_id │ 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc │               │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ObjectID: 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc                   │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                     │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ ObjectType: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46::joey_nft::NFT  │
│  │ Version: 94632020                                                                              │
│  │ Digest: D6uDSCtbxLjhXq4ty88uTv6QeGPAmfyCBY523wCWpFcv                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ObjectID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                   │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                     │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                     │
│  │ Version: 94632020                                                                              │
│  │ Digest: Ej1K8AknsXYfST6DEUoddFFZsyBc3764oNZoZc8nt497                                           │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2576280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

交易哈希：https://suivision.xyz/txblock/3gCSBRJDLjKG6qsx3SnVKkxEwXQZc38qr6CN8QremTkM?tab=Overview

将 nft 发送到地址: 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```
sui client call --function transfer --module joey_nft --package 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46 --args 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
```

输出
```
Transaction Digest: Enjb6hsVv7ym2yXtHsmpB9dRDkE4PSaEukft9MY14jhv
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                   │
│ Gas Owner: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                                    │
│  │ Version: 94632020                                                                                         │
│  │ Digest: Ej1K8AknsXYfST6DEUoddFFZsyBc3764oNZoZc8nt497                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    joey_nft                                                           │                         │
│ │  │ Package:   0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    BJC47O5L8gLwzNyJbEIYbznVKUOjDjBiwdXoah0wHb16BWqv42XI3v2pPA17trruN9jeikYZEvA/Dyyr5BDJAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Enjb6hsVv7ym2yXtHsmpB9dRDkE4PSaEukft9MY14jhv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 374                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632021                                                                              │
│  │ Digest: ujaPAQRfnWPjHj8eva3ooFEGRXNC3ycQHVfePF86rZK                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 94632021                                                                              │
│  │ Digest: 3fvW6f8Fox4Uzqxd9ZC56PvifRprJ1gCrmedpjwZnrjs                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                         │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ Version: 94632021                                                                              │
│  │ Digest: ujaPAQRfnWPjHj8eva3ooFEGRXNC3ycQHVfePF86rZK                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2804400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2776356 MIST                                                                   │
│    Non-refundable Storage Fee: 28044 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3gCSBRJDLjKG6qsx3SnVKkxEwXQZc38qr6CN8QremTkM                                                   │
│    AkZsQvRnUDsNFSYQWubuF5fAGC9wQwCZy4CiWfd3Ustp                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ObjectID: 0x3b10c3bcbf51fe73a4f8c91449245dad17e9584a8f1f9339582038168680b9ac                   │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                     │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                     │
│  │ Version: 94632021                                                                              │
│  │ Digest: ujaPAQRfnWPjHj8eva3ooFEGRXNC3ycQHVfePF86rZK                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ObjectID: 0xa087e182045a818db3ce431b2089afff87cd279e95c7d4e3bf52dbe67bb087cc                   │
│  │ Sender: 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521                     │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ ObjectType: 0xc4f7a839784cb5dc03a6a06e2c5b6c8b00b74c1360da77be1279deed47f72b46::joey_nft::NFT  │
│  │ Version: 94632021                                                                              │
│  │ Digest: 3fvW6f8Fox4Uzqxd9ZC56PvifRprJ1gCrmedpjwZnrjs                                           │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x06fa2f9e678ecd6fbe9d91296aa831620979648aa4acbf748e0e9b31203a2521 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -778044                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

转账哈希：https://suivision.xyz/txblock/Enjb6hsVv7ym2yXtHsmpB9dRDkE4PSaEukft9MY14jhv
