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

添加测试网络：

```bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
```

领取测试币：`curl https://getsui.com/<YOUR_WALLET_ADDRESS>`

> 命令`sui client envs` 查看当前是否处于测试网络

## 5. 写一个简单的合约并发布到测试网

终端中运行以下命令

```bash
sui move new helloworld
cd helloworld
```

在`source`目录下创建`hello.move`文件，别填写以下内容

```rust
module helloworld::hello {

    use sui::event::emit;

    struct Hello has copy,drop {
        hello: vector<u8>,
    }

    fun init(ctx: &mut sui::tx_context::TxContext) {
        emit(Hello {
            hello: b"hello",
        })
    }
}
```

发布到测试网

```bash
sui client publish --gas-budget=50000000
```

发布成功，在终端显示中找到这么几行行：

```bash
Transaction Digest: 9Wn9i9SRa1PQcbLXMRCk53EUFtpyFQvLQvDnrwUi261i
...
...
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x3fa3650a3ababf529fca8a848baec0014a8f4f4185fb24605a4aff19db5131fc
```

这里的`Transaction Digest`是合约发布后的交易哈希值，可以在[explorer](https://testnet.suivision.xyz/txblock/9Wn9i9SRa1PQcbLXMRCk53EUFtpyFQvLQvDnrwUi261i)中查询
这里的`PackageID`是发布到网络中的合约包 ID，可以在[explorer](https://testnet.suivision.xyz/package/0x3fa3650a3ababf529fca8a848baec0014a8f4f4185fb24605a4aff19db5131fc)中查询

---

结束
