## 1. 安装 Sui

[https://docs.sui.io/guides/developer/getting-started/sui-install](https://docs.sui.io/guides/developer/getting-started/sui-install)

## 2. 生成钱包

```bash
sui client new-address ed25519/secp256k1/secp256r1
```

或者

~~~bash
 sui client envs
~~~

按照提示完成，设定rpc为 https://fullnode.testnet.sui.io:443

## 3. 领取测试币

终端运行

```bash
sui client faucet
```

通过插件钱包领取 [Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

## 4. 编写合约并发布到测试网

终端中运行以下命令

```bash
sui move new hello_just03211
cd hello_just03211
```

修改`source`目录下`hello_just03211.move`文件，改为以下内容

```rust
/// Module: hello_just03211
module hello_just03211::hello_just03211 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloJust03211 has key{
        id:UID,
        say: String,
        githubId: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello = HelloJust03211 {
            id:object::new(ctx),
            say: string(b"hello just03211"),
            githubId: string(b"just03211")
        };
        transfer(hello, sender(ctx));
    }
}
```

发布到测试网

```bash
sui client publish --gas-budget=10000000
```

发布成功，如下显示

```bash
Transaction Digest: EMZg8JxHKu3PF71TxRzNTJuQV4HWx6ijWvZg6ABgzfFW
...
Published Objects:    
PackageID: 0xa8a6a0e05797b1ac715316ef327df0c3ea2dfe2c2b3e160e75679a4c9d1e8c8b
...
```

可在 [区块浏览器](https://suiscan.xyz/testnet/object/0xa8a6a0e05797b1ac715316ef327df0c3ea2dfe2c2b3e160e75679a4c9d1e8c8b) 进行查询

