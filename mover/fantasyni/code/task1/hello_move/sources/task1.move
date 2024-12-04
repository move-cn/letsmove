module hello_move::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"move"),
        };
        transfer(hello_move, sender(ctx));
    }
}

// sui move build --skip-fetch-latest-git-deps
// sui client publish  --skip-fetch-latest-git-deps

/*
PS F:\sui\letsmove\mover\fantasyni\code\task1\hello_move> sui client publish  --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
warning[W02021]: duplicate alias
  ┌─ F:sui\letsmove\mover\fantasyni\code\task1\hello_move\sources\task1.move:3:23
  │
3 │     use sui::object::{Self,UID};
  │                       ^^^^ Unnecessary alias 'object' for module 'sui::object'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W02021]: duplicate alias
  ┌─ F:sui\letsmove\mover\fantasyni\code\task1\hello_move\sources\task1.move:3:28
  │
3 │     use sui::object::{Self,UID};
  │                            ^^^ Unnecessary alias 'UID' for module member 'sui::object::UID'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W02021]: duplicate alias
  ┌─ F:sui\letsmove\mover\fantasyni\code\task1\hello_move\sources\task1.move:5:27
  │
5 │     use sui::tx_context::{TxContext, sender};
  │                           ^^^^^^^^^ Unnecessary alias 'TxContext' for module member 'sui::tx_context::TxContext'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Transaction Digest: 75pPqQvjTg45GsQ6uhVEZen1kavWAhbNqXiyHnEAeXHN
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7                                   │
│ Gas Owner: 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaefa1c84257836260bc7672dc821a59d638241efa16bf592cc17be4f4cd7057e                                    │
│  │ Version: 655678                                                                                           │
│  │ Digest: 6F4AREKFe6jarKT3GJNhMyKbqvX1v1PRq3sUt78YDkhp                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7" │ │
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
│    Y0JmM+L6nG6lLoqsqi8S6POP2BgBwMFUxH2PRr+sCkkj4Gig5WbejdPQDCnDNn+STwG13hzfZ6XM459HHGQyHQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 75pPqQvjTg45GsQ6uhVEZen1kavWAhbNqXiyHnEAeXHN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1e0c3036a355a363d3a18fb38953e948156d81481db6bf98fcb235d4e61ab73a                         │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 )  │
│  │ Version: 655679                                                                                │
│  │ Digest: 6exxddbrQuYwKq2EGeak2mifFc2DoA79Dh4ZP5fgQD9X                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x71623995db2f6d0b6fb3712cb60e8919914889b9572cd9318282f23cdbd10111                         │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 )  │
│  │ Version: 655679                                                                                │
│  │ Digest: 5s5eJqywr2hRAm32f4Kphk4d8HxHoawr65nxWDGNz6xJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x92bf49cb525abe746cf0d6d628a240455f6c274ef0cbf26f9dba10a7d2a12ce0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4sbwkG9FbJjXwmy3LSbjKHn9MDaCsButRqqo4K8a1eDx                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaefa1c84257836260bc7672dc821a59d638241efa16bf592cc17be4f4cd7057e                         │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 )  │
│  │ Version: 655679                                                                                │
│  │ Digest: CVUQHv26qsypYbMesxnBLgrtk3ZG1w2BGLJUwnTBEou                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaefa1c84257836260bc7672dc821a59d638241efa16bf592cc17be4f4cd7057e                         │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 )  │
│  │ Version: 655679                                                                                │
│  │ Digest: CVUQHv26qsypYbMesxnBLgrtk3ZG1w2BGLJUwnTBEou                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8770400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    DjLiKDiE8pUb8my4aCucG5MD8jX6UVMc81Mhem6UcAyd                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x1e0c3036a355a363d3a18fb38953e948156d81481db6bf98fcb235d4e61ab73a                  │
│  │ Sender: 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7                    │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 655679                                                                               │
│  │ Digest: 6exxddbrQuYwKq2EGeak2mifFc2DoA79Dh4ZP5fgQD9X                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0x71623995db2f6d0b6fb3712cb60e8919914889b9572cd9318282f23cdbd10111                  │
│  │ Sender: 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7                    │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 ) │
│  │ ObjectType: 0x92bf49cb525abe746cf0d6d628a240455f6c274ef0cbf26f9dba10a7d2a12ce0::hello::Hello  │
│  │ Version: 655679                                                                               │
│  │ Digest: 5s5eJqywr2hRAm32f4Kphk4d8HxHoawr65nxWDGNz6xJ                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xaefa1c84257836260bc7672dc821a59d638241efa16bf592cc17be4f4cd7057e                  │
│  │ Sender: 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7                    │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 655679                                                                               │
│  │ Digest: CVUQHv26qsypYbMesxnBLgrtk3ZG1w2BGLJUwnTBEou                                           │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x92bf49cb525abe746cf0d6d628a240455f6c274ef0cbf26f9dba10a7d2a12ce0                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 4sbwkG9FbJjXwmy3LSbjKHn9MDaCsButRqqo4K8a1eDx                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x27067bf2d9988d7beff9c0278c49548d39eb38978905bbcbe39d2bf2ee18d4a7 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8792280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
*/