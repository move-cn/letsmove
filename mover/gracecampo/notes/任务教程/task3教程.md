# MOVE共学营TASK3教程

🧑‍💻作者：gracecampo

## MOVE共学营中的TASK3教程

### 完成NFT的上链部署

- 上链网络: 主网(mainnet)

## 需求

- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
- NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- 提交mint到自己地址的浏览器查看(Scan)截图

### 1. 代码部分
**在开发之前，我们应了解NFT作为链上资产，它究竟是什么？他的独特性在哪里？NFT在Sui上有什么优势？**

> NFT释义:
NFT 是“非同质化代币”（Non-Fungible Token）的缩写。它是一种数字资产，每个 NFT 都是独一无二的，无法互换。
NFT 通常用于表示艺术品、音乐、视频、游戏物品等数字内容的所有权或认证。
在 Sui 区块链上，NFT 是对象，每个对象都有唯一的 ID，这使得它们天然地具有非同质化的特性。
Sui 的 NFT 可以直接在链上存储和管理，提供了比传统区块链更高的灵活性和可编程性。

#### 接下来我们步入开发环节：
首先作为一个NFT资产，我们定义NFT时，需要赋予这个结构体key和store，key能力使得这个结构体可以在链上作为唯一对象索引，

store使得这个对象可以进行全局传输和传递。

接下来，我们创建一个GRACECAMPO_NFT的结构体体，它拥有key和store能力，并且拥有4个属性，分别是： id 作为链上索引地址，name作为NFT结构体名称，

description作为一个NFT描述,url是NFT对象的外部图像链接地址。
> 定义NFT结构体
```sui move
    public struct GRACECAMPO_NFT has store, key {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }
```

监听事件：通过监听事件，我们可以对链上事件进行分析，例如跟踪 NFT 的铸造次数或智能合约生成的交易金额。这对于分析和统计非常有用。

例如向下的例子，当我们在铸造函数中添加这个事件的时候，我们在应用程序中就可以订阅这个事件，方便我们对铸造人数进行分析，也可用于在铸造完成后，对用户

进行通知。当然这个任务我们将不会对这个事件进行采集和统计，只是作为一个代码规范进行引入。

>定义铸造监听事件
```sui move
    public struct GRACECAMPO_NFT_Minted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }
```
接下来，我们将声明一个铸造函数，可以看到mint_to_sender函数中，我们传入了用户初始化NFT对象的信息，比如name、description、url以及上下文ctx信息，这个函数作为公开函数，可以使任何人调用，当我们调用这个函数时，我们将从上线问中获取调用者信息，将传入的参数信息用于进行NFT对象的初始化，同时我们在代码中注册上面的监听事件。
当用户调用mint_to_sender,将为用户铸造一个GRACECAMPO_NFT的NFT,以及发送铸造事件，当订阅这个事件的应用，接收到事件，将通知用户（这一步我们将不做实践，感兴趣的朋友可以手动实践下）

transfer::public_transfer 是 Sui 网络中的一个函数，用于将对象的所有权从一个地址转移到另一个地址。这个函数允许对象在其定义模块之外进行转移， 但前提是对象具有 store 和 key 能力。

```sui move
public fun public_transfer<T: store, key>(obj: T, recipient: address)
```

>定义铸造函数
```sui move
public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = GRACECAMPO_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(GRACECAMPO_NFT_Minted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }
```
接下来，我们声明一个转移函数，用于用户对NFT的转移，此函数，我们可以看到，需要传入的参数依次为：nft(用户拥有的nft对象)，address(接收人地址)，此函数未用到上下文对象，此处我们以 _ 形式进行忽略。我们在此函数中调用transfer::public_transfer进行对象转移。

>定义转移函数
```sui move
    public entry fun transfer(
        nft: GRACECAMPO_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
```

接下来我们在命令行执行部署以及函数调用（当然，上面的函数，我们都声明entry，也可以进行浏览器调用）

### 模块发布及函数调用

#### 1. 模块部署

发布前，可以先在测试网进行调试，无问题后，将环境切换到主网环境（这一点需要注意，测试完成后，因任务要求，必须在主网部署）

```sui move
sui client publish 
```

发布之后，控制台将显示我们部署模块的PACKAGEID，记录下来。

之后我们将频繁使用到（下文中的PACKAGEID，在运行时，请替换为发布后记录的PACKAGEID）

#### 2. 铸造NFT

调用铸造函数： 此命令，需要替换PACKAGEID，GRACECAMPO_NFT替换为你定义的NFT对象名，mint_to_sender替换为你的铸造函数名

args  后跟你铸造的NFT名称 NFT描述 NFT图片地址，任务要求NFT图片地址必须是自己 github 的头像作为图片，故你需要替换为你的github 的头像URL

```shell
sui client call --package PACKAGEID --module GRACECAMPO_NFT --function mint_to_sender args NFT名称 NFT描述 NFT图片地址
```

调用成功后，需要记录NFT的OBJECTID,方便区块浏览器查看

### 3. 转移NFT
调用转移函数：

此命令，需要替换 PACKAGEID 为发布记录的 PACKAGEID

GRACECAMPO_NFT  替换为你定义的NFT对象名

transfer 替换为你的转移函数名

args  后跟上面铸造函数调用后生成的OBJECTID

recipient-address 替换为0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

>转移NFT
```shell
sui client call --package PACKAGEID --module GRACECAMPO_NFT --function transfer args NFT-OBJECTID recipient-address
```

调用成功后，需要记录交易hash,方便区块浏览器查看

合约中的铸造和转移函数声明为entry,如果不熟悉命令行调用也可支持在区块浏览器调用

### 4. 查看交易信息
查看NFT信息：(注意合约发布环境)
>测试网
>> https://suiscan.xyz/testnet/object/NFT-OBJECTID
>
>> https://suiscan.xyz/testnet/tx/transfer-hash
>
>主网
>> https://suiscan.xyz/mainnet/object/NFT-OBJECTID
>
>> https://suiscan.xyz/mainnet/tx/transfer-hash



任务教程结束，如果有疑问，可以评论留言。

如有问题，欢迎指正，一起进步，谢谢。:smile:  :smile: :smile:

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove