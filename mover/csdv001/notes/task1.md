
## 1. 安装 Sui

[https://docs.sui.io/guides/developer/getting-started/sui-install](https://docs.sui.io/guides/developer/getting-started/sui-install)

## 2. 本地钱包地址创建

```bash
sui client new-address ed25519
```

添加测试网节点

~~~bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
~~~

切换当前运行节点为testnet

~~~bash
sui client switch --env testnet
~~~

## 3. 领取测试币

```bash
sui client faucet
```

插件钱包领取 [Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)、[Ethos Wallet](https://chromewebstore.google.com/detail/ethos-sui-wallet/mcbigmjiafegjnnogedioegffbooigli)

## 4. 编写合约并发布到测试网

创建项目

```bash
sui move new hello_csdv001
```

修改`hello_csdv001.move`

```rust
/// Module: hello_csdv001
module hello_csdv001::hello_csdv001 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloObject  has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello = HelloObject {
            id:object::new(ctx),
            say: string(b"hello csdv001!"),
        };
        transfer(hello, sender(ctx));
    }
}
```

发布到测试网

```bash
sui client publish --gas-budget=10000000
```

发布成功，在终端中可以找到 Published Objects PackageID

