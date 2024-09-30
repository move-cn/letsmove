## 1. 安装 Sui

[https://docs.sui.io/guides/developer/getting-started/sui-install](https://docs.sui.io/guides/developer/getting-started/sui-install)

## 2. 生成钱包

```bash
sui client new-address ed25519
```

或者

~~~bash
 sui client envs
~~~

按照提示完成，设定rpc为 https://fullnode.testnet.sui.io:443，选ed25519类型

获取该私钥，进入到主目录 **.sui/sui_config/sui.keystore**，然后运行命令行，即可得到私钥

~~~
sui keytool convert APMUJYDi+cWHsnae4L6uB9Y3KuLTCxmo6tXbcoxtDICb（替换为自己的）
~~~



## 3. 领取测试币

添加测试网络：

```bash
sui client faucet
```

或者通过插件钱包领取 [Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

## 4. 编写合约并发布到测试网

终端中运行以下命令

```bash
sui move new helloworld
cd helloworld
```

在`source`目录下创建`hello.move`文件，别填写以下内容

```rust
module hello_world::hello {

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
            text: string::utf8(b"hello world!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
```

发布到测试网

```bash
sui client publish --gas-budget=10000000
```

发布成功，在终端显示中找到这么几行行：

```bash
Transaction Digest: 9Wn9i9SRa1PQcbLXMRCk53EUFtpyFQvLQvDnrwUi261i
...
...
Published Objects:    
...
PackageID: 0x90362f54ae0b543b0b48dc16b4922431f3745e45c351f6013570145c41256522
```

可在 [suiscan](https://suiscan.xyz/testnet/object/0x90362f54ae0b543b0b48dc16b4922431f3745e45c351f6013570145c41256522) 进行查询

