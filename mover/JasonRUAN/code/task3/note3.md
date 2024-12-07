# Task3学习笔记

## 部署Move NFT
```bash
$ sui client publish
Transaction Digest: 9sC9w1xJKV3pKX65BteRmo5LV9cxMg9D8hHjxP4UieyD

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                          │
│  │ EventID: 9sC9w1xJKV3pKX65BteRmo5LV9cxMg9D8hHjxP4UieyD:0                                                                    │
│  │ PackageID: 0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0                                              │
│  │ Transaction Module: js_nft                                                                                                 │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                 │
│  │ EventType: 0x2::display::DisplayCreated<0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0::js_nft::JSNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                              │
│  │   │ id │ 0xbd00016171d0f764e796c7b175082d83aee4370cb7874da794fca05d5dd4d5ee │                                              │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                              │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ EventID: 9sC9w1xJKV3pKX65BteRmo5LV9cxMg9D8hHjxP4UieyD:1                                                                    │
│  │ PackageID: 0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0                                              │
│  │ Transaction Module: js_nft                                                                                                 │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                                 │
│  │ EventType: 0x2::display::VersionUpdated<0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0::js_nft::JSNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                         │
│  │   │ fields  │ contents │ key   │ name                                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {name}                                          │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ image_url                                       │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {image_url}                                     │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ description                                     │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ hoh task3 NFT created by JasonRUAN              │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ project_url                                     │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ https://github.com/JasonRUAN/hoh_letsmove/      │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ creator                                         │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ JasonRUAN                                       │                                         │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                         │
│  │   │ id      │ 0xbd00016171d0f764e796c7b175082d83aee4370cb7874da794fca05d5dd4d5ee │                                         │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                         │
│  │   │ version │ 1                                                                  │                                         │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                         │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x962a7de6fc1aab3c1721ddf0eb693a8bdccacc3f48a4c4f94b646ec54b780288                                          │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                            │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                         │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                  │
│  │ Version: 239051435                                                                                                    │
│  │ Digest: 4CpQ3PMMPnP9qtw73oV4iJm4tePKWiE64eFRiL8ihpRp                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xbd00016171d0f764e796c7b175082d83aee4370cb7874da794fca05d5dd4d5ee                                          │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                            │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                         │
│  │ ObjectType: 0x2::display::Display<0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0::js_nft::JSNFT>  │
│  │ Version: 239051435                                                                                                    │
│  │ Digest: 3kChAwWGbPLAHDCuu1s6MHL2wMKhT5DVdfhTFgrW6Utw                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xe51bce88a61b6536ba2e796e2d15ea4a8ff7ca8f955650b80952325aa2de2e35                                          │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                            │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                         │
│  │ ObjectType: 0x2::package::Publisher                                                                                   │
│  │ Version: 239051435                                                                                                    │
│  │ Digest: 8T5kwmCREH9bKQoeoJ1BHf7SKiRKGoDc4QjvGHUHM5FE                                                                  │
│  └──                                                                                                                     │
│ Mutated Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x21e47a8003565d3805f0ace77bad3580bf226d253513344fe6975ae1310dc11e                                          │
│  │ Sender: 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8                                            │
│  │ Owner: Account Address ( 0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8 )                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                            │
│  │ Version: 239051435                                                                                                    │
│  │ Digest: G3xqHPsvKKrit7pPoW1rLH2Wy7b2qWWKkPi2Fw6DP4Vk                                                                  │
│  └──                                                                                                                     │
│ Published Objects:                                                                                                       │
│  ┌──                                                                                                                     │
│  │ PackageID: 0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0                                         │
│  │ Version: 1                                                                                                            │
│  │ Digest: KeUZuzNHqKr6XXy7wdAf7JXSHm1XnpMcVGX6Y4ip9nv                                                                   │
│  │ Modules: js_nft                                                                                                       │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## Mint NFT

- **设置环境变量**
```bash
export PACKAGE_ID=0xde1c46c81e15397011e6e5be110366ea2f0a4276bd3c867a7f8ca158c0801df0
export IMAGE_URL="https://avatars.githubusercontent.com/u/964008?v=4&size=64"
```

- **为自己地址铸造**
```bash
$ sui client call --package $PACKAGE_ID --module js_nft --function mint --args JS_NFT_01 $IMAGE_URL

Transaction Digest: J6w6ojQpKoCVKNs97QKSGULcFqZNqDBTwvRrgcQTwVky

https://suivision.xyz/object/0xcae52d8f6e1d349eec7b5f6a41820f99423f5ab9fe15f3c050d1ff83986a6f06
```

- **为UVD老师地址铸造**
```bash
export UVD_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module js_nft --function mint_and_transfer --args JS_NFT_02 $IMAGE_URL $UVD_ADDR

Transaction Digest: 7LrfXnqHAribrhHjb7ergVE2SMhiSbVzuaH8s9dh9rvJ

https://suivision.xyz/object/0xb7b0fc7f5faf467759f9492060cc6b591489f702898f4637f77a4b844ef52d80
```