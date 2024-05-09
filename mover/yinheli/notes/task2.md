参考 https://docs.sui.io/guides/developer/sui-101/create-coin


```bash
# switch to mainnet
sui client switch --env mainnet

# publish
sui client publish --gas-budget 100000000

# or publish module
# sui client publish --gas-budget 100000000 sources/mycoin.move
```

publish output:

```
Transaction Digest: 8nkWcsQrC5gyM8VX3tA8MkxrHFqQ6QHRoiqiWnw23jBR
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
│  │ Version: 100846045                                                                                        │
│  │ Digest: 5HXgeNprZSrZGAq97VfLjFw56stpVS6SjEKf55HM9ndD                                                      │
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
│    9BXS0rlByk8J6PCY1MdUy/EZPuncRUpy7E5a6kCsbgvrg9ECIcqlqNOmfrBmLhhmkkNOkzYs45nr6a1skWvwAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8nkWcsQrC5gyM8VX3tA8MkxrHFqQ6QHRoiqiWnw23jBR                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 392                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x76fea8318cdd13a8e660356ee3d4d3aff3f3e1cbef8f3f548e099989f3c7c276                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846046                                                                             │
│  │ Digest: JDfE6CoQPww3mksMLA4KNUZFRN6Hgec9wkdDDZJSdott                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2KEXzXgFnzdp95pVVYssEK8GWnQ4TRKqHUGLaGRrqt1Q                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb7766259e601e3a37a0569e774a1a408a16cfd5c229a2d6fbdc0e2c50b0fc33c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 100846046                                                                             │
│  │ Digest: 8TBJ5ajByq4JDq92YGDq3268HsLjdUo92hXmnTciHjoS                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf0436dc25b11075971d0fbb62f8d2ebb26ea3b1e0116db0940aa4fa37d085045                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 100846046                                                                             │
│  │ Digest: GXZ7XZSpwWt8sjbQzRpuztnB7YQnabYcdAPmKRKaadDA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf0e3dbddb6566bccf0ac3b24e40de5cc24884288e280b8d080b3824ea931479c                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846046                                                                             │
│  │ Digest: 6ebPFndu6fh61dvpEgSJ3XYgkHUJZMAfkZLyz5ruCf2C                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf24cb1298b389df476ab71f3f6cf843b3866c6e1183e3f9e103f11ed84afc18b                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846046                                                                             │
│  │ Digest: 219um9dYVagZnnBAiqZcoWNZhnfj3kwXAz7JrT1qwjgT                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846046                                                                             │
│  │ Digest: FeqF9YAbX71r82s3JXkJmcENwAKkc2V2KKVimp7rMFbe                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846046                                                                             │
│  │ Digest: FeqF9YAbX71r82s3JXkJmcENwAKkc2V2KKVimp7rMFbe                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 24738000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27U4qZxHBnUnx2ftBDGdRtSYwZJDhYJd2s2EbJ1w8Zrz                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x76fea8318cdd13a8e660356ee3d4d3aff3f3e1cbef8f3f548e099989f3c7c276                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146::faucet_coin::FAUCET_COIN>   │
│  │ Version: 100846046                                                                                                                 │
│  │ Digest: JDfE6CoQPww3mksMLA4KNUZFRN6Hgec9wkdDDZJSdott                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xb7766259e601e3a37a0569e774a1a408a16cfd5c229a2d6fbdc0e2c50b0fc33c                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146::faucet_coin::FAUCET_COIN>  │
│  │ Version: 100846046                                                                                                                 │
│  │ Digest: 8TBJ5ajByq4JDq92YGDq3268HsLjdUo92hXmnTciHjoS                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xf0436dc25b11075971d0fbb62f8d2ebb26ea3b1e0116db0940aa4fa37d085045                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146::mycoin::MYCOIN>            │
│  │ Version: 100846046                                                                                                                 │
│  │ Digest: GXZ7XZSpwWt8sjbQzRpuztnB7YQnabYcdAPmKRKaadDA                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xf0e3dbddb6566bccf0ac3b24e40de5cc24884288e280b8d080b3824ea931479c                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146::mycoin::MYCOIN>             │
│  │ Version: 100846046                                                                                                                 │
│  │ Digest: 6ebPFndu6fh61dvpEgSJ3XYgkHUJZMAfkZLyz5ruCf2C                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xf24cb1298b389df476ab71f3f6cf843b3866c6e1183e3f9e103f11ed84afc18b                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 100846046                                                                                                                 │
│  │ Digest: 219um9dYVagZnnBAiqZcoWNZhnfj3kwXAz7JrT1qwjgT                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 100846046                                                                                                                 │
│  │ Digest: FeqF9YAbX71r82s3JXkJmcENwAKkc2V2KKVimp7rMFbe                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: 2KEXzXgFnzdp95pVVYssEK8GWnQ4TRKqHUGLaGRrqt1Q                                                                               │
│  │ Modules: faucet_coin, mycoin                                                                                                       │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -24509880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



```bash
# call

export PACKAGE_ID=0x8f4174b6b8a19befe95a8dc580480808e060dfe189097ec5d861a2123f8cd146

# 给自己发一个
sui client call --gas-budget 100000000 \
  --package $PACKAGE_ID \
  --module mycoin --function mint --args \
  0xf0e3dbddb6566bccf0ac3b24e40de5cc24884288e280b8d080b3824ea931479c \
  "1" \
  0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465


# 给任务要求的发一个
sui client call --gas-budget 100000000 \
  --package $PACKAGE_ID \
  --module mycoin --function mint --args \
  0xf0e3dbddb6566bccf0ac3b24e40de5cc24884288e280b8d080b3824ea931479c \
  "1" \
  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```
