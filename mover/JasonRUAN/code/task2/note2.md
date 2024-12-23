# Task2学习笔记

## 切换到主网
```bash
$ sui client switch --env mainnet
Active environment switched to [mainnet]
```

## 部署`My Coin`
```bash
$ sui client publish
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING js_coin
Successfully verified dependencies on-chain against source.
Transaction Digest: Ac6SVFqfoWrZSwqFYkttcrJk1aT1TBBs4a75b6PCyTR1

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x15e30222236048cbf49157bb2f19fd6db257f764fd81862a5da20a651d730600                                               │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                 │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                       │
│  │ Version: 239051430                                                                                                         │
│  │ Digest: AsB3i6mWBBeHuF79bDac1dbG2ybvJXqrRRYBTG4kBYpQ                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x7ad8627e8470871c2afff0c682b66b61717798a9162415bcf117bb67868bb310                                               │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                 │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x943fab9df355573935cf3e619583ec835c16350858fd746abed83de37dc1bde8::js_coin::JS_COIN>   │
│  │ Version: 239051430                                                                                                         │
│  │ Digest: EYNbj8zt2hj24Jk5QzeDSefS2oMznrXPDPhancBCXpqW                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x88edfc6cee402b0a2ba881e91f5b2aba24f87e4c27520fc1ae7c13202922d3eb                                               │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                 │
│  │ Owner: Immutable                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x943fab9df355573935cf3e619583ec835c16350858fd746abed83de37dc1bde8::js_coin::JS_COIN>  │
│  │ Version: 239051430                                                                                                         │
│  │ Digest: Bo1LryhMfVpxEKy7qyXNAtRtVwhym3drHWfvTuFZb66e                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x21e47a8003565d3805f0ace77bad3580bf226d253513344fe6975ae1310dc11e                                               │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                 │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 239051430                                                                                                         │
│  │ Digest: 5rEfS2q2DfCCP6UGpcEVh8Dg2qHrTXZb9nHFQqpwPDK3                                                                       │
│  └──                                                                                                                          │
│ Published Objects:                                                                                                            │
│  ┌──                                                                                                                          │
│  │ PackageID: 0x943fab9df355573935cf3e619583ec835c16350858fd746abed83de37dc1bde8                                              │
│  │ Version: 1                                                                                                                 │
│  │ Digest: EyDSeDaR85yYHPtHsKFeFNmgJeBwtdFYEr84eZNY4TZ3                                                                       │
│  │ Modules: js_coin                                                                                                           │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## 铸造`My Coin`

- **设置环境变量**
```bash
export PACKAGE_ID=0x943fab9df355573935cf3e619583ec835c16350858fd746abed83de37dc1bde8
export TREASURY_CAP=0x7ad8627e8470871c2afff0c682b66b61717798a9162415bcf117bb67868bb310
export MY_ADDR=0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8
export UVD_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
export AMOUNT=9999999999
```

- **为自己地址铸造**
```bash
sui client call --package $PACKAGE_ID --module js_coin --function mint --args $TREASURY_CAP $AMOUNT $MY_ADDR

Transaction Digest: 9FYXSA5hX5M9TxtCwQqe7FPmSBF4CQtYAsNXivLtrd81
```

- **为UVD老师地址铸造**
```bash
sui client call --package $PACKAGE_ID --module js_coin --function mint --args $TREASURY_CAP $AMOUNT $UVD_ADDR

Transaction Digest: Du1gxaEKjRB5Xd9e3xwPPCLH7JWGXYzNKHqGVMXRpPbX
```

## 部署`Faucet Coin`
```bash
$ sui client publish
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING js_faucet_coin
Successfully verified dependencies on-chain against source.
Transaction Digest: 2sZAucwoTVwZo8hTmU8ACraGrLri2c58rpebu9rEb8Pm

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x1d3aab3edded7b2a60609c9fe5476f662805af6027924f57bac0bc560763db88                                                             │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                               │
│  │ Owner: Shared( 239051431 )                                                                                                               │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xb8db87209eafdc3799c38dd92b616f2be1ca4fd4809c0909f897d6dfcc44f0df::js_faucet_coin::JS_FAUCET_COIN>   │
│  │ Version: 239051431                                                                                                                       │
│  │ Digest: 3ayv3PE3ZXETHJ4xyKhVwTeMhFRA6QkqfMJcNQ4cdhQz                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x2884b1ab951d759ac4562dea2b3c1a80e0cc5cc83cf8d103edbac7c06f9fc97a                                                             │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                               │
│  │ Owner: Immutable                                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xb8db87209eafdc3799c38dd92b616f2be1ca4fd4809c0909f897d6dfcc44f0df::js_faucet_coin::JS_FAUCET_COIN>  │
│  │ Version: 239051431                                                                                                                       │
│  │ Digest: 76pAzpbQ2zb6YK6kcMJJAxwnTQwZQA4pUH8upA1DEVEp                                                                                     │
│  └──                                                                                                                                        │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x465f1cbbd3ba1d51e8ce75e64ec33c350d14a84a0adbc17a4ade85b4b61c6889                                                             │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                               │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                     │
│  │ Version: 239051431                                                                                                                       │
│  │ Digest: CjTEZQyaWskPUgd2tWPE19Bnwf7rbCAMhVAY9tbKYh47                                                                                     │
│  └──                                                                                                                                        │
│ Mutated Objects:                                                                                                                            │
│  ┌──                                                                                                                                        │
│  │ ObjectID: 0x21e47a8003565d3805f0ace77bad3580bf226d253513344fe6975ae1310dc11e                                                             │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                               │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                               │
│  │ Version: 239051431                                                                                                                       │
│  │ Digest: H6xuhzmjcZpwMQs3yhymL1xvMJsLa24WgXo6qknR5Yn5                                                                                     │
│  └──                                                                                                                                        │
│ Published Objects:                                                                                                                          │
│  ┌──                                                                                                                                        │
│  │ PackageID: 0xb8db87209eafdc3799c38dd92b616f2be1ca4fd4809c0909f897d6dfcc44f0df                                                            │
│  │ Version: 1                                                                                                                               │
│  │ Digest: 7MJSDzuGZVQ7rFPWLAR9F9pn5pYemg641kdrQGRuQ3ay                                                                                     │
│  │ Modules: js_faucet_coin                                                                                                                  │
│  └──                                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## 领取水龙头代币

- **设置环境变量**
```bash
export PACKAGE_ID=0xb8db87209eafdc3799c38dd92b616f2be1ca4fd4809c0909f897d6dfcc44f0df
export TREASURY_CAP=0x1d3aab3edded7b2a60609c9fe5476f662805af6027924f57bac0bc560763db88
export AMOUNT=888888888
```

- **地址1领取**
```bash
$ sui client call --package $PACKAGE_ID --module js_faucet_coin --function airdrop --args $TREASURY_CAP $AMOUNT

Transaction Digest: 787Nu8gsg7EEkEofQ4qGDxMvy6gk4Yfk6WUVFQtdRYmr

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                           │
│  │ EventID: 787Nu8gsg7EEkEofQ4qGDxMvy6gk4Yfk6WUVFQtdRYmr:0                                                     │
│  │ PackageID: 0xb8db87209eafdc3799c38dd92b616f2be1ca4fd4809c0909f897d6dfcc44f0df                               │
│  │ Transaction Module: js_faucet_coin                                                                          │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                  │
│  │ EventType: 0xb8db87209eafdc3799c38dd92b616f2be1ca4fd4809c0909f897d6dfcc44f0df::js_faucet_coin::AirdropEvent │
│  │ ParsedJSON:                                                                                                 │
│  │   ┌────────────────┬────────────────────────────────────────────────────────────────────┐                   │
│  │   │ airdrop_amount │ 888888888                                                          │                   │
│  │   ├────────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ recipient      │ 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 │                   │
│  │   ├────────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ symbol         │ SlNGQw==                                                           │                   │
│  │   ├────────────────┼────────────────────────────────────────────────────────────────────┤                   │
│  │   │ total_supply   │ 0                                                                  │                   │
│  │   └────────────────┴────────────────────────────────────────────────────────────────────┘                   │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

- **地址2领取**
```bash
$ sui client call --package $PACKAGE_ID --module js_faucet_coin --function airdrop --args $TREASURY_CAP $AMOUNT

Transaction Digest: 8uS4nZ5Q51h1nhXiznsKcRfCKrbHk1U5A482m4x8M8zf
```