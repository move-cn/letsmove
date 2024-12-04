publish:

```

@Euraxluo ➜ .../mover/euraxluo/code/task2 (main) $ ./publish.sh 
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.23.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: AMRALvjWcSun8weKHPHrtJDQrcaSvWbDh1Spbtm3scjV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                   │
│ Gas Owner: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                                    │
│  │ Version: 97059562                                                                                         │
│  │ Digest: gg7UTWVuQG8Ffi9pnbAzViyuGp89zSryvv4ktFZQyeW                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3" │ │
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
│    YTx8vzJV7kOkqj9mJVmDaw7EFFG691np4RfZP8/SsHESiodceqt7mMkz9mdDG3vxkSN1tCyw18L7ClusGnFWBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AMRALvjWcSun8weKHPHrtJDQrcaSvWbDh1Spbtm3scjV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 379                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4a342dd19869cb6669b84ce638a33ce47b41448383f0eb02018e3cefc976abca                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 97059563                                                                              │
│  │ Digest: EEjpMYrPsJQXzuEp2bLdwV8UTvBwzGNTADn4f7VgteV4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x58af22ef3758b90adf30f8775a2499be424880b27ba96a2c389e1bd5d5197847                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059563                                                                              │
│  │ Digest: 7YGHBcAjVdwKPRKn1JGBpLUEKqFShMK3n9ryCzdMZqV5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x767269fbec74859df227c458a9ba1894eeece6948de2a65ae62aca64694ff905                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059563                                                                              │
│  │ Digest: AReJ7p51wYeUfwQWBTiJeyT86vzbDYjeQR32SmGq9KVN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9866301dca5553212ffedc27ad3077bfc84739080b68844d877065accb5aaf9a                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 97059563                                                                              │
│  │ Digest: 9nqD5TFsf65p7eNZdh2kNDwyvdMS6aQWNsdDZrHCEbFQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7smKvF2KNJZzeFKhCRsBA8u43CaFHWSvHcwz2fZk79HD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbfe3351707d930a18b04a5d72724403d8df8020a8ba048941b45cf4de9ed5cbe                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 97059563                                                                              │
│  │ Digest: D4aamRjDr31gXF4hYaiMQHFTsT8qxHSkJCFEy8Wd1s9f                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059563                                                                              │
│  │ Digest: GrbZPYB3WQgcjNfbUhFEHin53A6JuWPTYuQGJi1WDP88                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059563                                                                              │
│  │ Digest: GrbZPYB3WQgcjNfbUhFEHin53A6JuWPTYuQGJi1WDP88                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25840000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    65HuFk3zt3E2Ypy7cvSHcGejQycTRZe8QnKJfnF9jKDQ                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x4a342dd19869cb6669b84ce638a33ce47b41448383f0eb02018e3cefc976abca                                                     │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::faucetcoin::FAUCETCOIN>  │
│  │ Version: 97059563                                                                                                                │
│  │ Digest: EEjpMYrPsJQXzuEp2bLdwV8UTvBwzGNTADn4f7VgteV4                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x58af22ef3758b90adf30f8775a2499be424880b27ba96a2c389e1bd5d5197847                                                     │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                                       │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::mycoin::MYCOIN>           │
│  │ Version: 97059563                                                                                                                │
│  │ Digest: 7YGHBcAjVdwKPRKn1JGBpLUEKqFShMK3n9ryCzdMZqV5                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x767269fbec74859df227c458a9ba1894eeece6948de2a65ae62aca64694ff905                                                     │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                                       │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )                                    │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                             │
│  │ Version: 97059563                                                                                                                │
│  │ Digest: AReJ7p51wYeUfwQWBTiJeyT86vzbDYjeQR32SmGq9KVN                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x9866301dca5553212ffedc27ad3077bfc84739080b68844d877065accb5aaf9a                                                     │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                                       │
│  │ Owner: Shared                                                                                                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::faucetcoin::FAUCETCOIN>   │
│  │ Version: 97059563                                                                                                                │
│  │ Digest: 9nqD5TFsf65p7eNZdh2kNDwyvdMS6aQWNsdDZrHCEbFQ                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xbfe3351707d930a18b04a5d72724403d8df8020a8ba048941b45cf4de9ed5cbe                                                     │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::mycoin::MYCOIN>          │
│  │ Version: 97059563                                                                                                                │
│  │ Digest: D4aamRjDr31gXF4hYaiMQHFTsT8qxHSkJCFEy8Wd1s9f                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                                                     │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                                       │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 97059563                                                                                                                │
│  │ Digest: GrbZPYB3WQgcjNfbUhFEHin53A6JuWPTYuQGJi1WDP88                                                                             │
│  └──                                                                                                                                │
│ Published Objects:                                                                                                                  │
│  ┌──                                                                                                                                │
│  │ PackageID: 0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b                                                    │
│  │ Version: 1                                                                                                                       │
│  │ Digest: 7smKvF2KNJZzeFKhCRsBA8u43CaFHWSvHcwz2fZk79HD                                                                             │
│  │ Modules: faucetcoin, mycoin                                                                                                      │
│  └──                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25611880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

PackageID:
0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

```


mint:
```
@Euraxluo ➜ .../mover/euraxluo/code/task2 (main) $ ./test.sh --package 0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b --module mycoin --function mint  --args 0x58af22ef3758b90adf30f8775a2499be424880b27ba96a2c389e1bd5d5197847  100000000000 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.23.1
Transaction Digest: DthTFgWUmmX2SBTRmicNPqe8ARgYhPpiGEo8GGw9wBva
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                   │
│ Gas Owner: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                                    │
│  │ Version: 97059563                                                                                         │
│  │ Digest: GrbZPYB3WQgcjNfbUhFEHin53A6JuWPTYuQGJi1WDP88                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x58af22ef3758b90adf30f8775a2499be424880b27ba96a2c389e1bd5d5197847              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    rJvM5G9hh/Qq8s4zOjzU7d+tppqUkjaHr3AmkS7bOKJEInuakk6Rj2jIat4VdXSmGr3Bn9DcNe/wgy0mCuw/DA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DthTFgWUmmX2SBTRmicNPqe8ARgYhPpiGEo8GGw9wBva                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 379                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xae599a7bde09f793971f307daedcca32eca73ef8c203021e80bc2763d9898b45                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059564                                                                              │
│  │ Digest: 9LVD9TenuZ5AbsYKoXEm5NoWDLEnobMqwQxKn3nji5sq                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x58af22ef3758b90adf30f8775a2499be424880b27ba96a2c389e1bd5d5197847                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059564                                                                              │
│  │ Digest: 75P4UpjS8WZZs2MsxuZft79pQa3mWE9J4Cztnwv3oo25                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059564                                                                              │
│  │ Digest: 4gq51Fu3K1LD8uEMKp4jegF5ivBTswms7cqMevgo5czs                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 97059564                                                                              │
│  │ Digest: 4gq51Fu3K1LD8uEMKp4jegF5ivBTswms7cqMevgo5czs                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AMRALvjWcSun8weKHPHrtJDQrcaSvWbDh1Spbtm3scjV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xae599a7bde09f793971f307daedcca32eca73ef8c203021e80bc2763d9898b45                                            │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )                           │
│  │ ObjectType: 0x2::coin::Coin<0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::mycoin::MYCOIN>         │
│  │ Version: 97059564                                                                                                       │
│  │ Digest: 9LVD9TenuZ5AbsYKoXEm5NoWDLEnobMqwQxKn3nji5sq                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x58af22ef3758b90adf30f8775a2499be424880b27ba96a2c389e1bd5d5197847                                            │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::mycoin::MYCOIN>  │
│  │ Version: 97059564                                                                                                       │
│  │ Digest: 75P4UpjS8WZZs2MsxuZft79pQa3mWE9J4Cztnwv3oo25                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x875a25c0ab0f640ab007471d87f42a0f6dd3941b8236c6dee402375fbf06d233                                            │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 97059564                                                                                                       │
│  │ Digest: 4gq51Fu3K1LD8uEMKp4jegF5ivBTswms7cqMevgo5czs                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ CoinType: 0xaab57e7f5fb04dd00978f6ed59c6977f46293f470ebdf43dc054a0f465ca8d7b::mycoin::MYCOIN   │
│  │ Amount: 100000000000                                                                           │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Package Created Objects:
0xae599a7bde09f793971f307daedcca32eca73ef8c203021e80bc2763d9898b45

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Package Caller Addresses:
0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

@Euraxluo ➜ .../mover/euraxluo/code/task2 (main) $ 
```


transfer:
```

```