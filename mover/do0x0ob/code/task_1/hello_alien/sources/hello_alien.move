module hello_alien::hello_alien {

    use std::string;

    public struct HelloAlienObject has key, store {
        id: UID,
        msg: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let hello = HelloAlienObject {
            id: object::new(ctx),
            msg: string::utf8(b"Hello from Outer Space!")
        };
        transfer::public_transfer(hello, tx_context::sender(ctx));
    }

}


/*
- to deploy the contract, run : `sui client publish --gas-budget 10000000 <path>`
- Outputs:

Transaction Digest: 628mje65tiW4C5KrPM8vi7ajFC6SmbfAjcY3YTDkJ5mv
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                   │
│ Gas Owner: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x9689d2cb60ff8cf1497c6db09f807fd1449024ae208261ac1f6fcc86ea723921                                    │
│  │ Version: 24                                                                                               │
│  │ Digest: 6cgFezJVVX6LVZ9MdrBoFAzn1miAs8vjjGB9JKCinkLW                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb" │ │
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
│    DDNgUA0TeOloM+Vv1uOLxghcYRmRjpNmK2GZUbqqEm0hEC9CG1Wds/mzh8xrAuo1SE0FM/ht6nTZHVAvtFiDBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 628mje65tiW4C5KrPM8vi7ajFC6SmbfAjcY3YTDkJ5mv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 114                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4cccc58689878726416f240af78e1d60bb7f77aa9ea09bdc7db5ee0b71ed1a80                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Fwe2qk766cTfUigDq1AaTEs6f4h7WwQgdpkJf2m65Hrv                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe464b736322dc17ef3a8a12f9bd12f451e58d3b7aea914106d2e6dfae275cb55                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 25                                                                                    │
│  │ Digest: 8af3dJQuBshQPPPxHf8bpJkWcqyxVhpxSbQK6yUg7Syo                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9689d2cb60ff8cf1497c6db09f807fd1449024ae208261ac1f6fcc86ea723921                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 25                                                                                    │
│  │ Digest: C3PxwmS5NyrfX6E4mhNwHUShkT3qRpifiASYWf8dfwSW                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x9689d2cb60ff8cf1497c6db09f807fd1449024ae208261ac1f6fcc86ea723921                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 25                                                                                    │
│  │ Digest: C3PxwmS5NyrfX6E4mhNwHUShkT3qRpifiASYWf8dfwSW                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8033200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    SVDPVMczomSU59QKFcjAhJnknD93EaoYmyP613sdwdr                                                    │
│    7rdLTzTCTqWv2i7DLhfqgibn2E8kBti96J6ig5sWZ7rR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xe464b736322dc17ef3a8a12f9bd12f451e58d3b7aea914106d2e6dfae275cb55                  │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                    │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 25                                                                                   │
│  │ Digest: 8af3dJQuBshQPPPxHf8bpJkWcqyxVhpxSbQK6yUg7Syo                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x9689d2cb60ff8cf1497c6db09f807fd1449024ae208261ac1f6fcc86ea723921                  │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                    │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 25                                                                                   │
│  │ Digest: C3PxwmS5NyrfX6E4mhNwHUShkT3qRpifiASYWf8dfwSW                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x4cccc58689878726416f240af78e1d60bb7f77aa9ea09bdc7db5ee0b71ed1a80                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Fwe2qk766cTfUigDq1AaTEs6f4h7WwQgdpkJf2m65Hrv                                          │
│  │ Modules: hello_alien                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8055080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
*/
