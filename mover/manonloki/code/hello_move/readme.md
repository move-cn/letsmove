# Hello Move

## 钱包安装
在Chrome Extension中 安装 Sui Wallet

## 安装Sui CLI

```
brew install sui
```
## 切换测试网络

```
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443


sui client switch --env testnet

```

## 获取自己的钱包地址
```
sui client active-address
```

## 给自己用水龙头充Token
```
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6"
    }
}'
```

## 查看自己拥有的gas
```
sui client gas
```

## 创建项目
```
sui move new hello_move
```

## 编译项目
```
sui move build
```

## 发布上链
```
sui client publish 
```

## 结果
```
Transaction Digest: G2qtj3rfeRC8ZkocmQmKUNT7kMVKpaqKY5VpAsd6ehAb
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6                                   │
│ Gas Owner: 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3601e8a2e0104482912b9628a6d73a0c4b1b66a77d853b14b96f58f55964d5cd                                    │
│  │ Version: 1063590                                                                                          │
│  │ Digest: 7VkmZ13X8nwbaKjKejNt7as3AWNqLkJvQiEvUa6ddDxK                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6" │ │
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
│    gnbd/GAogqsMmAFAZQrLrId+NRjEXHPgs03fA99QBm1qie6qwXmTqjZtrtzz1EQC06WjTP+K39OHKPBofTOUDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: G2qtj3rfeRC8ZkocmQmKUNT7kMVKpaqKY5VpAsd6ehAb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x23117c71f58321292ceabff92da383208bf84fd31c9579d50a8fd894656b34ea                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AUgVzn3X1ryyqYJHKHut6zKmnCjvddanM8jV2Pc5jaGG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x731cf189fa0564c111717c88910758ab49f9be2c0cafdaf20cba0b7ce1f2a760                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )  │
│  │ Version: 1063591                                                                               │
│  │ Digest: BDW8LRyR4qc9L9SXvRo4LvfUy8K3oRWnwfFuMVobhYbQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xed4339ce4d979eee21347f0479c594de47634b1b91b4f8454fcc0e861ae54633                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )  │
│  │ Version: 1063591                                                                               │
│  │ Digest: BKCNcsmjhUzkKHDeuP2Zwddh1zcs9qjn88fkQDZmJ39U                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3601e8a2e0104482912b9628a6d73a0c4b1b66a77d853b14b96f58f55964d5cd                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )  │
│  │ Version: 1063591                                                                               │
│  │ Digest: Bc5Phe7LAo26NB6781QAieotQRwa2M5EjXfxS9WyA7Y9                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3601e8a2e0104482912b9628a6d73a0c4b1b66a77d853b14b96f58f55964d5cd                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )  │
│  │ Version: 1063591                                                                               │
│  │ Digest: Bc5Phe7LAo26NB6781QAieotQRwa2M5EjXfxS9WyA7Y9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8922400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2s9EQHPbfBXZiUYVqLr2REsjwtWJtiLXwDqvwXkdv4FH                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x731cf189fa0564c111717c88910758ab49f9be2c0cafdaf20cba0b7ce1f2a760                       │
│  │ Sender: 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                               │
│  │ Version: 1063591                                                                                   │
│  │ Digest: BDW8LRyR4qc9L9SXvRo4LvfUy8K3oRWnwfFuMVobhYbQ                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0xed4339ce4d979eee21347f0479c594de47634b1b91b4f8454fcc0e861ae54633                       │
│  │ Sender: 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )      │
│  │ ObjectType: 0x23117c71f58321292ceabff92da383208bf84fd31c9579d50a8fd894656b34ea::hello_move::Hello  │
│  │ Version: 1063591                                                                                   │
│  │ Digest: BKCNcsmjhUzkKHDeuP2Zwddh1zcs9qjn88fkQDZmJ39U                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x3601e8a2e0104482912b9628a6d73a0c4b1b66a77d853b14b96f58f55964d5cd                       │
│  │ Sender: 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6                         │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 1063591                                                                                   │
│  │ Digest: Bc5Phe7LAo26NB6781QAieotQRwa2M5EjXfxS9WyA7Y9                                               │
│  └──                                                                                                  │
│ Published Objects:                                                                                    │
│  ┌──                                                                                                  │
│  │ PackageID: 0x23117c71f58321292ceabff92da383208bf84fd31c9579d50a8fd894656b34ea                      │
│  │ Version: 1                                                                                         │
│  │ Digest: AUgVzn3X1ryyqYJHKHut6zKmnCjvddanM8jV2Pc5jaGG                                               │
│  │ Modules: hello_move                                                                                │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb250c941956ba513b39feb80516a437a170b8c1c6faffec217f25c50e22989f6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8944280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

## 相关ID
PackageID : 0x23117c71f58321292ceabff92da383208bf84fd31c9579d50a8fd894656b34ea 