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
得到packageid:0x6cc1af6531eed095483aba7504641758a6e2f877e50f0249242757afd26b53f7

 Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x9783ffc1b925929dc07b194161420aab6b80f5d2b8727bec3a6999d4463a121e                  │
│  │ Sender: 0xd8b74d929e698a451423a9f841b7a8551bb48e077683437b95043b0f4f45700f                    │
│  │ Owner: Account Address ( 0xd8b74d929e698a451423a9f841b7a8551bb48e077683437b95043b0f4f45700f ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 946736                                                                               │
│  │ Digest: 3CLCyNVKSJYHCYrSvkeWsP6G9rEsGojepyYM1gJYaF9f                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x6cc1af6531eed095483aba7504641758a6e2f877e50f0249242757afd26b53f7                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 9mPV9j5CsLruB9LXEh7xddgtR9FUUwmYTMpv2TgGysn8                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │










