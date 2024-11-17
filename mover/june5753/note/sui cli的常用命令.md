# sui cli的常用命令

## 新建一个项目
sui move new xxx

## 查询现在使用的地址
sui client active-address

## 新建一个地址
sui client new-address ed25519

## 查询目前拥有的账户列表
sui client addresses

## 切换指定地址
sui client switch --address <YOUR ADDRESS>

## 导入已有地址
sui keytool import "<助记词>" ed25519

## 编译一个合约
sui move build

## 发布一个合约
sui client publish --gas-budget <you_expect_gas_budget>

## 调用合约
sui client call --function <函数名> --args <传入的函数参数> --type-args <如果有泛型，请指明泛型类型，否则会反序列化失败> --package <包的地址> --module <模块名> --gas-budget <you_expect_gas_budget>

## 查看已配置网络
sui client envs

## 添加网络
sui client new-env --alias <ALIAS> --rpc <RPC-SERVER-URL>
## 添加主网示例：
sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443


## 切换网络
sui client switch --env <ALIAS>

## 获取 gas 
sui client faucet


> 由于浏览器钱包 Sui Wallet 采用的是 ed25519，所以在Cli中，我们最好也使用 ed25519 创建账号，否则导入 Sui Wallet 中地址会不同。
