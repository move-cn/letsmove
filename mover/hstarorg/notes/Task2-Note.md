**核心目标是创建两个 Coin，并部署到主网**

1. 通过 `sui move new sui_coin` 创建合约项目
2. Move & Sui 学习资料
   * https://move-book.com/index.html
   * https://examples.sui.io/basics/init-function.html
   * https://docs.sui.io/guides/developer/sui-101/create-coin
3. 部署
```bash
# 添加主网环境
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443

# 激活主网环境
sui client switch --env mainnet

# 执行发布
sui client publish
```
4. 合约调用
```bash
sui client call --function mint --module mycoin --package <PACKAGE-ID> --args <TREASURY-CAP-ID> <COIN-AMOUNT> <RECIPIENT-ADDRESS> --gas-budget <GAS-AMOUNT>

# Mint Hstar Coin (100个)
sui client call --function mint --module hstar_coin --package 0x1fead036b0e07882f7c127996c481a703de68071bd6a09a7ce49b8298e8d38ad --args 0x0121dfa128e2f330a59349b62131d92d3e4bf361050743874a350e6bd2b8007e 100000000 0xfb5a2e9c0cef2d6aa6e01ac671ddb4761ea97852abccb39591a204f5438c66c6

# Mint Hstar Faucet Coin (200个)
sui client call --function mint --module faucet_coin --package 0x1fead036b0e07882f7c127996c481a703de68071bd6a09a7ce49b8298e8d38ad --args 0x94630b425addf51541d382d3982f2935f464d0cc88f01430bf94c08dd17607cb 200000000 0xfb5a2e9c0cef2d6aa6e01ac671ddb4761ea97852abccb39591a204f5438c66c6
```


## 开发环境
* VSC 插件(sui-move-analyzer): https://marketplace.visualstudio.com/items?itemName=MoveBit.sui-move-analyzer
* LSP(move): `cargo install --git http://github.com/movebit/sui-move-analyzer --branch master sui-move-analyzer`
* 一直没在 VSC 跑通代码格式化，如果有知道的，可以告诉我下
 
RustRover 也是一种选择（有格式化！！！）：
* Move 插件: https://github.com/pontem-network/intellij-move

## GAS 申请
```bash
# 查看本地地址
sui client active-address

# 申请 gas（需要切换到测试用网络：如 testnet, devnet）
sui client faucet

# 检查gas
sui client gas

# 查看本地地址（私钥地址：~/.sui/sui_config/sui.keystore）
sui keytool list

# 转换地址私钥: https://github.com/sui-foundation/sips/blob/main/sips/sip-15.md
sui keytool convert <keytool list 中的私钥>
```

## 典型问题

### 1. move-analyzer 插件报错: `Error parsing '[package]' section of manifest`
VSCode 安装 `move-analyzer` 并按照流程 `cargo install --git https://github.com/move-language/move move-analyzer` 安装 LSP 之后，会遇到如上错误

解决办法: sui 文档散乱，选错插件了。请换用 sui-move-analyzer

相关链接： 
* https://github.com/move-language/move/issues/801
* https://github.com/move-language/move/issues/1109


## 2. VSC 代码格式化（暂未找到方案）