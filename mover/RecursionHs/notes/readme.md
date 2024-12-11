资料
- 视频代码 https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello
- ppt https://docs.google.com/presentation/d/1o5cg8B6kepxzfrAQTJmZCBJdyZ7RWwCwlVCO_PyBBVo/edit#slide=id.g312b69177c7_0_21
- 要求 https://github.com/move-cn/letsmove/blob/main/task/02.move_coin.md
- typescript-sdk https://sdk.mystenlabs.com/typescript
- 官方move 文档 https://docs.sui.io/guides/developer/first-app/write-package
- sui 浏览器 https://suivision.xyz/

#### 学习资料
- https://easy.sui-book.com/chapter_3.html
- https://intro-zh.sui-book.com/unit-three/lessons/3_witness_design_pattern.html
- https://github.com/RandyPen/sui-move-intro-course-zh
- 创建nft https://examples.sui-book.com/samples/nft.html


```shell
## 
##当前地址
sui client addresses 
##修改别名
sui keytool update-alias <老别名> <新别名>
##创建钱包
sui keytool generate secp256k1/ed25519
## 导入助记词
sui keytool import "助记词" secp256k1/ed25519
##导入私钥,其中KEY_SCHEME 为 ed25519 或 secp256k1
sui keytool import <private_key> <KEY_SCHEME>
##设置默认的钱包
sui client switch --address <wallet_address>

##当前网络环境
sui client active-env
##添加主网
sui client new-env --alias mainnet --rpc https://rpc.mainnet.sui.io:443
##切换网络环境
sui client switch --env mainnet
sui client switch --env testnet

##获取测试SUI
sui client faucet 
##查看gas
sui client gas 

##当前网络
sui client envs


##开发相关
##创建新项目
sui move new hello_move
##测试
sui move test --skip-fetch-latest-git-deps
##生成文档
sui move build  --doc
##发布并指定gas
sui client publish  --skip-fetch-latest-git-deps --gas-budget 3000
## 命令行调用方法
sui client call --function mint --module [module_name]  --package 0x60420571cc570199c16955006658e67c399f1a588972797acb007c29c300f8de --args 参数1 参数2 参数3

```

#### task2
```shell
##私有coin
##发布者的地址mint
sui client call --function mint --module turkey  --package 0xae70120916911a93f2295b54f65de9c94349606df617d6e7a9884822bc67ecfd --args 0x74dbc805087c1bc0b944aa09efb30de82abff330b122b6ac6127d74f423c212a 10000 0xf54f02036244432d8462f5122fe8d7141efce900accfe987187caff17130624d
##需要切换到其它的账号，再mint，就会失败!
sui client call --function mint --module turkey  --package 0xae70120916911a93f2295b54f65de9c94349606df617d6e7a9884822bc67ecfd --args 0x74dbc805087c1bc0b944aa09efb30de82abff330b122b6ac6127d74f423c212a 10000 0x3f82342aaa77f7147b26f3ee269a302ac4568aca98df643f535835823f2b0b84

###公共coin
##发布者的地址mint
sui client call --function mint --module alone  --package 0xf4027e1f9bb1364ba2b06ccc295905b7262b877cca86966946e36d6066581cce --args 0x4747e4f20a6ff3dcf9ac4c7d0cb4104b2bdfef8529366ca39ca3bfc9ed43331d 10000 0xf54f02036244432d8462f5122fe8d7141efce900accfe987187caff17130624d
##需要切换到其它的账号，再mint，就会成功!
sui client call --function mint --module alone  --package 0xf4027e1f9bb1364ba2b06ccc295905b7262b877cca86966946e36d6066581cce --args 0x4747e4f20a6ff3dcf9ac4c7d0cb4104b2bdfef8529366ca39ca3bfc9ed43331d 10000 0x3f82342aaa77f7147b26f3ee269a302ac4568aca98df643f535835823f2b0b84



```

### 对象操作
```shell
##nft转移
sui client transfer --object-id 0x2c58a784423a64ae68e0814d166a543d7d37a032f5dae0a7452253cbc030c7dd --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

```