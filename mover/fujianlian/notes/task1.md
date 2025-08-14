## 1. 安装 Sui

Macos: `brew install sui`

或者参考 [官方文档](https://docs.sui.io/guides/developer/getting-started/sui-install)

## 2. 生成钱包

```bash
sui client new-address ed25519
```

 可以将助记词导入到插件钱包，常用插件钱包

[Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil), [Ethos Sui Wallet](https://chromewebstore.google.com/detail/ethos-sui-wallet/mcbigmjiafegjnnogedioegffbooigli), [Suiet](https://chromewebstore.google.com/detail/suiet-sui-wallet/khpkpbbcccdmmclmpigdgddabeilkdpd)

如果创建了多个地址，可以切换到需要触发交易的地址 

~~~bash
sui client switch --address 0x2b4af6cdced652bd9617853ae11a5d39f409ce27e8d262ce48f25162a66acdfb
~~~

查看当前的钱包地址

~~~bash
sui client active-address
~~~

## 3. 添加测试网并领取测试币

添加测试网络：

```bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
```

领取测试币：

~~~bash
sui client faucet
~~~

或者从插件钱包直接领取

## 4. 写一个简单的合约并发布到测试网

终端中运行以下命令

```bash
sui move new hello_world
cd hello_world
```

在`sources`目录下创建`hello.move`文件，填写以下内容

```rust
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloObject has key, store {
        id: UID,
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

在本地做代码测试

```bash
sui move test --skip-fetch-latest-git-deps
```

发布测试网

```bash
sui client publish --gas-budget 10000000 --skip-fetch-latest-git-deps
```

发布成功，在终端显示中找到这么几行行：

```bash
Transaction Digest: 96wZUecXGv7ZLskFZVMKxuPYfiprJQ8XugRXLixuVMes
...
...
Published Objects:                                                PackageID:0x8d0223a417e58856180ae39c01493b4c1bae06dcb494f6be82047c3e9889ca94  
...
 
```

PackageID可直接在 [suiscan](https://suiscan.xyz/testnet/) 上查询
