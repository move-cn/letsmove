# task1

## 安装 sui

去 [https://github.com/MystenLabs/sui](https://github.com/MystenLabs/sui) 下载解压，并添加到环境变量中

## sui cli 基本使用

1. `sui --version`

2. `sui client`

3. `sui client address`（**需要保存助记词**）

4. `curl --location --request POST 'https://faucet.testnet.sui.io/v1/gas' --header 'Content-Type: application/json' --data-raw '{ "FixedAmountRequest": { "recipient": "0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4" } }' `


## 新建 package

1. `sui move new hello_move`

2. 国内修改 move.toml 中的 git 标准库链接为 `https://gitee.com/mystenLabs/sui.git`

## 发布上链

1. `sui client publish `
