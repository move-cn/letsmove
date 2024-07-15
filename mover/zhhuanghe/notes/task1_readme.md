## 安装 SUI
[https://docs.sui.io/guides/developer/getting-started/sui-install](https://docs.sui.io/guides/developer/getting-started/sui-install)

安装成功后，终端运行显示出sui版本即安装成功
~~~bash
sui --version
~~~

## 新建项目

~~~bash
sui move new hello_zhhuanghe
~~~

修改 sources 文件夹下 hello_zhhuanghe.move 文件，修改内容如下

~~~rust
module hello_zhhuanghe::hello_zhhuanghe {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"hello zhhuanghe!!!"),
        };
        transfer(hello_move, sender(ctx));
    }
}
~~~

# 获取钱包地址和测试sui

创建新钱包

~~~
sui client new-address ed25519
~~~

显示如下信息

~~~
       $SUI_ADDRESS can be found with `sui keytool list`. Or use `sui keytool convert $BASE64_STR`.
╭───────────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                             │
├────────────────┬──────────────────────────────────────────────────────────────────────────┤
│ alias          │ elated-prase                                                             │
│ address        │ 0xc937efa8ca39f264359c117b2faedec9c31184411e1344d74a0d1268016077cc       │
│ keyScheme      │ ed25519                                                                  │
│ recoveryPhrase │ release dwarf alone raw library plate call hurt place joke umbrella task │
╰────────────────┴──────────────────────────────────────────────────────────────────────────╯
~~~

钱包地址为：0xc937efa8ca39f264359c117b2faedec9c31184411e1344d74a0d1268016077cc  

获取测试sui

~~~bash
sui client faucet
~~~

查看是否有余额

~~~bash
sui client
~~~

# 合约发布

~~~bash
sui client publish 
~~~