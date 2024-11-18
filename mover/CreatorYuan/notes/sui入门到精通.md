# SUI 文档
https://docs.sui.io/guides

## cli 安装客户端
https://github.com/MystenLabs/sui
(下载最新版本)
https://github.com/MystenLabs/sui/releases/download/mainnet-v1.34.2/sui-mainnet-v1.34.2-windows-x86_64.tgz

解压即可使用 /d/sui 查看版本号

```shell
$ sui --version     # 查看版本号
sui 1.34.2-c9ae0f9282a0

```

连接到sui网络
https://fullnode.<SUI-NETWORK-VERSION>.sui.io:443

localnet http://0.0.0.0:9000
devnet https://fullnode.devnet.sui.io:443
testnet https://fullnode.testnet.sui.io:443
mainnet https://fullnode.mainnet.sui.io:443

配置连接到测试网络 Connect to Testnet
```shell

$ sui client
Config file ["C:\\Users\\Administrator\\.sui\\sui_config\\client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Testnet if not specified) : https://fullnode.testnet.sui.io:443
Environment alias for [https://fullnode.testnet.sui.io:443] : testnet
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
0

# 根据提示输入内容
```
## 查看配置环境
```shell
$ sui client envs
[warn] Client/Server api version mismatch, client api version : 1.34.2, server api version : 1.34.1
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯

```

## 添加新的网络
sui client new-env --alias <ALIAS> --rpc <RPC-SERVER-URL>

* localnet => http://0.0.0.0:9000 (active)
* devnet => https://fullnode.devnet.sui.io:443
* testnet => https://fullnode.testnet.sui.io:443
* mainnet => https://fullnode.mainnet.sui.io:443

```shell

sui client new-env --alias localnet --rpc http://0.0.0.0:9000   # 需要本地运行服务

sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443

sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443

sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443

$ sui client envs
[warn] Client/Server api version mismatch, client api version : 1.34.2, server api version : 1.34.1
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
╰─────────┴─────────────────────────────────────┴────────╯

```

## 切换使用的sui网络
sui client switch --env <ALIAS>

```shell

sui client switch --env devnet
sui client switch --env testnet
sui client switch --env mainnet

```


* 查看本地钱包中所有地址
* sui keytool list

## 危险
与 Sui 地址关联的私钥存储在安装 CLI 的计算机上的本地文件中。确保您不要将此内容暴露给任何人，因为他们可以使用它来访问您的帐户。
* ~/.sui/sui_config/sui.keystore


## 生成新的 Sui 地址
sui client new-address ed25519 ed25519

## 获取 SUI 代币
```shell
# devnet
curl --location --request POST 'https://faucet.devnet.sui.io/v1/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x664dd507c7acf6fd40fe7670296d3a5bf93ac41ef8c7909b32b5bd034d3b2f7a"
    }
}'

# testnet
curl --location --request POST 'https://faucet.testnet.sui.io/v1/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x664dd507c7acf6fd40fe7670296d3a5bf93ac41ef8c7909b32b5bd034d3b2f7a"
    }
}'


```

使用 Sui TypeScript-SDK 访问水龙头
```

import { getFaucetHost, requestSuiFromFaucetV0 } from '@mysten/sui/faucet';

// get tokens from the Devnet faucet server
await requestSuiFromFaucetV0({
	// connect to Devnet
	host: getFaucetHost('devnet'),
	recipient: '<YOUR SUI ADDRESS>',
});




```

## 使用 GraphQL 查询 Sui RPC
graphql-rpc
https://docs.sui.io/concepts/graphql-rpc
```
curl -i -X POST https://sui-mainnet.mystenlabs.com/graphql \
     --header 'x-sui-rpc-show-usage: true'                 \
     --header 'Content-Type: application/json'             \
     --data '{
          "query": "query { epoch { referenceGasPrice } }"
     }'

```
sui client faucet
sui client gas
0xf6811db11e9e7840efab14e32de8594c4133cc5998eec2e8e98bcb4ad73c70da
 sui client objects 0xf6811db11e9e7840efab14e32de8594c4133cc5998eec2e8e98bcb4ad73c70da


