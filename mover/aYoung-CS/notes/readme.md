# sui

## 安装

https://docs.sui.io/guides/developer/getting-started/sui-install
windows直接`choco install sui`就好了

## 连接到sui本地网络

每次执行`sui-test-validator`都是新开一个网络，没有之前的数据

访问本地节点，成功回显：
```shell
ubuntu@VM-16-7-ubuntu:~/sui/target/release$ curl --location --request POST 'http://127.0.0.1:9000' \
> --header 'Content-Type: application/json' \
> --data-raw '{
>   "jsonrpc": "2.0",
>   "id": 1,
>   "method": "sui_getTotalTransactionBlocks",
>   "params": []
> }'
{"jsonrpc":"2.0","result":"2","id":1}
```

### 管理网络

- 切换网络: `sui client switch --env [network alias]`
- 默认网络别名:
  - 本地网 localnet: http://0.0.0.0:9000
  - 开发网 devnet: https://fullnode.devnet.sui.io:443
  - 测试网 testnet: https://fullnode.testnet.sui.io:443
- 列出当前所有网络别名: `sui client envs`
- 添加新的网络别名: `sui client new-env --alias <ALIAS> --rpc <RPC>`

### 查询启用地址和 Gas Objects

- 查询当前保存了密钥的地址: `sui client addresses`
- 查询当前启用的地址: `sui client active-address`
- 列出所拥有的 gas objects: `sui client gas`
- 查询余额：`sui client balance`

## 获取token

在discord频道发消息

或者
```shell
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR SUI ADDRESS>"
    }
}'
```

## 导出私钥

命令行创建的默认钱包，使用`sui keytool export --key-identity <suiAddress>`可以得到以`suiprivkey`开头的私钥

## Package

新建：`sui move new <xxxx>`
测试：`sui move test`或者`sui move test <xxxx>`，后者测试名字包含xxxx的
发布：`sui client publish --gas-budget 100000000`

