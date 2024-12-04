# hello orange1244
## 安装sui

[官方文档](https://docs.sui.io/guides/developer/getting-started/sui-install)

### macOS安装

打开终端termial, 运行

~~~bash
brew install sui
~~~

如果报brew不存在，请先安装，[安装文档](https://brew.sh/)

安装完成后，再终端运行

~~~bash
sui --version
~~~

显示如下类似信息，则安装成功

~~~version
sui 1.22.0
~~~

## 新建钱包

### 命令行创建

三种不同类型地址

~~~bash
sui client new-address ed25519
sui client new-address secp256k1
sui client new-address secp256r1
~~~

显示如下信息，则创建成功

~~~bash
Keys saved as Base64 with 33 bytes `flag || privkey` ($BASE64_STR).
        To see Bech32 format encoding, use `sui keytool export $SUI_ADDRESS` where
        $SUI_ADDRESS can be found with `sui keytool list`. Or use `sui keytool convert $BASE64_STR`.
╭──────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                        │
├────────────────┬─────────────────────────────────────────────────────────────────────┤
│ alias          │ modest-hematite                                                     │
│ address        │ 0x50629c59bf11f9f93ea4b1be7e562faf684868f9ba6183e29b5d561c52e89784  │
│ keyScheme      │ ed25519                                                             │
│ recoveryPhrase │ voyage erode aunt hole act price hole lift breeze voyage cave canal │
╰────────────────┴─────────────────────────────────────────────────────────────────────╯
~~~

### 获取测试token

终端运行

~~~bash
sui client faucet
~~~

### 其他指令

查看当前sui账户

~~~bash
sui client active-address
~~~

切换sui账户

~~~bash
sui client switch --address 'sui address'
~~~

## 创建项目

~~~bash
sui move new hello_orange1244
~~~

修改 hello_orange1244.move 为以下内容

~~~rust
module hello_orange1244::hello_orange1244 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloOrange1244  has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_orange1244 = HelloOrange1244 {
            id:object::new(ctx),
            say: string(b"orange1244"),
        };
        transfer(hello_orange1244, sender(ctx));
    }
}
~~~

发布前先本地build看看有没有报错

~~~bash
sui move test
~~~

没有报错之后进行发布

~~~
 sui client publish 
~~~

有如下信息即发布成功

~~~
...
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x7c8925c5ed5aafa12051c3ba05a240dacee3139f7aab4512006f4a91554d8497                                       │
│  │ Sender: 0x1a7b8d838fbb53ca13f78096b2aa74d519605185fc15cc7a1ae1f33c580c98fb                                         │
│  │ Owner: Account Address ( 0x1a7b8d838fbb53ca13f78096b2aa74d519605185fc15cc7a1ae1f33c580c98fb )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 663299                                                                                                    │
│  │ Digest: 5VHn5qWLKGSzm9JXzWDqisMqzPZWFNM4tScTtEeasuQS                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xd91f9c196e2ec496cfee085f4acdc894995688d73e27ffc27d93aa05ee04f9bb                                       │
│  │ Sender: 0x1a7b8d838fbb53ca13f78096b2aa74d519605185fc15cc7a1ae1f33c580c98fb                                         │
│  │ Owner: Account Address ( 0x1a7b8d838fbb53ca13f78096b2aa74d519605185fc15cc7a1ae1f33c580c98fb )                      │
│  │ ObjectType: 0xfaac13616526a0408e42ae490f4deab643c8844377828cda84fe8c207c89e713::hello_orange1244::HelloOrange1244  │
│  │ Version: 663299                                                                                                    │
│  │ Digest: 3BFArd58Y8N4S73DYBtTQwuHs3pYuEDnoHgENt832rsa                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xc224f03c54f8f3335fb6a7c95786c17803a20f036bf5971071e565ffa4110fd1                                       │
│  │ Sender: 0x1a7b8d838fbb53ca13f78096b2aa74d519605185fc15cc7a1ae1f33c580c98fb                                         │
│  │ Owner: Account Address ( 0x1a7b8d838fbb53ca13f78096b2aa74d519605185fc15cc7a1ae1f33c580c98fb )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 663299                                                                                                    │
│  │ Digest: EYA6VXtc22e5JU6zt3VvGfNj5bdzButZUiz96pwurLtn                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0xfaac13616526a0408e42ae490f4deab643c8844377828cda84fe8c207c89e713                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: D6BtDtwJUcMBtALdqRzLoK4dMXRUyMFahEWe61ztycqS                                                               │
│  │ Modules: hello_orange1244                                                                                          │
│  └──                                                                                                                  │
╰────────────────────────────────────────────────────────────────────────────────────────
...
~~~

如上，新发布的合约package id 为 0xfaac13616526a0408e42ae490f4deab643c8844377828cda84fe8c207c89e713，可在 [SuiScan](https://suiscan.xyz/testnet/object/0xfaac13616526a0408e42ae490f4deab643c8844377828cda84fe8c207c89e713/txs) 进行查询

