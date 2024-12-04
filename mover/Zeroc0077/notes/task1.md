# Task 1

合约源码如下：
```move
module hello::HelloWorld {
    use std::string;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self,UID};

    struct TestObject has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(text: vector<u8>, ctx: &mut TxContext) {
        let object = TestObject {
            id: object::new(ctx),
            text: string::utf8(text),
        };
        transfer::transfer(object,tx_context::sender(ctx));
    }
}
```

本地 build：
```bash
❯ sui move build
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello
```

发布合约：
```bash
❯ sui client publish --gas-budget 50000000 .
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello
Successfully verified dependencies on-chain against source.
Transaction Digest: B3fgcACvZfKrXgi7HRL67PE91JZofRkCxbdwUiApkBdV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                                    │
│  │ Version: 1004565                                                                                          │
│  │ Digest: gyCzF8LboznprwXp64Xwo2oTGdgXJ2mFs6JYB6JYctQ                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6" │ │
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
│    TMAXQdkq9qQsd3TLOujX+b3TSf0j9H5JEYA4MWjmpfThuMkF4j3wf2X7Ij67HsVgqRoE4cnn4OP5YkQsdWdsAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: B3fgcACvZfKrXgi7HRL67PE91JZofRkCxbdwUiApkBdV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 318                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e2869090cc139f2261e3f0904b6a599a8feb5b53b8d7e392c9aec7656a129f6                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 1004566                                                                               │
│  │ Digest: 5jZiqbzunNzRjWZLWsjtFPuwyR4ByyPiPWQ4twpLGJqo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x672625114d409ac01273c1aff18d23c6f62a712df6a30dc01425b37cdb0aec5a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: FEbMhHUMQ3FyKP7diSQeqPcnR8YYjHGYpzzvawsLdM1T                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 1004566                                                                               │
│  │ Digest: 99RZ5Dn43M91oy9rAgprr2XapbNrhTu8SPGLx1Z7Tc5n                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 1004566                                                                               │
│  │ Digest: 99RZ5Dn43M91oy9rAgprr2XapbNrhTu8SPGLx1Z7Tc5n                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7607600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    A65ts5c1cqWVm7pZ39W54yDrqyWBCm6Ux5D8Hi7WGrhN                                                   │
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
│  │ ObjectID: 0x5e2869090cc139f2261e3f0904b6a599a8feb5b53b8d7e392c9aec7656a129f6                  │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                    │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 1004566                                                                              │
│  │ Digest: 5jZiqbzunNzRjWZLWsjtFPuwyR4ByyPiPWQ4twpLGJqo                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                  │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                    │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1004566                                                                              │
│  │ Digest: 99RZ5Dn43M91oy9rAgprr2XapbNrhTu8SPGLx1Z7Tc5n                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x672625114d409ac01273c1aff18d23c6f62a712df6a30dc01425b37cdb0aec5a                 │
│  │ Version: 1                                                                                    │
│  │ Digest: FEbMhHUMQ3FyKP7diSQeqPcnR8YYjHGYpzzvawsLdM1T                                          │
│  │ Modules: HelloWorld                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7629480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用合约函数：
```bash
❯ sui client call --package 0x672625114d409ac01273c1aff18d23c6f62a712df6a30dc01425b37cdb0aec5a --module HelloWorld --function mint --args "zeroc" 
Transaction Digest: J4FooyR7bD2diM6AEfg7DkiVWX2ZpvnyuSBCWGruKdLx
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                  │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                   │
│  │ Version: 1004566                                                                         │
│  │ Digest: 99RZ5Dn43M91oy9rAgprr2XapbNrhTu8SPGLx1Z7Tc5n                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭────────────────────────────────────────────────╮                                          │
│ │ Input Objects                                  │                                          │
│ ├────────────────────────────────────────────────┤                                          │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "zeroc" │                                          │
│ ╰────────────────────────────────────────────────╯                                          │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    HelloWorld                                                         │        │
│ │  │ Package:   0x672625114d409ac01273c1aff18d23c6f62a712df6a30dc01425b37cdb0aec5a │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    k/fK82OBVUJ0LBxnKrIrJhusZuKRKVuN1EZWcdgIj5BVFHTXXlK7yZSZl12mMuUfRI8mQw9A14saxwI/XY96BA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: J4FooyR7bD2diM6AEfg7DkiVWX2ZpvnyuSBCWGruKdLx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 318                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x313d57330d5762388a78442a7ac84980c76018695e4dcfe99e2b554081780699                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 1004567                                                                               │
│  │ Digest: 2doUBDDgfBQpRsMLUqiAvig9pYRnF7zWfPmZony8wBcf                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 1004567                                                                               │
│  │ Digest: 8zbHrfDBQ8YBkDobMHtMNeGHCakaVESKp3hsDy3RJokK                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 1004567                                                                               │
│  │ Digest: 8zbHrfDBQ8YBkDobMHtMNeGHCakaVESKp3hsDy3RJokK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2378800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    B3fgcACvZfKrXgi7HRL67PE91JZofRkCxbdwUiApkBdV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x313d57330d5762388a78442a7ac84980c76018695e4dcfe99e2b554081780699                            │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )           │
│  │ ObjectType: 0x672625114d409ac01273c1aff18d23c6f62a712df6a30dc01425b37cdb0aec5a::HelloWorld::TestObject  │
│  │ Version: 1004567                                                                                        │
│  │ Digest: 2doUBDDgfBQpRsMLUqiAvig9pYRnF7zWfPmZony8wBcf                                                    │
│  └──                                                                                                       │
│ Mutated Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1                            │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                              │
│  │ Version: 1004567                                                                                        │
│  │ Digest: 8zbHrfDBQ8YBkDobMHtMNeGHCakaVESKp3hsDy3RJokK                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2400680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```