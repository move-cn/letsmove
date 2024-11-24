资料
- https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello
- ppt https://docs.google.com/presentation/d/1o5cg8B6kepxzfrAQTJmZCBJdyZ7RWwCwlVCO_PyBBVo/edit#slide=id.g312b69177c7_0_21
- 要求 https://github.com/move-cn/letsmove/blob/main/task/02.move_coin.md
- typescript-sdk https://sdk.mystenlabs.com/typescript
- 官方move 文档 https://docs.sui.io/guides/developer/first-app/write-package
- sui 浏览器 https://suivision.xyz/

#### 学习资料
- https://easy.sui-book.com/chapter_3.html


```shell
## 
##当前地址
sui client addresses 
##获取测试SUI
sui client faucet 
##查看gas
sui client gas 
##导入私钥,其中KEY_SCHEME 为 ed25519 或 secp256k1
sui keytool import <private_key> <KEY_SCHEME>
##设置默认的钱包
sui client switch --address <wallet_address>
##当前网络
sui client envs


##开发相关
##创建新项目
sui move new hello_move
##测试
sui move test
##生成文档
sui move build  --doc
##发布并指定gas
sui client publish  --skip-fetch-latest-git-deps --gas-budget 3000
## 命令行调用方法
sui client call --function mint --module [module_name] --package 0x60420571cc570199c16955006658e67c399f1a588972797acb007c29c300f8de

```