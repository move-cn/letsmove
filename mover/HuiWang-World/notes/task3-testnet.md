--- 任务要求 begin---

# 完成NFT的上链部署

- 上链网络: 主网(mainnet)

## 需求

- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
- NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- 提交mint到自己地址的浏览器查看(Scan)截图

## 任务指南

--- 任务要求 end---

--- task begin---

- 编写合约代码 HUIWANG_WORLD_NFT.move
- 发布合约

```shell
sui client publish 
```

- 执行结果

```shell
Transaction Digest: 5jgSn2czPHiKexXbT2jixXnBBetsGAuaJgnDshjt4sWv
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                    │
│  │ Version: 715921                                                                                           │
│  │ Digest: dWfoK4NsbnHFfZcMMqdXr7CxFv8kfqEM1VEQRe8yp1v                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7" │ │
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
│    VbW0yaTs333wf3GF8flvgsYyvbNcR+0rxqSvGLmf5g26gaqXMOk7YfoTe/H9H8yX9LR+k+jp88YPKnWM+HjYAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5jgSn2czPHiKexXbT2jixXnBBetsGAuaJgnDshjt4sWv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 411                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715922                                                                                │
│  │ Digest: AgbbAQtqfhg9wwTbaqkyzPDPwzxCaH88rytbQkkDghME                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7c635448b6e96d5ee0f104fd4ced6c8e7529755a92d57007bc5a272f78c2c583                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715922                                                                                │
│  │ Digest: AVP553ECNZqKZHRJqgDziJ7RoiqacT3qve1MGkgi2tjC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: BXQtAtU1pNKp2sp4jyGFXqamPWdr9vkv9QN9JyXy6qTk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715922                                                                                │
│  │ Digest: 6pzJYerJQUj9vN6PRCyvvYTFjXC7Y8FsstQMeuZtsVBA                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715922                                                                                │
│  │ Digest: 6pzJYerJQUj9vN6PRCyvvYTFjXC7Y8FsstQMeuZtsVBA                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11164400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3Hry5CyWQUTNV5nRZTNxoWyfN9zxBEcwsYkXUyTHCrmE                                                   │
│    6c3hAbXwoKqSv8Grf4wv7VAJYpT7UnPxV3zqeRjmN1JY                                                   │
│    GZNZBDuSoWrS7sEix79iaam9hDMoNjq8idfZEdkF79wr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4::HUIWANG_WORLD_NFT::AdminCap  │
│  │ Version: 715922                                                                                              │
│  │ Digest: AgbbAQtqfhg9wwTbaqkyzPDPwzxCaH88rytbQkkDghME                                                         │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x7c635448b6e96d5ee0f104fd4ced6c8e7529755a92d57007bc5a272f78c2c583                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                         │
│  │ Version: 715922                                                                                              │
│  │ Digest: AVP553ECNZqKZHRJqgDziJ7RoiqacT3qve1MGkgi2tjC                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 715922                                                                                              │
│  │ Digest: 6pzJYerJQUj9vN6PRCyvvYTFjXC7Y8FsstQMeuZtsVBA                                                         │
│  └──                                                                                                            │
│ Published Objects:                                                                                              │
│  ┌──                                                                                                            │
│  │ PackageID: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4                                │
│  │ Version: 1                                                                                                   │
│  │ Digest: BXQtAtU1pNKp2sp4jyGFXqamPWdr9vkv9QN9JyXy6qTk                                                         │
│  │ Modules: HUIWANG_WORLD_NFT                                                                                   │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -11186280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 调用合约

```shell
 sui client call  \
 --package  0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4 \
 --module HUIWANG_WORLD_NFT \
 --function mint \
 --args 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d "HuiWang-World" "HuiWang-World-NFT" "https://avatars.githubusercontent.com/HuiWang-World"

```

- 执行结果

```shell
Transaction Digest: 4zy1ycmEQdNmVQKJU8EXyFjJb6dMeRuNhFMLPAcyx8XJ
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                       │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                    │
│ Gas Budget: 100000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                             │
│ Gas Payment:                                                                                     │
│  ┌──                                                                                             │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                        │
│  │ Version: 715922                                                                               │
│  │ Digest: 6pzJYerJQUj9vN6PRCyvvYTFjXC7Y8FsstQMeuZtsVBA                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Transaction Kind: Programmable                                                                   │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d  │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "HuiWang-World"                                       │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "HuiWang-World-NFT"                                   │ │
│ │ 3   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/HuiWang-World" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮             │
│ │ Commands                                                                         │             │
│ ├──────────────────────────────────────────────────────────────────────────────────┤             │
│ │ 0  MoveCall:                                                                     │             │
│ │  ┌                                                                               │             │
│ │  │ Function:  mint                                                               │             │
│ │  │ Module:    HUIWANG_WORLD_NFT                                                  │             │
│ │  │ Package:   0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4 │             │
│ │  │ Arguments:                                                                    │             │
│ │  │   Input  0                                                                    │             │
│ │  │   Input  1                                                                    │             │
│ │  │   Input  2                                                                    │             │
│ │  │   Input  3                                                                    │             │
│ │  └                                                                               │             │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯             │
│                                                                                                  │
│ Signatures:                                                                                      │
│    emBkId5QhLWTQd9Qk+KCzBIpX/LDzr0X2ubnSX3AIv2uRf0TnrkfmPDVl6BltD0k6aKDUgS6xean9SQwvCj+BQ==      │
│                                                                                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4zy1ycmEQdNmVQKJU8EXyFjJb6dMeRuNhFMLPAcyx8XJ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 411                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x79caa15035e53a85160ca0e388423d3c6b81f971f2e0802796b1cb4f1fc02a6b                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715923                                                                                │
│  │ Digest: 9Uwkhxj1z3At6DfS71nUr9Qg8vnupTnuwhVFy8ckgw2g                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715923                                                                                │
│  │ Digest: GvCqd6QAAUDXGAQv39DqT2Kbi7eN5VvcaqPvoDUxzgRu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715923                                                                                │
│  │ Digest: 4NanNqAdgUnqoCZGjp6pZ7fUjhyN5PKn5ArVrJDvCgjj                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715923                                                                                │
│  │ Digest: GvCqd6QAAUDXGAQv39DqT2Kbi7eN5VvcaqPvoDUxzgRu                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4354800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2347488 MIST                                                                   │
│    Non-refundable Storage Fee: 23712 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5jgSn2czPHiKexXbT2jixXnBBetsGAuaJgnDshjt4sWv                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x79caa15035e53a85160ca0e388423d3c6b81f971f2e0802796b1cb4f1fc02a6b                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4::HUIWANG_WORLD_NFT::NFT       │
│  │ Version: 715923                                                                                              │
│  │ Digest: 9Uwkhxj1z3At6DfS71nUr9Qg8vnupTnuwhVFy8ckgw2g                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 715923                                                                                              │
│  │ Digest: GvCqd6QAAUDXGAQv39DqT2Kbi7eN5VvcaqPvoDUxzgRu                                                         │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4::HUIWANG_WORLD_NFT::AdminCap  │
│  │ Version: 715923                                                                                              │
│  │ Digest: 4NanNqAdgUnqoCZGjp6pZ7fUjhyN5PKn5ArVrJDvCgjj                                                         │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3007312                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 调用合约 生成转发给任务地址的nft

```shell
 sui client call  \
 --package  0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4 \
 --module HUIWANG_WORLD_NFT \
 --function mint \
 --args 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d "HuiWang-World" "HuiWang-World-NFT" "https://avatars.githubusercontent.com/HuiWang-World"
```

- 执行结果

```shell
Transaction Digest: 6VYn4zA6fgWHkTrDzd1sVewhXBg7hQGy5K3CwBe1jf8Y
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                       │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                    │
│ Gas Budget: 100000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                             │
│ Gas Payment:                                                                                     │
│  ┌──                                                                                             │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                        │
│  │ Version: 715923                                                                               │
│  │ Digest: GvCqd6QAAUDXGAQv39DqT2Kbi7eN5VvcaqPvoDUxzgRu                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Transaction Kind: Programmable                                                                   │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d  │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "HuiWang-World"                                       │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "HuiWang-World-NFT"                                   │ │
│ │ 3   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/HuiWang-World" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮             │
│ │ Commands                                                                         │             │
│ ├──────────────────────────────────────────────────────────────────────────────────┤             │
│ │ 0  MoveCall:                                                                     │             │
│ │  ┌                                                                               │             │
│ │  │ Function:  mint                                                               │             │
│ │  │ Module:    HUIWANG_WORLD_NFT                                                  │             │
│ │  │ Package:   0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4 │             │
│ │  │ Arguments:                                                                    │             │
│ │  │   Input  0                                                                    │             │
│ │  │   Input  1                                                                    │             │
│ │  │   Input  2                                                                    │             │
│ │  │   Input  3                                                                    │             │
│ │  └                                                                               │             │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯             │
│                                                                                                  │
│ Signatures:                                                                                      │
│    +7iX5FzkrMZXuSh6UkjeSjnMNJS+0aNdAfUn3+Cmsn0SuRsnvm7i97BF0XSgsrAh/YQQiGf/h08Av/BYx7XCCw==      │
│                                                                                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6VYn4zA6fgWHkTrDzd1sVewhXBg7hQGy5K3CwBe1jf8Y                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 411                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xeff0af6e2a74458870fd0c0ba18380279c730556d8c0196be95b088389e215fa                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715924                                                                                │
│  │ Digest: HAUnwtT475zgbPLkkxvWY8pdso8SUVRp3Ta7s2mzenwb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715924                                                                                │
│  │ Digest: 9FWFR5WtAZmB2F3vCEXUHDDK2rHXtxdTeXEqxg6BmTH                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715924                                                                                │
│  │ Digest: 92jCyZD1G7rLVrAcvTLGG3CV3sTdh5ni2NCzrUwP2Xus                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715924                                                                                │
│  │ Digest: 9FWFR5WtAZmB2F3vCEXUHDDK2rHXtxdTeXEqxg6BmTH                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4354800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2347488 MIST                                                                   │
│    Non-refundable Storage Fee: 23712 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4zy1ycmEQdNmVQKJU8EXyFjJb6dMeRuNhFMLPAcyx8XJ                                                   │
│    5jgSn2czPHiKexXbT2jixXnBBetsGAuaJgnDshjt4sWv                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0xeff0af6e2a74458870fd0c0ba18380279c730556d8c0196be95b088389e215fa                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4::HUIWANG_WORLD_NFT::NFT       │
│  │ Version: 715924                                                                                              │
│  │ Digest: HAUnwtT475zgbPLkkxvWY8pdso8SUVRp3Ta7s2mzenwb                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 715924                                                                                              │
│  │ Digest: 9FWFR5WtAZmB2F3vCEXUHDDK2rHXtxdTeXEqxg6BmTH                                                          │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x33750ff5ca080ff05e137a9b9f64864b8daa2babeaf9fce4480039ece0938d6d                                 │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                │
│  │ ObjectType: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4::HUIWANG_WORLD_NFT::AdminCap  │
│  │ Version: 715924                                                                                              │
│  │ Digest: 92jCyZD1G7rLVrAcvTLGG3CV3sTdh5ni2NCzrUwP2Xus                                                         │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3007312                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 给任务地址发送 nft

```shell
sui client transfer --gas-budget 10000000 \
  --object-id 0xeff0af6e2a74458870fd0c0ba18380279c730556d8c0196be95b088389e215fa \
  --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
```

- 执行结果

```shell
Transaction Digest: EFXq8s7D8xQLtotE2ZTFNmuNDu5xpPsHPMjBodNXXirQ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                    │
│  │ Version: 715924                                                                                           │
│  │ Digest: 9FWFR5WtAZmB2F3vCEXUHDDK2rHXtxdTeXEqxg6BmTH                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ │ 1   Imm/Owned Object ID: 0xeff0af6e2a74458870fd0c0ba18380279c730556d8c0196be95b088389e215fa              │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────╮                                                                                     │
│ │ Commands             │                                                                                     │
│ ├──────────────────────┤                                                                                     │
│ │ 0  TransferObjects:  │                                                                                     │
│ │  ┌                   │                                                                                     │
│ │  │ Arguments:        │                                                                                     │
│ │  │   Input  1        │                                                                                     │
│ │  │ Address: Input  0 │                                                                                     │
│ │  └                   │                                                                                     │
│ ╰──────────────────────╯                                                                                     │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    ghG1JT/AYWQFMZZSeO4XR18S6tk8cM8JlJu5fJQg7FG5wCoEX0eeSh7BZDGXJ9fRJNn1pIJT9wtEKSKyhbAjAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EFXq8s7D8xQLtotE2ZTFNmuNDu5xpPsHPMjBodNXXirQ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 411                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715925                                                                                │
│  │ Digest: EqheRAJt9rumDzJscPje2yiiQJzAxS6itp3Yo6ADSvoi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xeff0af6e2a74458870fd0c0ba18380279c730556d8c0196be95b088389e215fa                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 715925                                                                                │
│  │ Digest: EVHMT3iCTfBSRePHRCG3angXaHsN7qFcmR39XTCQktz4                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715925                                                                                │
│  │ Digest: EqheRAJt9rumDzJscPje2yiiQJzAxS6itp3Yo6ADSvoi                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2971600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2941884 MIST                                                                   │
│    Non-refundable Storage Fee: 29716 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6VYn4zA6fgWHkTrDzd1sVewhXBg7hQGy5K3CwBe1jf8Y                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                            │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                              │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                              │
│  │ Version: 715925                                                                                         │
│  │ Digest: EqheRAJt9rumDzJscPje2yiiQJzAxS6itp3Yo6ADSvoi                                                    │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ ObjectID: 0xeff0af6e2a74458870fd0c0ba18380279c730556d8c0196be95b088389e215fa                            │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )           │
│  │ ObjectType: 0xccacaaf4c31547838afd391e4cd1900d7b46d7e692902e5c25aa831501c993f4::HUIWANG_WORLD_NFT::NFT  │
│  │ Version: 715925                                                                                         │
│  │ Digest: EVHMT3iCTfBSRePHRCG3angXaHsN7qFcmR39XTCQktz4                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1029716                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

--- task end---