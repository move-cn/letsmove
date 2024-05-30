## task1

> 完成第一个合约上链
>
> - 上链网络: 测试网(testnet)
>
> 需求
>
> - 完成Sui钱包安装
> - 完成Sui CLI安装
> - 完成获取测试网络SUI学习
> - 完成Sui浏览器学习
> - 提交`Hello Move`合约发布`package id`



### Sui CLI 安装

#### 本地安装 Sui Binaries

需要先安装rust和cargo

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

如果已经有rust的，请升级到最新版本

```
rustup update stable
```

安装 Sui binaries

```
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

大概需要跑十多分钟

准备超过6G作为缓存，1500+需要compiling

安装完成后

```
sui --version
```

![image-20240411023931715](https://file.shenghuo2.top/typecho/202404110239763.png)



#### 为 VS Code 配置 Sui Move Analyzer 插件  (可选)

命令行输入

```
cargo install --git https://github.com/movebit/move --branch move-analyzer2-release move-analyzer
```



然后从 vscode插件商店搜索 `sui-move-analyzer` 安装

![image-20240411024422400](https://file.shenghuo2.top/typecho/202404110244435.png)

### Sui钱包安装

https://docs.sui.io/guides/developer/getting-started/get-address

有两种钱包，[Sui Wallet Chrome 浏览器扩展程序](https://chrome.google.com/webstore/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil) 和 Sui CLi 从命令行新建

我在接收airdrop的地方填的是从浏览器插件生成的钱包地址，

不过用哪个都可以



```bash
> sui client new-address ed25519
Config file ["/root/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Devnet if not specified) : https://fullnode.testnet.sui.io:443
Environment alias for [https://fullnode.devnet.sui.io/] : 
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
0
Keys saved as Base64 with 33 bytes `flag || privkey` ($BASE64_STR). 
        To see Bech32 format encoding, use `sui keytool export $SUI_ADDRESS` where 
        $SUI_ADDRESS can be found with `sui keytool list`. Or use `sui keytool convert $BASE64_STR`.
Generated new keypair and alias for address with scheme "ed25519" [optimistic-apatite: 0x****************]
Secret Recovery Phrase : [************************]
Keys saved as Base64 with 33 bytes `flag || privkey` ($BASE64_STR). 
        To see Bech32 format encoding, use `sui keytool export $SUI_ADDRESS` where 
        $SUI_ADDRESS can be found with `sui keytool list`. Or use `sui keytool convert $BASE64_STR`.
╭───────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                         │
├────────────────┬──────────────────────────────────────────────────────────────────────┤
│ alias          │ quirky-hematite                                                      │
│ address        │ 0xc4a062c6287c506bd33ae8c50e3376eb202af9bea7b991704c7fd84529eb759b   │
│ keyScheme      │ ed25519                                                              │
│ recoveryPhrase │ xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx │
╰────────────────┴──────────────────────────────────────────────────────────────────────╯
```

### 获取Testnet的代币(领水)

在测试网领的sui是用来支付部署合约用的gasfee的

#### 通过discord领取

https://discord.com/invite/sui

懒得进去领，试了一下还是用curl领了



#### 通过curl 获取

```bash
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "你的 SUI 钱包地址"
    }
}'
```

### 发布hello move合约

#### 创建 hello move 项目

选好你要放的文件夹，我是把项目git pull下来在我的id的文件夹下的code文件夹下新建的

```
../../shenghuo2
├── code
│   ├── hello_move
│   │   ├── Move.toml
│   │   ├── sources
│   │   │   └── hello_move.move
│   │   └── tests
│   │       └── hello_move_tests.move
│   └── readme.md
├── notes
│   └── readme.md
└── readme.md
```

其实位置无所谓

```
sui move new hello_move
```

#### hello_move.move

```move
#[allow(duplicate_alias)]
/// Module: hello_move
module hello_move::hello_move {
  use std::ascii::{String, string};
  use sui::object::{Self, UID};
  use sui::transfer::transfer;
  use sui::tx_context::{TxContext, sender};

  public struct Hello has key {
    id: UID,
    say: String
  }

  fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
      id: object::new(ctx),
      say: string(b"move"),
    };
    transfer(hello_move, sender(ctx));
  }
}
```

语法迭代太快了，官方文档有些也out of date了

弄完之后build测试一下

记得进入你新建的package文件夹里

```
sui move build
```

```
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
```

没有报错就行

#### 发布package

进入你新建的package文件夹里

```
sui client publish --gas-budget 50000000
```



找到packageID提交

```
│ Published Objects:                                                                                    │
│  ┌──                                                                                                  │
│  │ PackageID: 0xe2bb4f7e50a7d0eeb91610273aa274f5880a52e81f6fa46f61e3be07632b8051                      │
```

默认主网之前用错了

应该是填 `https://fullnode.testnet.sui.io:443`

发布之后去浏览器翻了半天，发现发布到devnet了