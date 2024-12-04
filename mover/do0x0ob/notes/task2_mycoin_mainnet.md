## My Coin Mainnet Publish Info

**Publish Contract Command**
```bash
sui client publish --skip-dependency-verification
```

```shell
Transaction Digest: 9uJFZcA85AmhZfnHJHtt6F17UMsgw9P3iV4qNHgpqwRs
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                   │
│ Gas Owner: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                │
│ Gas Budget: 16084400 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                    │
│  │ Version: 88811186                                                                                         │
│  │ Digest: FGaiHx7SLxovnqBq4MDJaKvB9XHzCTnXgHF1GvY32XAy                                                      │
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
│    T8fExlrsuVpW1pQl7sHkMivsStSH5GLLQZy6psSwoyGCwP4HARHkSiN0QLtvZfNf2sl6G6GQsHKVevguJ9uNDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9uJFZcA85AmhZfnHJHtt6F17UMsgw9P3iV4qNHgpqwRs                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 393                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x078921f48c9cfd0bbc07f5c0aea6fb6788c7e8c2307599eceb14376f96f47347                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811187                                                                              │
│  │ Digest: BJBTT3T3mmi5mwBcp3XVP4yGnZp7AjfsaLTGRw5NsR51                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: J1uATJp8242BcgA3rAwxn8XbfywR6ew7T6WWFtYbn5pK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x64de96d92a80a05ecf0a10f0ca56b69b7c1a71bd853ceaf3350bf5ffc3ae9c79                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 88811187                                                                              │
│  │ Digest: J4x2pvFdwfSqxxUFbRn8ZhhmYYJvWgPnXmdxYWSNu25p                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd28f295712a6feccda58943468560a27c7328603b5048f410d375f241290a79d                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811187                                                                              │
│  │ Digest: 8cAYGT8a8xaUkDmNfGkpRdRHy2gGUBuAeorDA6mRwbPw                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811187                                                                              │
│  │ Digest: EECiZwfqxNmdZPFfe1sYtob265JJvPpCNvjrVN6mfuS3                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811187                                                                              │
│  │ Digest: EECiZwfqxNmdZPFfe1sYtob265JJvPpCNvjrVN6mfuS3                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14584400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    HoHRSbsTtQjjZUAED2rm4L72ZFhkcSmnPaYpq5NBbPQC                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x078921f48c9cfd0bbc07f5c0aea6fb6788c7e8c2307599eceb14376f96f47347                                               │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                 │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                       │
│  │ Version: 88811187                                                                                                          │
│  │ Digest: BJBTT3T3mmi5mwBcp3XVP4yGnZp7AjfsaLTGRw5NsR51                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x64de96d92a80a05ecf0a10f0ca56b69b7c1a71bd853ceaf3350bf5ffc3ae9c79                                               │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                 │
│  │ Owner: Immutable                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3::my_coin::MY_COIN>  │
│  │ Version: 88811187                                                                                                          │
│  │ Digest: J4x2pvFdwfSqxxUFbRn8ZhhmYYJvWgPnXmdxYWSNu25p                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xd28f295712a6feccda58943468560a27c7328603b5048f410d375f241290a79d                                               │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                 │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3::my_coin::MY_COIN>   │
│  │ Version: 88811187                                                                                                          │
│  │ Digest: 8cAYGT8a8xaUkDmNfGkpRdRHy2gGUBuAeorDA6mRwbPw                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                               │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                 │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 88811187                                                                                                          │
│  │ Digest: EECiZwfqxNmdZPFfe1sYtob265JJvPpCNvjrVN6mfuS3                                                                       │
│  └──                                                                                                                          │
│ Published Objects:                                                                                                            │
│  ┌──                                                                                                                          │
│  │ PackageID: 0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3                                              │
│  │ Version: 1                                                                                                                 │
│  │ Digest: J1uATJp8242BcgA3rAwxn8XbfywR6ew7T6WWFtYbn5pK                                                                       │
│  │ Modules: my_coin                                                                                                           │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14356280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## My_Coin mainnet MINT Info

**Mint CLI Command:** 
```bash
sui client call --package 0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3 --module my_coin --function mint --args 0xd28f295712a6feccda58943468560a27c7328603b5048f410d375f241290a79d 30000000000 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb --gas-budget 10000000
```

**Mint CLI Details**
```bash
Transaction Digest: BYUZsKUWMhjX7MFnJQe8DRSueTRohPEmPcqk7qGudZvs
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                   │
│ Gas Owner: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                    │
│  │ Version: 88811189                                                                                         │
│  │ Digest: C5shh5sPdrdXGNQsfBucHbe2oL2EGsAyTmaMERvms8Cj                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xd28f295712a6feccda58943468560a27c7328603b5048f410d375f241290a79d              │ │
│ │ 1   Pure Arg: Type: u64, Value: "30000000000"                                                            │ │
│ │ 2   Pure Arg: Type: address, Value: "0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    my_coin                                                            │                         │
│ │  │ Package:   0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    FofMjXV4uMM64YUoyp67cuN4CRR1DV71fk2o3rUBln8Elon5wl+Ycblwk92oHkWV0Iy8GxUVbwAiK5NDYXwQDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BYUZsKUWMhjX7MFnJQe8DRSueTRohPEmPcqk7qGudZvs                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 393                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x635c4a39aafd303e370eb0ca5bc39d75162f83759d3788565043df89d8181f59                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811190                                                                              │
│  │ Digest: Cu9h9UnUDQ983d6AbxpoP8rGx35PwYbSwX1NGAmr1f88                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811190                                                                              │
│  │ Digest: ALQ5xkP72QPCoQVKa7jW4dErVKoGvC8aaFU58UpUurGD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd28f295712a6feccda58943468560a27c7328603b5048f410d375f241290a79d                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811190                                                                              │
│  │ Digest: 24CRGAKsqnWzcUsE7NrTH37zMiyB8ZKoczSa89UMBqGa                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811190                                                                              │
│  │ Digest: ALQ5xkP72QPCoQVKa7jW4dErVKoGvC8aaFU58UpUurGD                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4104000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7HxjSZwLjcejxr46zeeaaf9mF5poqvS6AWBd3jtjtLqi                                                   │
│    9uJFZcA85AmhZfnHJHtt6F17UMsgw9P3iV4qNHgpqwRs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x635c4a39aafd303e370eb0ca5bc39d75162f83759d3788565043df89d8181f59                                              │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                             │
│  │ ObjectType: 0x2::coin::Coin<0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3::my_coin::MY_COIN>         │
│  │ Version: 88811190                                                                                                         │
│  │ Digest: Cu9h9UnUDQ983d6AbxpoP8rGx35PwYbSwX1NGAmr1f88                                                                      │
│  └──                                                                                                                         │
│ Mutated Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                              │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                │
│  │ Version: 88811190                                                                                                         │
│  │ Digest: ALQ5xkP72QPCoQVKa7jW4dErVKoGvC8aaFU58UpUurGD                                                                      │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0xd28f295712a6feccda58943468560a27c7328603b5048f410d375f241290a79d                                              │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3::my_coin::MY_COIN>  │
│  │ Version: 88811190                                                                                                         │
│  │ Digest: 24CRGAKsqnWzcUsE7NrTH37zMiyB8ZKoczSa89UMBqGa                                                                      │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )   │
│  │ CoinType: 0x2::sui::SUI                                                                         │
│  │ Amount: -2145360                                                                                │
│  └──                                                                                               │
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )   │
│  │ CoinType: 0x3c682ffbf21b6fd472e282d3c56efd9998ae032e7b683bb2d750517da75119d3::my_coin::MY_COIN  │
│  │ Amount: 30000000000                                                                             │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
```