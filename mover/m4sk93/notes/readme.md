
## task1 

https://docs.sui.io/guides/developer/getting-started/connect#configure-sui-client
https://docs.sui.io/guides/developer/first-app/write-package



https://medium.com/@andreidev/publish-a-hello-world-smart-contract-on-sui-network-414bb1bac245
https://suiscan.xyz/testnet/object/0x3737f9b6b90b74f087b1db32ec2beaceb7688e55b9dba8bb6889038bb208e2d5/contracts

## task2

### coin

- 10_coin协议_move编程语言2024版本
https://www.bilibili.com/video/BV1tf42127Co/?spm_id_from=333.788
https://www.bilibili.com/video/BV1Kw4m197ae/?spm_id_from=333.788.recommend_more_video.13

- https://docs.sui.io/guides/developer/sui-101/create-coin
示例有错
```
struct MYCOIN has drop {}
```
应该添加public

- https://sui-book.com/framework/02.coin.html

```
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xc826cb5f07f8e4b65e9e6170d9be14f6c2bd1b2f65d7835a9f31562786ea77a4                                                       │
│  │ Sender: 0xfd72aa1c93c65b9487ca060a32bff2851624117d35078f54618384b1e0d16849                                                         │
│  │ Owner: Account Address ( 0xfd72aa1c93c65b9487ca060a32bff2851624117d35078f54618384b1e0d16849 )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x2a056973b19d7ac2a202acdb7ec1d952a51dde475a9ee579ba6b2d594bf1dea6::m4sk93_coin::M4SK93_COIN>   │
│  │ Version: 1248931                                                                                                                   │
│  │ Digest: 3ywK1W96939rB6A3Ar6Htd8wCQ17erKFVXnDs6SomuZK
...
PackageID: 0x2a056973b19d7ac2a202acdb7ec1d952a51dde475a9ee579ba6b2d594bf1dea6
```
```
sui client call --function mint --module mycoin --package <PACKAGE-ID> --args <TREASURY-CAP-ID> <COIN-AMOUNT> <RECIPIENT-ADDRESS> --gas-budget <GAS-AMOUNT>
sui client call --function mint --module m4sk93_coin --package 0x2a056973b19d7ac2a202acdb7ec1d952a51dde475a9ee579ba6b2d594bf1dea6 --args 0xc826cb5f07f8e4b65e9e6170d9be14f6c2bd1b2f65d7835a9f31562786ea77a4 100 0xe13769b8c84f7c4011d001c1d9e5c471e8d5fb612cb44b76fcfbf0eebaa08ced --gas-budget 50000000
```
https://suiscan.xyz/testnet/tx/5cReZ9J9pXPJK9FoTPJA4TFk1ZLERs1dHqXqJbn9Esj8

### faucet

- public_transfer 独享 mint权限 
- public_share_object 共享 mint权限

两个改动 
```
    ...
        ///transfer::public_transfer(treasury, tx_context::sender(ctx));
        ///The Coin<T> is a generic implementation of a coin on Sui.
        ///Access to the TreasuryCap provides control over the minting and burning of coins.
        ///Further transactions can be sent directly to the sui::coin::Coin with TreasuryCap object as authorization.


        transfer::public_share_object(treasury)
    }

    ///public fun mint(
    public entry fun mint(
    ...
```

```
PackageID: 0x8194063d47171bcbdd6e7ddce605aa8a6bd8b482315ca236a909695d9e5a9fe2
TreasuryCap: 0x00f68f1b2d0c87e6d1aa55f2dc82e16683e18eee72d7e1f871349f2a18776aac
sui client call --function mint --module m4sk93_faucet_coin --package 0x8194063d47171bcbdd6e7ddce605aa8a6bd8b482315ca236a909695d9e5a9fe2 --args 0x00f68f1b2d0c87e6d1aa55f2dc82e16683e18eee72d7e1f871349f2a18776aac 200 0xe13769b8c84f7c4011d001c1d9e5c471e8d5fb612cb44b76fcfbf0eebaa08ced --gas-budget 50000000
```
也可以在网页版mint  
https://suiscan.xyz/testnet/object/0x8194063d47171bcbdd6e7ddce605aa8a6bd8b482315ca236a909695d9e5a9fe2/txs

### coin(主网测试)

** sui client publish ** 报错
```
Failed to publish the Move module(s), reason: [warning] Multiple source verification errors found:

- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::deny_list
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000001::MoveStdlib::type_name
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::object

This may indicate that the on-chain version(s) of your package's dependencies may behave differently than the source version(s) your package was built against.

Fix this by rebuilding your packages with source versions matching on-chain versions of dependencies, or ignore this warning by re-running with the --skip-dependency-verification flag.
```
解决办法:把Move.toml中依赖修改为** framework/mainnet ** 还不行就
```
sui client publish --skip-dependency-verification
```

```
TreasuryCap:
0x5eeffd6ca1fb38d63701ea8e1a3c1f3bff348441aec0a1eeae45f023eb62d120
PackageID: 
0x38974bd3a9dad0e8274024b49642e2f0fa94fc4889219791e3742c8730528fd0
sui client call --function mint --module m4sk93_coin --package 0x38974bd3a9dad0e8274024b49642e2f0fa94fc4889219791e3742c8730528fd0 --args 0x5eeffd6ca1fb38d63701ea8e1a3c1f3bff348441aec0a1eeae45f023eb62d120 100 0xe13769b8c84f7c4011d001c1d9e5c471e8d5fb612cb44b76fcfbf0eebaa08ced --gas-budget 50000000
```

### faucet coin (主网测试)

```
TreasuryCap:
0xaa6391b1bd2e95cd3d10418c540c79c4aac371677aa9e4c6f54c6551a48cc38e
PackageID: 
0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982
sui client call --function mint --module m4sk93_faucet_coin --package 0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982 --args 0xaa6391b1bd2e95cd3d10418c540c79c4aac371677aa9e4c6f54c6551a48cc38e 200 0xe13769b8c84f7c4011d001c1d9e5c471e8d5fb612cb44b76fcfbf0eebaa08ced --gas-budget 50000000
```
网页再mint一下  
https://suiscan.xyz/mainnet/object/0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982/contracts
https://suiscan.xyz/mainnet/object/0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982/txs

## task3

https://medium.com/building-on-sui/code-in-move-6-minting-nfts-on-sui-with-kiosk-5d9ba1636a7b 


mint 一个 nft 发送到地址: 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
https://suiscan.xyz/mainnet/object/0xf01b9c73ad3b205ff2d4666266168173df0bd4d1c0661b80d59803c2ba64fe70/contracts

网页加载太慢，用命令行吧
```
sui client call --function mint_and_transfer --module m4sk93_nft --package 0xf01b9c73ad3b205ff2d4666266168173df0bd4d1c0661b80d59803c2ba64fe70 --args first_m4sk93_nft 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2  --gas-budget 50000000
```
https://suiscan.xyz/mainnet/tx/5QnRk6wUasMNYzXpVjHyMiBmtyhCJ4wEfMrUWLyrfio8

## task4

### 如何使用task2的合约
```
[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/mainnet" }
m4sk93_faucet_coin= { local = "../../task2/m4sk93_faucet_coin" }
```
同时修改m4sk93_faucet_coin的Move.toml
```
[package]
published-at = "0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982" # package id
[addresses]
m4sk93_faucet_coin = "0xe799e4d1324db8877c827cb4ca78dc065a8f9ef70fbe705e4c8c37250e195982" # package id
```
## task5

https://github.com/MystenLabs/sui/blob/main/sui_programmability/examples/defi/sources/pool.move

https://github.com/sui-foundation/sui-move-intro-course/blob/main/unit-three/lessons/3_witness_design_pattern.md#the-phantom-keyword

## task6

### dapp-kit helloword
- https://sdk.mystenlabs.com/dapp-kit
- [Let's move - Sui Dapp Kit Hello Sui交互](https://www.learnblockchain.cn/article/7514)

```
$ npm create @mysten/dapp
▸ react-client-dapp React Client dApp that reads data from wallet and the blockchain
  react-e2e-counter React dApp with a move smart contract that implements a distributed counter

$ cd my-first-sui-dapp && tree
.
├── index.html
├── package.json
├── prettier.config.cjs
├── README.md
├── src
│   ├── App.tsx
│   ├── main.tsx
│   ├── OwnedObjects.tsx
│   ├── vite-env.d.ts
│   └── WalletStatus.tsx
├── tsconfig.json
├── tsconfig.node.json
└── vite.config.ts

2 directories, 12 files
```
之前已经在chrome安装了钱包,直接执行查看一下效果
```
$ npm install
$ npm run dev

  VITE v4.5.3  ready in 186 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h to show help
```
连接钱包后显示
```
Wallet Status
Wallet connected
Address: 0xe13......
Objects owned by the connected wallet
Object ID: 0x287......
Object ID: 0xce0......
```

关于.tsx：在TypeScript语言中支持JSX语法.TypeScript编译器可以将JSX语法转换为React.createElement函数调用的形式，从而在运行时创建React组件。


### PDT

Programmable Transaction Blocks
https://docs.sui.io/concepts/transactions/prog-txn-blocks
PTBs allow a user to call multiple Move functions, manage their objects, and manage their coins in a single transaction--without publishing a new Move package.

```
npm i @mysten/sui.js
npm i navi-sdk
```
https://naviprotocol.gitbook.io/navi-protocol-developer-docs/how-to-interact-with-the-contract/navi-sdk#navi-flash-loan-sample
https://sdk.mystenlabs.com/dapp-kit/wallet-hooks/useSignAndExecuteTransactionBlock

Navi不能在devnet/testnet中使用？?
修改main.tsx 中的defaultNetwork
```
        <SuiClientProvider networks={networkConfig} defaultNetwork="mainnet">
```
https://suiscan.xyz/mainnet/tx/7Mt6Cu9xSEWRxCdPsczZEbi6NBCYYa2JnBN21pz3Nifh

Todo:
- withdrawCoin测试失败
