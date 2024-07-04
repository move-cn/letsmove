#  完成NFT的上链部署
- 上链网络: 主网(mainnet)

## 需求
- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
-  NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

## 任务指南
```shell
sui move new mynft   
cd mynft   

letsmove/mover/qiaopengjun5162/code/task3/mynft on  main [?] via 🅒 base took 21.0s 
➜ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft

letsmove/mover/qiaopengjun5162/code/task3/mynft on  main [?] via 🅒 base took 5.1s 
➜ sui client publish  --skip-fetch-latest-git-deps
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.1
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft
Successfully verified dependencies on-chain against source.
Transaction Digest: 5mtkTXwCNpLPoqRDFsDY89q9hx4AEbbWd2R38UV56XRn
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                    │
│  │ Version: 95429876                                                                                         │
│  │ Digest: HuMVRF5f4HCNKkyP31kpffZvsn83qWzYq77Kv9pfhzf7                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
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
│    Ou8Fox0FKY0tbqqIcXq4qGIXCDMewzeazoC8HWO2reAKrK8S90/4dkAzbRMiXH33F3jIqqP+rX/032L1BAPaAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5mtkTXwCNpLPoqRDFsDY89q9hx4AEbbWd2R38UV56XRn                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 95429877                                                                              │
│  │ Digest: 2vTBncDgXtT5H2VsWbYU51iRE6vs8PPPXAYjuVyyRnrx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x31c14663d3fa646e2d2f4c85bf9a31b8c3b0ff9a29420dcb99a0d4ac779f65f0                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429877                                                                              │
│  │ Digest: DXgzYMqgavorD84yc4iSbxCq2ayYcQvKv1m3sCpfAXUe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5488a8dff83545f4c18cf88aff2ed2944077fccfac3552c897bd1741fd4d0b47                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429877                                                                              │
│  │ Digest: SCmBEzstYFjpj6iswekL1B3rZVmppZupnSEQwqGutQE                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9c50de4e0e8c59ecc2610a10d98d6c669ca728a9c3c8101c8915de06ffbdbff8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429877                                                                              │
│  │ Digest: 9kJ4vhYjyXpVmkNXyVPDpAVbZs4J5vCgHGSbLJR15eMg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: E1Da8JQ6TRtSvQYGBKD4BGZv4rvWFfQswqJBNvUJMvwZ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429877                                                                              │
│  │ Digest: CsDcX7baF4PRYNCFxCJ3h2UvMA5Hbp5QJdBGquGsYf11                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429877                                                                              │
│  │ Digest: CsDcX7baF4PRYNCFxCJ3h2UvMA5Hbp5QJdBGquGsYf11                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 18528800 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4UYNLatVWL3LPJipH1JhQBog15dBdfnzZ3HsxAfp99kX                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ EventID: 5mtkTXwCNpLPoqRDFsDY89q9hx4AEbbWd2R38UV56XRn:0                                                                 │
│  │ PackageID: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff                                           │
│  │ Transaction Module: mynft                                                                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                              │
│  │ EventType: 0x2::display::DisplayCreated<0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff::mynft::NFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                           │
│  │   │ id │ 0x31c14663d3fa646e2d2f4c85bf9a31b8c3b0ff9a29420dcb99a0d4ac779f65f0 │                                           │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ EventID: 5mtkTXwCNpLPoqRDFsDY89q9hx4AEbbWd2R38UV56XRn:1                                                                 │
│  │ PackageID: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff                                           │
│  │ Transaction Module: mynft                                                                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                              │
│  │ EventType: 0x2::display::VersionUpdated<0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff::mynft::NFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌─────────┬──────────┬───────┬───────────────────────────────────────────────────────┐                                │
│  │   │ fields  │ contents │ key   │ name                                                  │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ value │ MyNFT #{tokenID}                                      │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ key   │ collection                                            │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ value │ MyNFT collection                                      │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ key   │ image_url                                             │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ value │ https://avatars.githubusercontent.com/u/124650229?v=4 │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ key   │ description                                           │                                │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                │
│  │   │         │          │ value │ This is MyNFT                                         │                                │
│  │   ├─────────┼──────────┴───────┴───────────────────────────────────────────────────────┤                                │
│  │   │ id      │ 0x31c14663d3fa646e2d2f4c85bf9a31b8c3b0ff9a29420dcb99a0d4ac779f65f0       │                                │
│  │   ├─────────┼──────────────────────────────────────────────────────────────────────────┤                                │
│  │   │ version │ 1                                                                        │                                │
│  │   └─────────┴──────────────────────────────────────────────────────────────────────────┘                                │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                         │
│  │ Owner: Shared                                                                                                      │
│  │ ObjectType: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff::mynft::State                       │
│  │ Version: 95429877                                                                                                  │
│  │ Digest: 2vTBncDgXtT5H2VsWbYU51iRE6vs8PPPXAYjuVyyRnrx                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x31c14663d3fa646e2d2f4c85bf9a31b8c3b0ff9a29420dcb99a0d4ac779f65f0                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                      │
│  │ ObjectType: 0x2::display::Display<0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff::mynft::NFT>  │
│  │ Version: 95429877                                                                                                  │
│  │ Digest: DXgzYMqgavorD84yc4iSbxCq2ayYcQvKv1m3sCpfAXUe                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x5488a8dff83545f4c18cf88aff2ed2944077fccfac3552c897bd1741fd4d0b47                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 95429877                                                                                                  │
│  │ Digest: SCmBEzstYFjpj6iswekL1B3rZVmppZupnSEQwqGutQE                                                                │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x9c50de4e0e8c59ecc2610a10d98d6c669ca728a9c3c8101c8915de06ffbdbff8                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                      │
│  │ ObjectType: 0x2::package::Publisher                                                                                │
│  │ Version: 95429877                                                                                                  │
│  │ Digest: 9kJ4vhYjyXpVmkNXyVPDpAVbZs4J5vCgHGSbLJR15eMg                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 95429877                                                                                                  │
│  │ Digest: CsDcX7baF4PRYNCFxCJ3h2UvMA5Hbp5QJdBGquGsYf11                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: E1Da8JQ6TRtSvQYGBKD4BGZv4rvWFfQswqJBNvUJMvwZ                                                               │
│  │ Modules: mynft                                                                                                     │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -18300680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


letsmove/mover/qiaopengjun5162/code/task3/mynft on  main [!?] via 🅒 base 
➜ sui client call --package 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff --module mynft --function mint --args 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5 --gas-budget 10000000
Transaction Digest: 3S4tjvdF3U8Lx6JE9sCsC6xmLF7ghBoXkYr7gSN6kxkm
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                       │
│  │ Version: 95429877                                                                            │
│  │ Digest: CsDcX7baF4PRYNCFxCJ3h2UvMA5Hbp5QJdBGquGsYf11                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint                                                               │            │
│ │  │ Module:    mynft                                                              │            │
│ │  │ Package:   0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    WDcbQ8O08cmqaqXLlkrTg6ucmN7loNwoScEyW9b9nKcUuq4N5vk/yUh0aWGXUVS9iMHoOdgohiGn6YLmIf+iCA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3S4tjvdF3U8Lx6JE9sCsC6xmLF7ghBoXkYr7gSN6kxkm                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x64dde41f31966e4b4de8e44a3172bed5bf352da50d853985f91081e8f5025705                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429878                                                                              │
│  │ Digest: 5osgJdaucVaaviHwFm8wFmeK4z43XN5LxtjnKGfnFqe9                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 95429878                                                                              │
│  │ Digest: E6CkRNtUy8xJzX6fgtY5wLS9xrNqUQw3hdCwB7EQZqmf                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429878                                                                              │
│  │ Digest: B2q1pyTcj86arnE4hoTQ9TpZFxRGXoCja4uTAzgpeEAw                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5                         │
│  │ Version: 95429877                                                                              │
│  │ Digest: 2vTBncDgXtT5H2VsWbYU51iRE6vs8PPPXAYjuVyyRnrx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429878                                                                              │
│  │ Digest: B2q1pyTcj86arnE4hoTQ9TpZFxRGXoCja4uTAzgpeEAw                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3632800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2294820 MIST                                                                   │
│    Non-refundable Storage Fee: 23180 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5mtkTXwCNpLPoqRDFsDY89q9hx4AEbbWd2R38UV56XRn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x64dde41f31966e4b4de8e44a3172bed5bf352da50d853985f91081e8f5025705                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff::mynft::NFT    │
│  │ Version: 95429878                                                                             │
│  │ Digest: 5osgJdaucVaaviHwFm8wFmeK4z43XN5LxtjnKGfnFqe9                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0facb161eaf43566657109ed636958a9eed170c96ffd096aaaf75e990a38abe5                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Shared                                                                                 │
│  │ ObjectType: 0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff::mynft::State  │
│  │ Version: 95429878                                                                             │
│  │ Digest: E6CkRNtUy8xJzX6fgtY5wLS9xrNqUQw3hdCwB7EQZqmf                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 95429878                                                                             │
│  │ Digest: B2q1pyTcj86arnE4hoTQ9TpZFxRGXoCja4uTAzgpeEAw                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2087980                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

letsmove/mover/qiaopengjun5162/code/task3/mynft on  main [!?] via 🅒 base took 8.4s 
➜ 

```
## 实操
```shell
sui move new sui_nft   
cd sui_nft 

letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base took 2.9s 
➜ sui move build --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui_nft

letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base 
➜ sui client publish  --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui_nft
Successfully verified dependencies on-chain against source.
Transaction Digest: E3W7bBxNmQM8C5LNMkhPkGwEmm3wSPzZCP62HSwBwtvd
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                    │
│  │ Version: 95429878                                                                                         │
│  │ Digest: B2q1pyTcj86arnE4hoTQ9TpZFxRGXoCja4uTAzgpeEAw                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
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
│    YrsA7y/NH03RA1X3YKVoMu3oAOx+hUCeM6N1WXaaJ1t7PQOcC3zV+pzUjsbrDyd87WJjHJzTLOJ/sLlR58XBBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: E3W7bBxNmQM8C5LNMkhPkGwEmm3wSPzZCP62HSwBwtvd                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9A5HGJEJW6jyhwvCf1vo3nfsBNibys7X8uFPG64cUbwc                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x415cf87b1c5ca988756c5a359bd4444bc5dd1b86b16b644071e13f109e0136f3                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429879                                                                              │
│  │ Digest: FuCJLTx43JdMW5n4NJD1mS6tShiWyD1sPbUiN4Nv7czA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x592f4505a13360a54005201ae2233540f0cde07820200bffc6eb05c3fa6c2dad                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429879                                                                              │
│  │ Digest: 4rVQ5Q6AaW6euNmZf7a3PwMNu7RzmzmVcb6YEhp9XMZB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xff5ea32d5ef61d0ed30e2ab420fb41e47eec44df19e05fdf22509adca732c04b                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429879                                                                              │
│  │ Digest: GXShctp4qRZZ7Ga1htK71UU6ALWdiLCUDSfhxCbKWCGv                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429879                                                                              │
│  │ Digest: 4bdCxEwahdEAwxWcbrZCVAPY8Z8npof7K4VQdmUSoTD2                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429879                                                                              │
│  │ Digest: 4bdCxEwahdEAwxWcbrZCVAPY8Z8npof7K4VQdmUSoTD2                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15671200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3S4tjvdF3U8Lx6JE9sCsC6xmLF7ghBoXkYr7gSN6kxkm                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                         │
│  │ EventID: E3W7bBxNmQM8C5LNMkhPkGwEmm3wSPzZCP62HSwBwtvd:0                                                                   │
│  │ PackageID: 0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425                                             │
│  │ Transaction Module: sui_nft                                                                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                │
│  │ EventType: 0x2::display::DisplayCreated<0x85395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425::sui_nft::Hero> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                             │
│  │   │ id │ 0x415cf87b1c5ca988756c5a359bd4444bc5dd1b86b16b644071e13f109e0136f3 │                                             │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                             │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ EventID: E3W7bBxNmQM8C5LNMkhPkGwEmm3wSPzZCP62HSwBwtvd:1                                                                   │
│  │ PackageID: 0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425                                             │
│  │ Transaction Module: sui_nft                                                                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                │
│  │ EventType: 0x2::display::VersionUpdated<0x85395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425::sui_nft::Hero> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                        │
│  │   │ fields  │ contents │ key   │ name                                            │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ {name}                                          │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ image_url                                       │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ {image_url}                                     │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ description                                     │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ A true Hero of the Sui ecosystem!               │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ creator                                         │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ Qiao                                            │                                        │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                        │
│  │   │ id      │ 0x415cf87b1c5ca988756c5a359bd4444bc5dd1b86b16b644071e13f109e0136f3 │                                        │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                        │
│  │   │ version │ 1                                                                  │                                        │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                        │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x415cf87b1c5ca988756c5a359bd4444bc5dd1b86b16b644071e13f109e0136f3                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::display::Display<0x85395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425::sui_nft::Hero>  │
│  │ Version: 95429879                                                                                                    │
│  │ Digest: FuCJLTx43JdMW5n4NJD1mS6tShiWyD1sPbUiN4Nv7czA                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x592f4505a13360a54005201ae2233540f0cde07820200bffc6eb05c3fa6c2dad                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::package::Publisher                                                                                  │
│  │ Version: 95429879                                                                                                    │
│  │ Digest: 4rVQ5Q6AaW6euNmZf7a3PwMNu7RzmzmVcb6YEhp9XMZB                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xff5ea32d5ef61d0ed30e2ab420fb41e47eec44df19e05fdf22509adca732c04b                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                 │
│  │ Version: 95429879                                                                                                    │
│  │ Digest: GXShctp4qRZZ7Ga1htK71UU6ALWdiLCUDSfhxCbKWCGv                                                                 │
│  └──                                                                                                                    │
│ Mutated Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                           │
│  │ Version: 95429879                                                                                                    │
│  │ Digest: 4bdCxEwahdEAwxWcbrZCVAPY8Z8npof7K4VQdmUSoTD2                                                                 │
│  └──                                                                                                                    │
│ Published Objects:                                                                                                      │
│  ┌──                                                                                                                    │
│  │ PackageID: 0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425                                        │
│  │ Version: 1                                                                                                           │
│  │ Digest: 9A5HGJEJW6jyhwvCf1vo3nfsBNibys7X8uFPG64cUbwc                                                                 │
│  │ Modules: sui_nft                                                                                                     │
│  └──                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15443080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base took 14.9s 
➜ sui client call --package 0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425 --module sui_nft --function mint --args qiao https://avatars.githubusercontent.com/u/124650229\?v\=4 --gas-budget 10000000
Transaction Digest: 7UfRi3QDG4GEFY6w1NZEsw9rzu8KD2YzA3L3XAE4jp94
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                  │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                               │
│ Gas Budget: 10000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                         │
│ Gas Payment:                                                                                                │
│  ┌──                                                                                                        │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                   │
│  │ Version: 95429879                                                                                        │
│  │ Digest: 4bdCxEwahdEAwxWcbrZCVAPY8Z8npof7K4VQdmUSoTD2                                                     │
│  └──                                                                                                        │
│                                                                                                             │
│ Transaction Kind: Programmable                                                                              │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                           │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: 0x1::string::String, Value: "qiao"                                                  │ │
│ │ 1   Pure Arg: Type: 0x1::string::String, Value: "https://avatars.githubusercontent.com/u/124650229?v=4" │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                        │
│ │ Commands                                                                         │                        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                        │
│ │ 0  MoveCall:                                                                     │                        │
│ │  ┌                                                                               │                        │
│ │  │ Function:  mint                                                               │                        │
│ │  │ Module:    sui_nft                                                            │                        │
│ │  │ Package:   0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425 │                        │
│ │  │ Arguments:                                                                    │                        │
│ │  │   Input  0                                                                    │                        │
│ │  │   Input  1                                                                    │                        │
│ │  └                                                                               │                        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                        │
│                                                                                                             │
│ Signatures:                                                                                                 │
│    G9onxFdaDiQ/SrDSjgQqNHuI9RZqYmQ2y4NtyWCSP5T2Jn0x5fOAVKoQj7MGxzt5vG2nDn5X/QQsdUw5IEgRBQ==                 │
│                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7UfRi3QDG4GEFY6w1NZEsw9rzu8KD2YzA3L3XAE4jp94                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x975c5cadf229bef5118b9acc8a0f492d56ed539730ddaa10db34f494be81b9d2                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429880                                                                              │
│  │ Digest: D5yxSdwkD5xsPxFFV8ezzsf6RgZR2CghmnstSvoGqHF4                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429880                                                                              │
│  │ Digest: 5VRSHckAJLh57ur3g9DgJdWj8nNRzSZkiEmMaUYzjoZh                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429880                                                                              │
│  │ Digest: 5VRSHckAJLh57ur3g9DgJdWj8nNRzSZkiEmMaUYzjoZh                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2713200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    E3W7bBxNmQM8C5LNMkhPkGwEmm3wSPzZCP62HSwBwtvd                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x975c5cadf229bef5118b9acc8a0f492d56ed539730ddaa10db34f494be81b9d2                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x85395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425::sui_nft::Hero  │
│  │ Version: 95429880                                                                             │
│  │ Digest: D5yxSdwkD5xsPxFFV8ezzsf6RgZR2CghmnstSvoGqHF4                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 95429880                                                                             │
│  │ Digest: 5VRSHckAJLh57ur3g9DgJdWj8nNRzSZkiEmMaUYzjoZh                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2485080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


```
nft published mint
- https://suivision.xyz/package/0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425?tab=Code
- https://suivision.xyz/txblock/7UfRi3QDG4GEFY6w1NZEsw9rzu8KD2YzA3L3XAE4jp94?tab=Changes
- https://suivision.xyz/object/0x975c5cadf229bef5118b9acc8a0f492d56ed539730ddaa10db34f494be81b9d2

- [] nft package id : 0x085395eedf46b033740e1a354fc1dd3456e2d5ae223c5d7d1b9344545f975425
- [] nft object id : 0x975c5cadf229bef5118b9acc8a0f492d56ed539730ddaa10db34f494be81b9d2

## 实操二
```shell
letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base took 10.3s 
➜ sui move build --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui_nft

letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base 
➜ sui client publish  --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui_nft
Successfully verified dependencies on-chain against source.
Transaction Digest: JACjPXfEjZAN3o66B3UtpMGQEGJcDjt9ejzLgfcLB1NB
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                    │
│  │ Version: 95429880                                                                                         │
│  │ Digest: 5VRSHckAJLh57ur3g9DgJdWj8nNRzSZkiEmMaUYzjoZh                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
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
│    yhLvgK/ByZwTzVS3KwgfDOsrkzFfMFTVyLFWUwMIzbBUbqJCb21uOAxkpFlyn77e7ZB2a/Mu/cud47QOfDhuBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: JACjPXfEjZAN3o66B3UtpMGQEGJcDjt9ejzLgfcLB1NB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Ec4gf7rJpQPcfGw32iGMQ5vXdzozYMFx9q61exo8ZQYU                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9fdc056819d192d626357f0730fb16f6bb2b30a4caa1e7a6802bc1778d2915c7                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429881                                                                              │
│  │ Digest: 9tkXjxoCnmpaRX62hPCP4HqcWscQWYVQR5hCM8dAQwKM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc100ce37d6529c91e2fb5b7f8e6d73697f5057d5fefbe422976e212c41734ce8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429881                                                                              │
│  │ Digest: ELLBP9sd9DKnN7FsbDFzL59bXS4UJfFCq6zMjp9Czzke                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd765e7d24b63638df8e930e23b99d00bb37462223f605278e4306af69f35e313                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429881                                                                              │
│  │ Digest: 2U9Uf5V3eHFxMA9TDLmMQrKin7jQNs2zzzcjd5x1ajDh                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429881                                                                              │
│  │ Digest: AF77S8LPqGRHxg3HLfeZrmTjYM9TD1DZbE4VYoDqSJMN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429881                                                                              │
│  │ Digest: AF77S8LPqGRHxg3HLfeZrmTjYM9TD1DZbE4VYoDqSJMN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 16188000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    7UfRi3QDG4GEFY6w1NZEsw9rzu8KD2YzA3L3XAE4jp94                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                         │
│  │ EventID: JACjPXfEjZAN3o66B3UtpMGQEGJcDjt9ejzLgfcLB1NB:0                                                                   │
│  │ PackageID: 0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5                                             │
│  │ Transaction Module: sui_nft                                                                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                │
│  │ EventType: 0x2::display::DisplayCreated<0x9e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5::sui_nft::Hero> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                             │
│  │   │ id │ 0xc100ce37d6529c91e2fb5b7f8e6d73697f5057d5fefbe422976e212c41734ce8 │                                             │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                             │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ EventID: JACjPXfEjZAN3o66B3UtpMGQEGJcDjt9ejzLgfcLB1NB:1                                                                   │
│  │ PackageID: 0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5                                             │
│  │ Transaction Module: sui_nft                                                                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                │
│  │ EventType: 0x2::display::VersionUpdated<0x9e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5::sui_nft::Hero> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                        │
│  │   │ fields  │ contents │ key   │ name                                            │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ {name}                                          │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ image_url                                       │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ {image_url}                                     │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ description                                     │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ A true Hero of the Sui ecosystem!               │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ creator                                         │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ Qiao                                            │                                        │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                        │
│  │   │ id      │ 0xc100ce37d6529c91e2fb5b7f8e6d73697f5057d5fefbe422976e212c41734ce8 │                                        │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                        │
│  │   │ version │ 1                                                                  │                                        │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                        │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x9fdc056819d192d626357f0730fb16f6bb2b30a4caa1e7a6802bc1778d2915c7                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::package::Publisher                                                                                  │
│  │ Version: 95429881                                                                                                    │
│  │ Digest: 9tkXjxoCnmpaRX62hPCP4HqcWscQWYVQR5hCM8dAQwKM                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xc100ce37d6529c91e2fb5b7f8e6d73697f5057d5fefbe422976e212c41734ce8                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::display::Display<0x9e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5::sui_nft::Hero>  │
│  │ Version: 95429881                                                                                                    │
│  │ Digest: ELLBP9sd9DKnN7FsbDFzL59bXS4UJfFCq6zMjp9Czzke                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xd765e7d24b63638df8e930e23b99d00bb37462223f605278e4306af69f35e313                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                 │
│  │ Version: 95429881                                                                                                    │
│  │ Digest: 2U9Uf5V3eHFxMA9TDLmMQrKin7jQNs2zzzcjd5x1ajDh                                                                 │
│  └──                                                                                                                    │
│ Mutated Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                           │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                           │
│  │ Version: 95429881                                                                                                    │
│  │ Digest: AF77S8LPqGRHxg3HLfeZrmTjYM9TD1DZbE4VYoDqSJMN                                                                 │
│  └──                                                                                                                    │
│ Published Objects:                                                                                                      │
│  ┌──                                                                                                                    │
│  │ PackageID: 0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5                                        │
│  │ Version: 1                                                                                                           │
│  │ Digest: Ec4gf7rJpQPcfGw32iGMQ5vXdzozYMFx9q61exo8ZQYU                                                                 │
│  │ Modules: sui_nft                                                                                                     │
│  └──                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15959880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base took 18.8s 
➜ sui client call --package 0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5 --module sui_nft --function mint --args qiao001 https://avatars.githubusercontent.com/u/124650229\?v\=4 --gas-budget 10000000
Transaction Digest: EWhNUQ3heSLVMMjm8GsXEoDgDRS2CkdPJpprbYW87jRb
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                  │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                               │
│ Gas Budget: 10000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                         │
│ Gas Payment:                                                                                                │
│  ┌──                                                                                                        │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                   │
│  │ Version: 95429881                                                                                        │
│  │ Digest: AF77S8LPqGRHxg3HLfeZrmTjYM9TD1DZbE4VYoDqSJMN                                                     │
│  └──                                                                                                        │
│                                                                                                             │
│ Transaction Kind: Programmable                                                                              │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                           │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: 0x1::string::String, Value: "qiao001"                                               │ │
│ │ 1   Pure Arg: Type: 0x1::string::String, Value: "https://avatars.githubusercontent.com/u/124650229?v=4" │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                        │
│ │ Commands                                                                         │                        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                        │
│ │ 0  MoveCall:                                                                     │                        │
│ │  ┌                                                                               │                        │
│ │  │ Function:  mint                                                               │                        │
│ │  │ Module:    sui_nft                                                            │                        │
│ │  │ Package:   0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5 │                        │
│ │  │ Arguments:                                                                    │                        │
│ │  │   Input  0                                                                    │                        │
│ │  │   Input  1                                                                    │                        │
│ │  └                                                                               │                        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                        │
│                                                                                                             │
│ Signatures:                                                                                                 │
│    bKea+3y8UY/HdmQT55wTMCKNfzNrra9omLBSKgblH2BItjs0UkktChSrxiOXSl/+8OzEIBUjCuQ3pVQU7BDoAA==                 │
│                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EWhNUQ3heSLVMMjm8GsXEoDgDRS2CkdPJpprbYW87jRb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429882                                                                              │
│  │ Digest: DBc1wHNjrJoc1NARmmyybT6F8YkNMA2G1vtqWrZKpCtj                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429882                                                                              │
│  │ Digest: 6XiCwy1AGYzVVXx3BKC7vYvzxhHS9aQSYtCkVy9RgGor                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429882                                                                              │
│  │ Digest: 6XiCwy1AGYzVVXx3BKC7vYvzxhHS9aQSYtCkVy9RgGor                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2736000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    JACjPXfEjZAN3o66B3UtpMGQEGJcDjt9ejzLgfcLB1NB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x9e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5::sui_nft::Hero  │
│  │ Version: 95429882                                                                             │
│  │ Digest: DBc1wHNjrJoc1NARmmyybT6F8YkNMA2G1vtqWrZKpCtj                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 95429882                                                                             │
│  │ Digest: 6XiCwy1AGYzVVXx3BKC7vYvzxhHS9aQSYtCkVy9RgGor                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2507880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


letsmove/mover/qiaopengjun5162/code/task3/sui_nft on  main [!?] via 🅒 base took 14.5s 
➜ sui client call --package 0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5 --module sui_nft --function transfer --args 0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000
Transaction Digest: J265bgtRvkGiP5D7TRH4qrFPQJ1xGPbvgkPAhhHNJAXN
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                                    │
│  │ Version: 95429882                                                                                         │
│  │ Digest: 6XiCwy1AGYzVVXx3BKC7vYvzxhHS9aQSYtCkVy9RgGor                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    sui_nft                                                            │                         │
│ │  │ Package:   0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    h4YU9KgxTbbOh6RBU5k+75X/pUHh7UwjRRZ428SanzWRDMd1fA9CJ+S8agyS3+EeZfN18DJ4j0dsI8qE/4MYDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: J265bgtRvkGiP5D7TRH4qrFPQJ1xGPbvgkPAhhHNJAXN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 377                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429883                                                                              │
│  │ Digest: HNrsf9Gb9jhyffS34XzS2PTooSxKxJncMP9k477id8ea                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 95429883                                                                              │
│  │ Digest: ECy7RzjMXLTJ1r5JkmRkZmXiFAyopgsqVohxRVCi4uqi                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 95429883                                                                              │
│  │ Digest: HNrsf9Gb9jhyffS34XzS2PTooSxKxJncMP9k477id8ea                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2736000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EWhNUQ3heSLVMMjm8GsXEoDgDRS2CkdPJpprbYW87jRb                                                   │
│    JACjPXfEjZAN3o66B3UtpMGQEGJcDjt9ejzLgfcLB1NB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x518528c9fcb2c75603d0e9537c044de3f7a5e2cfc83e681e79e30c945ad848f8                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 95429883                                                                             │
│  │ Digest: HNrsf9Gb9jhyffS34XzS2PTooSxKxJncMP9k477id8ea                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 ) │
│  │ ObjectType: 0x9e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5::sui_nft::Hero  │
│  │ Version: 95429883                                                                             │
│  │ Digest: ECy7RzjMXLTJ1r5JkmRkZmXiFAyopgsqVohxRVCi4uqi                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -777360                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
- https://suivision.xyz/package/0x09e14939fb34df6f3322aee8ccc6b11bf8f5a77b68e82a77b3edcf91515b74c5?tab=Code
- https://suivision.xyz/object/0x6f0da7613e0c334f2f28dabd9e48ed46fd57e5f0e94426dd03feed98ce11ab91
- https://suivision.xyz/txblock/J265bgtRvkGiP5D7TRH4qrFPQJ1xGPbvgkPAhhHNJAXN

## Sui Move 开发注意事项
- edition = "2024.beta"  结构体需要加 public 

## NFT
- 一串独特的编码/名字（标识唯一性）
- 所有权（NFT是谁的）
- 永久保存NFT的基本属性 Name、ImageUrl
### 构建NFT
- 通过NFT平台创建
- 合约编码
### NFT标准
- ERC 721
- ERC 1155
- ERC 6551
- 任何实现了 Display 的 Object 都是NFT

### NFT Display
- Struct + key + id == Object
- Object + Display = NFT
- Sui 对象 Display 标准是一个模版引擎，可以对类型的链下表示（显示）进行链上管理

### Publisher
- 每个合约都是一个 package Object
- Publisher 用作生成唯一的实例
- 每个 module 最多只能有一个
- 每个 package 可以有很多个

### key 不能 和 copy 组合 key 不能和 drop组合 因为资产不能复制和被丢弃

## 参考
- https://examples.sui.io/samples/nft.html
- https://suivision.xyz/package/0xa6ba1243f01ae68ad3a2370971310e3f2df8f29481f1146c9d8c2da546d066ff?tab=Code
- https://suivision.xyz/txblock/3S4tjvdF3U8Lx6JE9sCsC6xmLF7ghBoXkYr7gSN6kxkm
- https://docs.sui.io/standards/display