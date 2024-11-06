# 发布第一个合约到 Sui 链上

## 准备钱包

与Sui 链上交互首先需要钱包, 并领取一些测试 SUI Token 作为交易 gas

### 添加 env

Sui 的 3 个环境:

* mainnet:  主网, 使用真 SUI 进行交互
* testnet: 测试网, 用测试币, 推荐使用
* devnet: 开发网, 用测试币, 经常重置, 导致之前部署的合约会被删掉, 但是特性都是最新的, 用来测试新功能

```
# 添加3个evn
sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443

# 查看
sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
╰─────────┴─────────────────────────────────────┴────────╯
其中 * 代表当前激活的 env, 后续交互都会走 testnet

# 切换到主网
sui client switch --env mainnet
```

上面的更改会写入本地文件 `~/.sui/sui_config/client.yaml`



### 创建钱包

```
sui client new-address ed25519
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                                      │
├────────────────┬───────────────────────────────────────────────────────────────────────────────────┤
│ alias          │ quirky-plasma                                                                     │
│ address        │ 0x790ff8abe90560564a0564bbe522498cfd67f20bba32c4c407db46d09c27a779                │
│ keyScheme      │ ed25519                                                                           │
│ recoveryPhrase │ 12 word 的助记词....    │
╰────────────────┴───────────────────────────────────────────────────────────────────────────────────╯

# 查看本地所有钱包
sui client addresses
╭────────────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias                  │ address                                                            │ active address │
├────────────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ inspiring-emerald      │ 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129551d2 │                │
│ fervent-garnet         │ 0x527758edf86e7e2b845b1c79c7e402e89015cb7bae3e6fe74bb9957760a3d333 │ *              │

其中 * 代表当前激活的钱包, 后续交互都会用这个钱包, 比如: 领水, 发布合约

# 切换钱包
sui client switch --address 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129551d2

切换完之后, 再查看就会有 *
```

#### 查看本地钱包私钥

```
cat ~/.sui/sui_config/sui.keystore
结果的顺序和 sui keytool list 的结果顺序是一样的, 方便做地址和私钥的对应
```

#### 本地钱包导入到网页钱包

```
~/.sui/sui_config/sui.keystore 中的的私钥是 base64 需要转 hex
sui keytool convert xxxxxxxx
```

#### 网页钱包导入到本地钱包

从 Sui Wallet 中导出私钥后在本地执行

```
sui keytool import <private_key> ed25519
```



### 领水

**方式1: 给当前激活的钱包领水

```
sui client faucet
```

**方式2: 给任意钱包领水**

可以指定不同 env 的 url 来给不同 env 下的钱包领水, 注意: 不能无限领, 有频率限制

```
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x527758edf86e7e2b845b1c79c7e402e89015cb7bae3e6fe74bb9957760a3d333"
    }
}'
```

### 查看余额

```
# 直接查看余额总数
sui client balance

# 查看每个 SUI Object, 可以得到每个 SUI 的 ObjectId, 可能记录会很多
sui client gas
```



## 浏览器

查看账户余额, 对象属性, 交易详情

搜索框中可以搜索所有对象的 ObjectID, 如: 钱包地址, 对象 ID, 交易 hash

比如: 

查看钱包 https://testnet.suivision.xyz/account/0x527758edf86e7e2b845b1c79c7e402e89015cb7bae3e6fe74bb9957760a3d260



## 开发合约

```
# 创建项目
sui move new task1

# 编辑  task1.move
module task1::hello;
use std::ascii::{String, string};

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello = Hello {
        id: object::new(ctx),
        say: string(b"dgu0323")
    };

    transfer::transfer(hello, ctx.sender());
}



# 构建
sui move build
```



## 发布合约

```
sui client publish

Transaction Digest: HL9Ud8GJxEnPeEqosZwKbPtG7n3n7mpa2TuGrBWvErYs
.... 省略
```



## 查看链上发布详情

https://testnet.suivision.xyz/txblock/HL9Ud8GJxEnPeEqosZwKbPtG7n3n7mpa2TuGrBWvErYs

从中可以看到如下信息:

* tx 发生在什么时候
* 是谁触发的
* change了哪些内容, 其中包括 publish 这个合约

