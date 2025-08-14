## task2

```
faucoin TreasuryCap=0x419e0f9f6f28bf07774f8d07c2a1d5f6d28a19743d71014d070b3d073bcae460
my_coin TreasuryCap=0x91bdd3af319b1f000be12b33fe976d0720a9ce7bf25846138856bce20cb17bd0
TO_ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
pack id = 0x70f51c5050034162ccda9951bc32aeea4c2c3cf2ee1d4a7bff675f5e226e8f97
```

转账

```
sui client call --function mint --module my_coin --package 0x70f51c5050034162ccda9951bc32aeea4c2c3cf2ee1d4a7bff675f5e226e8f97 --args 0x91bdd3af319b1f000be12b33fe976d0720a9ce7bf25846138856bce20cb17bd0 100000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
```

结果

```
Transaction Digest: J3UcKrR1XPtCkTD9aVH5fReVbEGMA1uHX3V9jruzUh8y
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                                   │
│ Gas Owner: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x870fc1e09c671e9d7eb288ee420d38f1e506530cd207d42ad6b7447bba527d82                                    │
│  │ Version: 87398823                                                                                         │
│  │ Digest: DC8M9Ji1umDPBBHYWGnXYJ34DSYBE6fAFjLG1Jf8PBWy                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x91bdd3af319b1f000be12b33fe976d0720a9ce7bf25846138856bce20cb17bd0              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    my_coin                                                            │                         │
│ │  │ Package:   0x70f51c5050034162ccda9951bc32aeea4c2c3cf2ee1d4a7bff675f5e226e8f97 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    /nKi3/kf2VCm84T9qAmblPSlq4+bXHpe1lbW0ur2qmzGTYycZap0Kd7LX/AQWMUgUia1OWtPQN1Gp4349kC5AA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: J3UcKrR1XPtCkTD9aVH5fReVbEGMA1uHX3V9jruzUh8y                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 362                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2ec683738bde08c20301b29c5326855404a94e979d9b4ecd04c2bb59f28040dc                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 87398824                                                                              │
│  │ Digest: AoCopcTiRAWoopxnwfStoR8sYPhDHDh7SeTxNEK39iMb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x870fc1e09c671e9d7eb288ee420d38f1e506530cd207d42ad6b7447bba527d82                         │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ Version: 87398824                                                                              │
│  │ Digest: AMhZzP5UfLnvTsL7tS7XxRcSTcjbp3veZerWkxdyJ8FK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x91bdd3af319b1f000be12b33fe976d0720a9ce7bf25846138856bce20cb17bd0                         │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ Version: 87398824                                                                              │
│  │ Digest: DjQB2dpyqfsJRuDsNYhgqjEUDZyBZifGE1YRTUb67JoK                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x870fc1e09c671e9d7eb288ee420d38f1e506530cd207d42ad6b7447bba527d82                         │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ Version: 87398824                                                                              │
│  │ Digest: AMhZzP5UfLnvTsL7tS7XxRcSTcjbp3veZerWkxdyJ8FK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4104000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Gh7YiZ2wqtAryv8FHKnZdbFQK4KDRYLqt2R396cmGAhs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x2ec683738bde08c20301b29c5326855404a94e979d9b4ecd04c2bb59f28040dc                                              │
│  │ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                                                │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x70f51c5050034162ccda9951bc32aeea4c2c3cf2ee1d4a7bff675f5e226e8f97::my_coin::MY_COIN>         │
│  │ Version: 87398824                                                                                                         │
│  │ Digest: AoCopcTiRAWoopxnwfStoR8sYPhDHDh7SeTxNEK39iMb                                                                      │
│  └──                                                                                                                         │
│ Mutated Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x870fc1e09c671e9d7eb288ee420d38f1e506530cd207d42ad6b7447bba527d82                                              │
│  │ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                                                │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                │
│  │ Version: 87398824                                                                                                         │
│  │ Digest: AMhZzP5UfLnvTsL7tS7XxRcSTcjbp3veZerWkxdyJ8FK                                                                      │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x91bdd3af319b1f000be12b33fe976d0720a9ce7bf25846138856bce20cb17bd0                                              │
│  │ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                                                │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x70f51c5050034162ccda9951bc32aeea4c2c3cf2ee1d4a7bff675f5e226e8f97::my_coin::MY_COIN>  │
│  │ Version: 87398824                                                                                                         │
│  │ Digest: DjQB2dpyqfsJRuDsNYhgqjEUDZyBZifGE1YRTUb67JoK                                                                      │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )   │
│  │ CoinType: 0x70f51c5050034162ccda9951bc32aeea4c2c3cf2ee1d4a7bff675f5e226e8f97::my_coin::MY_COIN  │
│  │ Amount: 100000000000                                                                            │
│  └──                                                                                               │
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )   │
│  │ CoinType: 0x2::sui::SUI                                                                         │
│  │ Amount: -2145360                                                                                │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

