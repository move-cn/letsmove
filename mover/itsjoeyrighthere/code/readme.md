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
sui client publish --gas-budget 100000000
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
sui client publish --gas-budget 100000000
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