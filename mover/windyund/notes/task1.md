## 1. 安装 Sui

Macos: `brew install sui`
Windos: `choco install sui`

## 2. 生成钱包

```bash
sui client new-address ed25519
```

妥善保管自己的助记词/私钥，切莫在网上公开。

## 3. 浏览器钱包插件

[Install Sui Wallet extension](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

初次使用需要设置密码，之后选择导入钱包，选择助记词，将刚才生成的助记词复制进去即可。

## 4. 添加测试网并领取测试币

- 1添加测试网络：
```bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
```
- 2查看当前是否处于测试网络
```bash
sui client envs
```
- 3.切换网络
```bash
sui client switch --env testnet
```
- 4.领取测试币： 
```bash
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "${your address}"
    }
}'
```



## 5. 写一个简单的合约并发布到测试网

终端中运行以下命令

```bash
sui move new helloworld
cd helloworld
```

在`sources`目录下创建`hello.move`文件，别填写以下内容

```rust
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

查看当前地址
```shell
sui client addresses
```
切换地址
```shell
sui client switch --address ${地址}
```

发布到测试网

```bash
sui client publish --gas-budget=10000000
```

发布成功，在终端显示中找到这么几行行：

```bash
Transaction Digest: GtdqZmqBnab5KR9MffnxSgwcXEnfHfRH7erRNnRP6ukL
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                                   │
│ Gas Owner: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x1bb19afd5c88fcab7cb14bef938766cbc96cb04a955d67bc6ce2353836db15aa                                    │
│  │ Version: 838522                                                                                           │
│  │ Digest: HDbkFirXVXcHGN9fo5CX1DcMYduuvu5kjcriV1weRvu4                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    TNr4xceB2V6pAvlVtCRSLtKkhOzjI0F5Ue4VAwxPS3hShW8MdF8uEy7eqBXVtrbLQ7nhgX5GhuJbg1WdmVUvDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GtdqZmqBnab5KR9MffnxSgwcXEnfHfRH7erRNnRP6ukL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 326                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8c63b11d6dbd0ae422120bddec502791569a25fc8f1af043ee4795a1133503ae                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 838523                                                                                │
│  │ Digest: GuEPHHUEdogbr9YziHJpZBVGasq25PNp1jXFTf8oBLFL                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc0eebd839014d04943513751bc71ac2b67187e9d43e426ced4fb4a562eb81ee1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 62dubgs3zfjUKu1SZ53GQbTEmPwwf3yPoNTCkaJN1fLF                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1bb19afd5c88fcab7cb14bef938766cbc96cb04a955d67bc6ce2353836db15aa                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 838523                                                                                │
│  │ Digest: AobyspXYrc6icz8aZsvjZ9Cc3Ym5JYu4TRBWwXLsh7hJ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x1bb19afd5c88fcab7cb14bef938766cbc96cb04a955d67bc6ce2353836db15aa                         │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ Version: 838523                                                                                │
│  │ Digest: AobyspXYrc6icz8aZsvjZ9Cc3Ym5JYu4TRBWwXLsh7hJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7615200                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    A2R94bQEzFnQjiCmXuSCoWXnReiiupcvNzYvMYpXqTro                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8c63b11d6dbd0ae422120bddec502791569a25fc8f1af043ee4795a1133503ae                  │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                    │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 838523                                                                               │
│  │ Digest: GuEPHHUEdogbr9YziHJpZBVGasq25PNp1jXFTf8oBLFL                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x1bb19afd5c88fcab7cb14bef938766cbc96cb04a955d67bc6ce2353836db15aa                  │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                    │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 838523                                                                               │
│  │ Digest: AobyspXYrc6icz8aZsvjZ9Cc3Ym5JYu4TRBWwXLsh7hJ                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xc0eebd839014d04943513751bc71ac2b67187e9d43e426ced4fb4a562eb81ee1                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 62dubgs3zfjUKu1SZ53GQbTEmPwwf3yPoNTCkaJN1fLF                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7637080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
---

结束
