 



# windows安装SUI及任务一完成

## 安装SUI

1.安装过程遇到了很多报错，在windows下，一定要把自己的C++环境配置好，最方便的是在VS installer上安装好clang相关开发工具。

2.安装 [Protocol Buffers](https://github.com/protocolbuffers/protobuf/releases) 注意把环境变量设置好

3.cargo安装记得换源。

## 获取水龙头

```bash
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \ --header 'Content-Type: application/json' \ --data-raw '{"FixedAmountRequest":{"recipient":"<you_address>"}}'
```

这里面地址是可以换的，你可以在devnet上也可以在testnet上获取。

## 发布第一个合约

命令:

```bash
sui client publish --gas-budget 20000000 hello_world
```

返回：

```bash
FETCHING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
......                                                                                   │
│  │ PackageID: 0xce9e77b77af65d09fa18286bdd15ee8330f62163b28c010c97017e33853a88c8                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 3H36b5UBLHAVC52fEyc2fp9kJ3kMwwUBYUQGEiT93AAk                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7849880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



```
package id:0xce9e77b77af65d09fa18286bdd15ee8330f62163b28c010c97017e33853a88c8
```

## PS:向大佬们学习！！！