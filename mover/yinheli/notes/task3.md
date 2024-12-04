参考 https://docs.sui.io/guides/developer/sui-101/create-nft


```bash
# switch to mainnet
sui client switch --env mainnet

# publish
sui client publish 
```

publish output
```
BUILDING task3
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: DtNAUEHV5BfmgXeEwWKmJ26mPBEn4D3griK4RtTm83VE
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                   │
│ Gas Owner: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                                    │
│  │ Version: 100846049                                                                                        │
│  │ Digest: 2yHCU2v3KfiBmzTMqktgRWPZLo12Yum1TNRQ39VyALwj                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465" │ │
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
│    CPvStUiYIyOA0+44TPhKCP8VxEtk7/QTI7u0tMzPc31HtQlKuTTDXgKdR0uVYYFkRAEsn8BTpZgRHQCYQaaCBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DtNAUEHV5BfmgXeEwWKmJ26mPBEn4D3griK4RtTm83VE                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 392                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x28e9e8697189c32b76938ce76fde7f016149e9e51d6fc8dede3ab5086dd75339                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846050                                                                             │
│  │ Digest: DfTQxuMJRYsy5rdFFh8V23hobQV17M32LnAU4zyEYthk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x941f218200a7c544f2332b744b8a819ca1ba5428596360fcabe2c252e03c9879                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846050                                                                             │
│  │ Digest: ATY2fCmaYUf7CuYz8tCHQ2Yc4SfCzQxQGP6oWL6fJPcd                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: CbNn1hC7ysWSKeziU7dGwbPG8YShcYrMSMz9n1JDngmz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcd21e6f723bec0c647738867bf3a4be49c923b01e690d3ee984f5990fc287d58                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846050                                                                             │
│  │ Digest: E8TwHgLaF9PqcVUaqTtA7Pa13eeoP3xLDLpDKpeUKgxU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846050                                                                             │
│  │ Digest: H6G72aJM2kTwrV5xZgk5Ea7SGY3BYL8ZvyWzN1rtB1Eh                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846050                                                                             │
│  │ Digest: H6G72aJM2kTwrV5xZgk5Ea7SGY3BYL8ZvyWzN1rtB1Eh                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 17685200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    B3Lfzh7Tkd44mMSvRekfHeaqbdBH8yh6V3PNCbeVmSBV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ EventID: DtNAUEHV5BfmgXeEwWKmJ26mPBEn4D3griK4RtTm83VE:0                                                                 │
│  │ PackageID: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164                                           │
│  │ Transaction Module: task3                                                                                               │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                              │
│  │ EventType: 0x2::display::DisplayCreated<0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164::task3::NFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                           │
│  │   │ id │ 0x941f218200a7c544f2332b744b8a819ca1ba5428596360fcabe2c252e03c9879 │                                           │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ EventID: DtNAUEHV5BfmgXeEwWKmJ26mPBEn4D3griK4RtTm83VE:1                                                                 │
│  │ PackageID: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164                                           │
│  │ Transaction Module: task3                                                                                               │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                              │
│  │ EventType: 0x2::display::VersionUpdated<0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164::task3::NFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                      │
│  │   │ fields  │ contents │ key   │ name                                            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {name}                                          │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ description                                     │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {description}                                   │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ image_url                                       │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ https://github.com/{name}.png                   │                                      │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                      │
│  │   │ id      │ 0x941f218200a7c544f2332b744b8a819ca1ba5428596360fcabe2c252e03c9879 │                                      │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                      │
│  │   │ version │ 1                                                                  │                                      │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                      │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x28e9e8697189c32b76938ce76fde7f016149e9e51d6fc8dede3ab5086dd75339                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                      │
│  │ ObjectType: 0x2::package::Publisher                                                                                │
│  │ Version: 100846050                                                                                                 │
│  │ Digest: DfTQxuMJRYsy5rdFFh8V23hobQV17M32LnAU4zyEYthk                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x941f218200a7c544f2332b744b8a819ca1ba5428596360fcabe2c252e03c9879                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                      │
│  │ ObjectType: 0x2::display::Display<0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164::task3::NFT>  │
│  │ Version: 100846050                                                                                                 │
│  │ Digest: ATY2fCmaYUf7CuYz8tCHQ2Yc4SfCzQxQGP6oWL6fJPcd                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xcd21e6f723bec0c647738867bf3a4be49c923b01e690d3ee984f5990fc287d58                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 100846050                                                                                                 │
│  │ Digest: E8TwHgLaF9PqcVUaqTtA7Pa13eeoP3xLDLpDKpeUKgxU                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 100846050                                                                                                 │
│  │ Digest: H6G72aJM2kTwrV5xZgk5Ea7SGY3BYL8ZvyWzN1rtB1Eh                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: CbNn1hC7ysWSKeziU7dGwbPG8YShcYrMSMz9n1JDngmz                                                               │
│  │ Modules: task3                                                                                                     │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -17457080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

```bash
export PACKAGE_ID=0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164

sui client call  \
  --module task3 --function mint_to_sender \
  --package $PACKAGE_ID \
  --args "yinheli" "yinheli's github avatar"
```

mint output

```
Transaction Digest: 5ABXrj2yxb9KvvuyzqVzNCNCn21aeiqYtMXNgmUu1v7y
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                  │
│ Gas Owner: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                   │
│  │ Version: 100846050                                                                       │
│  │ Digest: H6G72aJM2kTwrV5xZgk5Ea7SGY3BYL8ZvyWzN1rtB1Eh                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭──────────────────────────────────────────────────────────────────╮                        │
│ │ Input Objects                                                    │                        │
│ ├──────────────────────────────────────────────────────────────────┤                        │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "yinheli"                 │                        │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "yinheli's github avatar" │                        │
│ ╰──────────────────────────────────────────────────────────────────╯                        │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint_to_sender                                                     │        │
│ │  │ Module:    task3                                                              │        │
│ │  │ Package:   0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164 │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  │   Input  1                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    gszRRtg5Idlth3Af840fM2PgRLfAb0rol7D6ft72dxpbIj1Wxxm/KJYyAlDUoUrkhpoIlS2K00yOu2KrFBAFCA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5ABXrj2yxb9KvvuyzqVzNCNCn21aeiqYtMXNgmUu1v7y                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 392                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846051                                                                             │
│  │ Digest: 7G7sFhRu2AGvmjvXtg1QEh9skk23J3Ea6HEsRg2WXtdd                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846051                                                                             │
│  │ Digest: 5Dveh8sNoYSvif5AgPs9SENTyhF3Rm1HtYkPXksL2pPR                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846051                                                                             │
│  │ Digest: 5Dveh8sNoYSvif5AgPs9SENTyhF3Rm1HtYkPXksL2pPR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DtNAUEHV5BfmgXeEwWKmJ26mPBEn4D3griK4RtTm83VE                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                           │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ EventID: 5ABXrj2yxb9KvvuyzqVzNCNCn21aeiqYtMXNgmUu1v7y:0                                         │
│  │ PackageID: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164                   │
│  │ Transaction Module: task3                                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                      │
│  │ EventType: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164::task3::NFTMinted │
│  │ ParsedJSON:                                                                                     │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐            │
│  │   │ creator   │ 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 │            │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤            │
│  │   │ name      │ yinheli                                                            │            │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤            │
│  │   │ object_id │ 0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960 │            │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘            │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960                  │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                    │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 ) │
│  │ ObjectType: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164::task3::NFT    │
│  │ Version: 100846051                                                                            │
│  │ Digest: 7G7sFhRu2AGvmjvXtg1QEh9skk23J3Ea6HEsRg2WXtdd                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                  │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                    │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 100846051                                                                            │
│  │ Digest: 5Dveh8sNoYSvif5AgPs9SENTyhF3Rm1HtYkPXksL2pPR                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2257080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

send to task address

```bash
sui client call  \
  --module task3 --function transfer \
  --package $PACKAGE_ID \
  --args \
  0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960 \
  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

transfer output

```
Transaction Digest: D51hSSbwiUcizLb61CPpU9nJDN7dLaJNApjAMpGUwE7Z
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                   │
│ Gas Owner: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                                    │
│  │ Version: 100846051                                                                                        │
│  │ Digest: 5Dveh8sNoYSvif5AgPs9SENTyhF3Rm1HtYkPXksL2pPR                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    task3                                                              │                         │
│ │  │ Package:   0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    dwFeyGzp0/7xNagLEqyZRMe94a+HCZ30QVkeWpHCj1Th42ItnEap6rItQN/ctktJXkzlApnT/sZ2x2ZkaEHSCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: D51hSSbwiUcizLb61CPpU9nJDN7dLaJNApjAMpGUwE7Z                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 392                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846052                                                                             │
│  │ Digest: 3VFWJe6B8yNYcu3hoibt8UY23NkuaVEPD1BmbeVia5C4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 100846052                                                                             │
│  │ Digest: 8cUU5QTep4fT5F6M9sPCUQDZUaNQnsZ81WipSyAzbbm                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846052                                                                             │
│  │ Digest: 3VFWJe6B8yNYcu3hoibt8UY23NkuaVEPD1BmbeVia5C4                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2460348 MIST                                                                   │
│    Non-refundable Storage Fee: 24852 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5ABXrj2yxb9KvvuyzqVzNCNCn21aeiqYtMXNgmUu1v7y                                                   │
│    DtNAUEHV5BfmgXeEwWKmJ26mPBEn4D3griK4RtTm83VE                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                  │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                    │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 100846052                                                                            │
│  │ Digest: 3VFWJe6B8yNYcu3hoibt8UY23NkuaVEPD1BmbeVia5C4                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5e3a7856a405fb036b04ae2df21c0e2307ef35d936247d07e01162101295d960                  │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 ) │
│  │ ObjectType: 0xc591b939397e796f830e98b1bf02199a8a3b7d20903a752801f0f6742276b164::task3::NFT    │
│  │ Version: 100846052                                                                            │
│  │ Digest: 8cUU5QTep4fT5F6M9sPCUQDZUaNQnsZ81WipSyAzbbm                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -774852                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
