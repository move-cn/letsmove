参考 https://docs.sui.io/guides/developer/sui-101/create-coin


```bash
# switch to mainnet
sui client switch --env mainnet

# publish
sui client publish 

# or publish module
# sui client publish  sources/mycoin.move
```

publish output:

```
Transaction Digest: ATp4U8dpWK8grgCUE3FuSWuaaFcMpD8g3wbgtSVh4d3n
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
│  │ Version: 100846052                                                                                        │
│  │ Digest: 3VFWJe6B8yNYcu3hoibt8UY23NkuaVEPD1BmbeVia5C4                                                      │
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
│    4Dwe0O6M08FiqsyC4iCrU7oHO6VB2Uwul8NxglE3XstiFUQVAZ08zJGfRvf5XU/ZdDON0ljwMJaFKvRrOwh3AA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: ATp4U8dpWK8grgCUE3FuSWuaaFcMpD8g3wbgtSVh4d3n                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 393                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0ce2e672ee5d609fb8005fc60dbe0ed9a47969ce78b44171704020775d523a8a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 100846053                                                                             │
│  │ Digest: 73am4ciMsRnczxuTaSUiE4jPsgzBsATyJ9H8Vy6hdLKa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1a00ca28bad247d059bb29ce192bc1a07ef4a62a7737409c9637a8e1a8976426                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846053                                                                             │
│  │ Digest: AQLqwH8QLroRcdxrDCMjjHwoT59SgPv39XZyWcNEVuno                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x39768c1fc6b99fd350e08cdcfe99c26855caaee7a9c2dae22593838bd48d894d                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846053                                                                             │
│  │ Digest: 2oFStnGBfbKB6wDxYd1VJSmWNYdMaNDpLn6dScymREJJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x51874128fe8881a8901ef3cd5faa02fe043bb2f49763a701e73d1eb2f2fab758                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 100846053                                                                             │
│  │ Digest: Df2WW1MGfzCec59TcieffH28k91K9CPaWXvFMzps9mK                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GNHEsA5agKxFPcwXX5wLdSEBhkqwU33jD5bJuyvAv8xG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf66f7c220f0a0ea40c1ec2e305b2946b81c48f05cbdcbe8a8b7022eb8d3ed272                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 100846053                                                                             │
│  │ Digest: 74LhThTmpLvs6jvVR8WUrmgQrxyBNe1G5MTo7kQwLwmq                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846053                                                                             │
│  │ Digest: BKSjzAnNJ46TqvxgeagtCLpkG3N7E7YzJkK4qTNaxd7S                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ Version: 100846053                                                                             │
│  │ Digest: BKSjzAnNJ46TqvxgeagtCLpkG3N7E7YzJkK4qTNaxd7S                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25498000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    D51hSSbwiUcizLb61CPpU9nJDN7dLaJNApjAMpGUwE7Z                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x0ce2e672ee5d609fb8005fc60dbe0ed9a47969ce78b44171704020775d523a8a                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd::mycoin::MYCOIN>            │
│  │ Version: 100846053                                                                                                                 │
│  │ Digest: 73am4ciMsRnczxuTaSUiE4jPsgzBsATyJ9H8Vy6hdLKa                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x1a00ca28bad247d059bb29ce192bc1a07ef4a62a7737409c9637a8e1a8976426                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd::mycoin::MYCOIN>             │
│  │ Version: 100846053                                                                                                                 │
│  │ Digest: AQLqwH8QLroRcdxrDCMjjHwoT59SgPv39XZyWcNEVuno                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x39768c1fc6b99fd350e08cdcfe99c26855caaee7a9c2dae22593838bd48d894d                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 100846053                                                                                                                 │
│  │ Digest: 2oFStnGBfbKB6wDxYd1VJSmWNYdMaNDpLn6dScymREJJ                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x51874128fe8881a8901ef3cd5faa02fe043bb2f49763a701e73d1eb2f2fab758                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd::faucet_coin::FAUCET_COIN>  │
│  │ Version: 100846053                                                                                                                 │
│  │ Digest: Df2WW1MGfzCec59TcieffH28k91K9CPaWXvFMzps9mK                                                                                │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xf66f7c220f0a0ea40c1ec2e305b2946b81c48f05cbdcbe8a8b7022eb8d3ed272                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Shared                                                                                                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd::faucet_coin::FAUCET_COIN>   │
│  │ Version: 100846053                                                                                                                 │
│  │ Digest: 74LhThTmpLvs6jvVR8WUrmgQrxyBNe1G5MTo7kQwLwmq                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x2119d5ca1250d4d189f8a1d7d453ec77d42987362d02353736aeda44891dfa40                                                       │
│  │ Sender: 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465                                                         │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 100846053                                                                                                                 │
│  │ Digest: BKSjzAnNJ46TqvxgeagtCLpkG3N7E7YzJkK4qTNaxd7S                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: GNHEsA5agKxFPcwXX5wLdSEBhkqwU33jD5bJuyvAv8xG                                                                               │
│  │ Modules: faucet_coin, mycoin                                                                                                       │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25269880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



```bash
# call

export PACKAGE_ID=0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd

# 给自己发一个
sui client call  \
  --package $PACKAGE_ID \
  --module mycoin --function mint --args \
  0x1a00ca28bad247d059bb29ce192bc1a07ef4a62a7737409c9637a8e1a8976426 \
  "1" \
  0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465


# 给任务要求的发一个
sui client call  \
  --package $PACKAGE_ID \
  --module mycoin --function mint --args \
  0x1a00ca28bad247d059bb29ce192bc1a07ef4a62a7737409c9637a8e1a8976426 \
  "1" \
  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```


```bash
# 水龙头， 给多个地址 mint

export PACKAGE_ID=0xf0c26a9e727f0d475bd960f6c0a97695ef9bc43344a8651603c879a8068398fd

sui client call  \
  --package $PACKAGE_ID \
  --module faucet_coin --function mint --args \
  0xf66f7c220f0a0ea40c1ec2e305b2946b81c48f05cbdcbe8a8b7022eb8d3ed272 \
  0x9afd49b0ead9f2884c69fc73282637d83a9341b221b125bc235c2d75d4c59465

sui client call  \
  --package $PACKAGE_ID \
  --module faucet_coin --function mint --args \
  0xf66f7c220f0a0ea40c1ec2e305b2946b81c48f05cbdcbe8a8b7022eb8d3ed272 \
  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```
