# 在sui上使用`pyth`预言机

在日常开发中，区块链具备天然的自我封闭性，造成它与现实世界有一座无形的屏障。

无法跟现实世界直接交互，比如传统的互联网应用，可以通过第三方数据发布平台，方便的捕获现实世界发生的事件。

但是因为区块链是具备一套自我运行的系统，在区块链运行中，想要获取可靠现实数据，比如新闻资讯，股票价格，就必然需要可以可靠的信源。

那么预言机的概念的项目就应运而生。

## 预言机是什么？

预言机是将链上智能合约与链下数据连接起来的服务。为了安全性和可靠性，区块链本质上与外部来源隔离。

Sui 也不例外，这意味着您的项目无法直接获取真实世界的信息，例如股票价格、天气数据或体育比分。

预言机在区块链和外部数据源之间架起了一座桥梁，提取这些信息并以安全且可验证的方式提供给智能合约。

## 如何在sui区块链中集成？
如果想要集成，我们需要引入pyth官方提供的sdk`https://github.com/pyth-network/pyth-crosschain.git`

> 主网

```toml
[dependencies.Pyth]
git = "https://github.com/pyth-network/pyth-crosschain.git"
subdir = "target_chains/sui/contracts"
rev = "sui-contract-mainnet"
 
[dependencies.Wormhole]
git = "https://github.com/wormhole-foundation/wormhole.git"
subdir = "sui/wormhole"
rev = "sui-upgrade-mainnet"
 
# Pyth is locked into this specific `rev` because the package depends on Wormhole and is pinned to this version.
 
[dependencies.Sui]
git = "https://github.com/MystenLabs/sui.git"
subdir = "crates/sui-framework/packages/sui-framework"
rev = "041c5f2bae2fe52079e44b70514333532d69f4e6"
```

>测试网

```toml
[dependencies.Pyth]
git = "https://github.com/pyth-network/pyth-crosschain.git"
subdir = "target_chains/sui/contracts"
rev = "sui-contract-testnet"
 
[dependencies.Wormhole]
git = "https://github.com/wormhole-foundation/wormhole.git"
subdir = "sui/wormhole"
rev = "sui-upgrade-testnet"
 
# Pyth is locked into this specific `rev` because the package depends on Wormhole and is pinned to this version.
[dependencies.Sui]
git = "https://github.com/MystenLabs/sui.git"
subdir = "crates/sui-framework/packages/sui-framework"
rev = "041c5f2bae2fe52079e44b70514333532d69f4e6"
```

`pyth`也提供了一个javascript-sdk

```shell
npm install --save @pythnetwork/pyth-sui-js
```

## 如何在sui合约中使用？


## 总结