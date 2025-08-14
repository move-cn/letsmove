# Task 1 - hello move

## Sui Cli 基本操作

参照文档 [Sui CLI: Client](https://docs.sui.io/references/cli/client)

### 网络

1. 查看网络、添加网络、切换网络、领水

```bash
sui client envs
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443 # 创建环境
sui client switch --env testnet # 切换环境

sui client faucet
```

## 发布项目
### 新建项目
```bash
sui move new hello
```
### helloworld代码
```move
module hello::hello {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloObject has key, store {
        id: UID,
        /// 被 object 包含的字符串
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 --skip-fetch-latest-git-deps
```
得到packageid:0x8407a9ab216fcbbd6afb025c86642f5bc9aa1c38397303968c7113aebb5f544c