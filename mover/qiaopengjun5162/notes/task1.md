# sui move 学习笔记

## 安装 sui

```sh
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

### 参考

- <https://docs.sui.io/guides/developer/getting-started/sui-install>

## 查看 sui 版本

```sh
    sui --version
    sui 1.22.0-9e79b6f49
```

## 查看 sui 地址

```sh
    sui client addresses
╭──────────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias                │ address                                                            │ active address │
├──────────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ dazzling-chrysoprase │ 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 │ *              │
╰──────────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
```

## 检查当前可用的环境

```sh
sui client envs
╭─────────┬───────────────────────────────────────┬────────╮
│ alias   │ url                                   │ active │
├─────────┼───────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443    │        │
│ mainnet │ https://sui-mainnet.nodeinfra.com:443 │        │
│ testnet │ https://fullnode.testnet.sui.io:443   │ *      │
╰─────────┴───────────────────────────────────────┴────────╯
```

## 获取 sui 代币

```sh
    sui client faucet
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
```

### 参考

- <https://docs.sui.io/guides/developer/getting-started/get-coins>

## 查询余额

```sh
    sui client gas
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74 │ 873551732          │ 0.87             │
│ 0x3fb5d73b96a9fcdfd9c30e952e1413e9615b76a9cfe9fa0d65d30e0289488f59 │ 985491472          │ 0.98             │
│ 0x403b24a043814c15a6a0352ebc408c247b99b68b22f00e0b7964588d88f82c40 │ 1000000000         │ 1.00             │
│ 0x7044b5d86863ae20d497e4f0e256ab693550804f2d77d50f6498dd0ee7c1cb01 │ 1000000000         │ 1.00             │
│ 0x72b671bcc24a7e29f4472c424d44ac0417521e374e447cb0516c9ada06ffb0b7 │ 1000000000         │ 1.00             │
│ 0x8abfdeeaf650a4d5600076a5f6f3a60a3fd62ed058972588b1f6adff8969ffec │ 1000000000         │ 1.00             │
│ 0xabe40928fcb9a8254fa68668e37435e3af92d16c531f3a422878ad142ca0ed4a │ 1000000000         │ 1.00             │
│ 0xc5bb1833c86d7e0809880cedc6c2125dc1a4bbe48cb6af1ba500ed95d1aac988 │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```

## 首先fork`letsmove`项目然后克隆并参与

```sh
git clone git@github.com:qiaopengjun5162/letsmove.git
cd letsmove/
cd mover/
# 复制 mover 目录下的 001 并且用自己的 github id 命名复制的目录
cp -a 001 qiaopengjun5162
cd qiaopengjun5162/
```

## 创建项目

```sh
    sui move new hello_move
```

## 发布上链

```sh
    sui client publish 
```

### 实操

```sh
sui client publish 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
warning[W02021]: duplicate alias
  ┌─ sources/hello_move.move:4:23
  │
4 │     use sui::object::{Self,UID};
  │                       ^^^^ Unnecessary alias 'object' for module 'sui::object'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W02021]: duplicate alias
  ┌─ sources/hello_move.move:4:28
  │
4 │     use sui::object::{Self,UID};
  │                            ^^^ Unnecessary alias 'UID' for module member 'sui::object::UID'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W02021]: duplicate alias
  ┌─ sources/hello_move.move:6:27
  │
6 │     use sui::tx_context::{TxContext, sender};
  │                           ^^^^^^^^^ Unnecessary alias 'TxContext' for module member 'sui::tx_context::TxContext'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Transaction Digest: 63r9vnbmScKyBWqBdnzXforCbER7JPSXxFayHnnprhrx
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                                    │
│  │ Version: 18128025                                                                                         │
│  │ Digest: ByYLSPGGhnCeRwYebzEH1q7xK2WK6T3Hs1qMRooHuXdY                                                      │
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
│    pZFwcnZMwaFgegCULJKX1VzmFqlRWsr9ZPz8G6czRkIsVy0uiL898GMsLpm1piCiJo17TJiudOlZMjV3xd3FCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 63r9vnbmScKyBWqBdnzXforCbER7JPSXxFayHnnprhrx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60b91385a64ed5850a323be36c495b85d49b8fed3a654ff0d26022817145c815                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 18128026                                                                              │
│  │ Digest: 5DH7yUFpsHywgyoZfY8UzKPjGE4y2pffY2Gk1nAMj6np                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7b3bf24e77887f8a4cb690cf8a1de04f087ea496587427a0dca3a884f4709af3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: BwyaqbGvMgBKQ9Hy9qZvaPm3sWZ3rvLurVN9kdU1rgtj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe04f93855dbda0a47ae90f4137a470d959ea6f363aa3645fb9cd198bc88d18d9                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 18128026                                                                              │
│  │ Digest: 3RhSZJrSZT6vC6brHAQ31AFtuytL1xwhnna6p46zaivL                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 18128026                                                                              │
│  │ Digest: 4op7nokDh5zjUSovwFYuMuBro9CVnuTzgQgGACey6aSY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 18128026                                                                              │
│  │ Digest: 4op7nokDh5zjUSovwFYuMuBro9CVnuTzgQgGACey6aSY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8922400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    DserJHKmHtJLCyJBtoyn8d2tiRARfs95nmfVpK7DcVbb                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x60b91385a64ed5850a323be36c495b85d49b8fed3a654ff0d26022817145c815                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                               │
│  │ Version: 18128026                                                                                  │
│  │ Digest: 5DH7yUFpsHywgyoZfY8UzKPjGE4y2pffY2Gk1nAMj6np                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0xe04f93855dbda0a47ae90f4137a470d959ea6f363aa3645fb9cd198bc88d18d9                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )      │
│  │ ObjectType: 0x7b3bf24e77887f8a4cb690cf8a1de04f087ea496587427a0dca3a884f4709af3::hello_move::Hello  │
│  │ Version: 18128026                                                                                  │
│  │ Digest: 3RhSZJrSZT6vC6brHAQ31AFtuytL1xwhnna6p46zaivL                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x3d1c101413a5668bfe8bdfcbfe871702e2198f0624b0d89d440aa9461943eb74                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 18128026                                                                                  │
│  │ Digest: 4op7nokDh5zjUSovwFYuMuBro9CVnuTzgQgGACey6aSY                                               │
│  └──                                                                                                  │
│ Published Objects:                                                                                    │
│  ┌──                                                                                                  │
│  │ PackageID: 0x7b3bf24e77887f8a4cb690cf8a1de04f087ea496587427a0dca3a884f4709af3                      │
│  │ Version: 1                                                                                         │
│  │ Digest: BwyaqbGvMgBKQ9Hy9qZvaPm3sWZ3rvLurVN9kdU1rgtj                                               │
│  │ Modules: hello_move                                                                                │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8944280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## sui 浏览器查看

- <https://testnet.suivision.xyz/package/0x7b3bf24e77887f8a4cb690cf8a1de04f087ea496587427a0dca3a884f4709af3?tab=Transaction+Blocks>
- <https://suiexplorer.com/object/0x7b3bf24e77887f8a4cb690cf8a1de04f087ea496587427a0dca3a884f4709af3?network=testnet>
