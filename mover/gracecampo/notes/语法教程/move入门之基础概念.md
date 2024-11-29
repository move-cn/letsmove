# move入门之基础概念
🧑‍💻作者：gracecampo
## 重要性
对于刚入门的开发人员来说，必然需要对sui和move的基本概念有了解，才能更好的理解以及开发应用。

基础概念犹如构建应用大厦的基石，只有对其有清晰且准确的认知，才能够更好地去理解整个开发框架的逻辑和架构，从而顺利地进行应用的开发工作。

本节将对sui和move中的基础概念进行讲解，希望可以带来一定的帮助。

### package-包
在一个项目中，一个包通常表现为一个包含特定结构和文件的文件夹。这个文件夹里，最关键的两个组成部分便是 move.toml 文件以及 source 目录。

move.toml 文件起着至关重要的作用，它详细定义了该项目的各项重要配置信息，

比如项目的名称、版本、依赖项等关键元素，这些配置信息就如同项目的“大脑”，掌控着项目的基本属性和运行规则。

而 source 目录则是专门用于储存项目源码的地方，这里存放着构成项目的核心代码文件，它们按照特定的组织结构和命名规则进行排列，是项目功能实现和逻辑构建的基础。

![package.png](https://img.learnblockchain.cn/attachments/2024/11/28IZjjKq67388dc324e8c.png)

如图所示： source文件夹是存放源码的目录，move.toml文件是存放项目相关信息及依赖的文件，test文件夹是放置测试文件的目录

move.toml 文件则是一个关键的配置文件，它不仅存放着项目的相关信息，如项目的名称、版本、作者等基本信息，
还详细列出了项目所依赖的库、框架以及其他重要的配置项。
通过这个文件，可以方便地了解项目的整体情况以及其所依赖的外部资源，为项目的构建和部署提供了重要的依据。
而 test 文件夹则是专门用于存放测试文件的目录，在这里，包含了针对项目各个模块和功能的测试代码。

创建包可以使用：
```shell
sui move  new  你的项目名称
```
在move编程，一个包（Package）通常被设计为一个包含多个模块（Module）的集合，这些模块共同协作以实现特定的功能或提供一组相关的服务。
每个模块都是一个独立的代码单元，它拥有自己的作用域（Scope），这意味着模块内部定义的变量（Variables）、结构体（Structures）、函数（Functions）
等标识符仅在该模块内部可见，除非它们被显式地导出以供其他模块使用。
```sui move
//clidemo是包名，mycoin为模块名
module packagedemo::demo {
    //定义一个结构体
    public struct DEMO has drop {}

    //定义函数
    public fun fun1(){
        //定义变量
        let A:u8 = 13;
    }
    //定义函数
    public fun fun2(){
        //定义变量
        let B:u8 = 13;
    }
}
```
发布包：
```shell
sui move publish
```
发布后的包将会在链上生成不可变更的唯一地址，其中包含了该包下的模块源码，我们可以通过使用链上交互工具（例如钱包）进行交互。

### Manifest-包清单
Move.toml 是描述 包 及其依赖关系的清单文件，采用 TOML 格式，包含多个部分，其中最重要的是 [package]、[dependencies] 和 [addresses]。

下图是一个基础的包清单配置
```toml
[package]
name = "packagedemo"
edition = "2024.beta" # edition = "legacy" to use legacy (pre-2024) Move
# license = ""           # e.g., "MIT", "GPL", "Apache 2.0"
# authors = ["..."]      # e.g., ["Joe Smith (joesmith@noemail.com)", "John Snow (johnsnow@noemail.com)"]

[dependencies]
Sui = { git = "https://gitee.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }

# For remote import, use the `{ git = "...", subdir = "...", rev = "..." }`.
# Revision can be a branch, a tag, and a commit hash.
# MyRemotePackage = { git = "https://some.remote/host.git", subdir = "remote/path", rev = "main" }

# For local dependencies use `local = path`. Path is relative to the package root
# Local = { local = "../path/to" }

# To resolve a version conflict and force a specific version for dependency
# override use `override = true`
# Override = { local = "../conflicting/version", override = true }

[addresses]
packagedemo = "0x0"

# Named addresses will be accessible in Move as `@name`. They're also exported:
# for example, `std = "0x1"` is exported by the Standard Library.
# alice = "0xA11CE"

[dev-dependencies]
# The dev-dependencies section allows overriding dependencies for `--test` and
# `--dev` modes. You can introduce test-only dependencies here.
# Local = { local = "../path/to/dev-build" }

[dev-addresses]
# The dev-addresses section allows overwriting named addresses for the `--test`
# and `--dev` modes.
# alice = "0xB0B"
```
[package] 部分用于描述包。该部分的字段不会被发布到链上，但会用于工具和版本管理；它还指定了编译器使用的 Move 版本。

[dependencies] 部分用于指定项目的依赖关系。每个依赖关系都以键值对的形式指定，键是依赖的名称，值是依赖的规范。依赖规范可以是 git 仓库的 URL 或本地目录的路径。

[dev-dependencies] 部分，用于在开发和测试模式下覆盖依赖关系。

[addresses] 部分用于为地址添加别名。

[dev-addresses] 部分与 [addresses] 类似，但仅在测试和开发模式下有效。


### address 地址
地址是区块链上位置的唯一标识符。它用于标识包 (package)、账户 (account)和对象 (object)。地址的固定大小为32字节，通常表示为以 0x 开头的十六进制字符串。地址不区分大小写。

sui预留了一部分地址，用于底层依赖包，例如以下几个：

0x1 - Sui 标准库的地址（别名 std）

0x2 - Sui 框架的地址（别名 sui）

0x6 - 系统 Clock 对象的地址

### account 账户
在 Sui 中，账户是用于标识用户的方式。账户是从私钥生成的，并由地址标识。账户可以拥有对象并发送交易。每笔交易都有一个发送者，该发送者由地址标识。

Sui 支持多种加密算法用于账户生成，支持的曲线包括 `ed25519` 和 `secp256k`

Sui 的加密灵活性使得账户生成具有灵活性和多样性。

我们可以通过第三方钱包进行地址生成，例如sui Wallet

也可以使用sui-cli进行本地生成，命令如下：

```shell
sui client new-address ed25519
```

### transaction 交易
在区块链技术中，transaction（交易）作为一个核心概念，其含义与我们在现实生活中所理解的金融交易有着显著的区别。
在传统金融体系中，交易通常指的是货币或者资产的转移过程。然而，在区块链这个去中心化的分布式账本系统中，transaction的定义更为广泛。
它涵盖了所有能够引起区块链状态变化的交互行为。这不仅仅包括货币转账，还包括智能合约的执行、数据的存储和更新等多种操作。
每一次transaction都是一次对区块链状态的修改，这些修改通过复杂的加密算法和共识机制得到验证和保护，确保了区块链的安全性和不可篡改性。

在区块链技术中，用户与智能合约的交互是通过调用程序中的公开函数来实现的。这些公开函数，也被称为合约接口，定义了一系列可以在区块链交易中执行的操作。
它们为用户提供了一种标准化的方法来与部署在区块链上的智能合约进行通信。公开函数通常包括读取合约状态的方法和修改合约状态的方法。

智能合约的执行是在区块链网络中的节点上进行的，这些节点验证交易的有效性，并执行合约代码。
一旦交易被验证并打包进区块，它就会被永久记录在区块链上，从而确保了数据的不可篡改性和透明性。

我们可以通过区块浏览器[https://suivision.xyz]，
查看对应的transaction信息
[例子](https://testnet.suivision.xyz/account/0x5a684e30c7760309906a4ed7b25e2d0c4bbeff74a3995a8ccbfe49be084d16d0?tab=Transaction+Blocks)

![transaction.png](https://img.learnblockchain.cn/attachments/2024/11/SNgeEXA96744776f383ff.png)

点击交易hash,产看详细信息
[例子](https://testnet.suivision.xyz/txblock/6135DNCa5yZePiAfMivEjvP468JL2p8zwwZJvU3u8jBh)
![transaction-info.png](https://img.learnblockchain.cn/attachments/2024/11/JzBK5VNi6744777b81fd1.png)
与合约函数交互
[例子](https://testnet.suivision.xyz/package/0xdc403174526c98571365c8787b280e17519d5429a670554b600b00164762210d?tab=Code)
![fuction.png](https://img.learnblockchain.cn/attachments/2024/11/AQAfUYmf6744778c392a3.png)
总结
通过学习 SUI 和 MOVE 的基础概念， 了解到包的结构、清单的配置、地址与账户的独特意义以及交易的丰富内涵。
区块链技术发展迅猛，SUI 和 MOVE 有望在更多领域发挥关键作用。
期待能有更多创新的实践和应用出现，推动区块链技术更好地服务于社会， 同时也希望自己能在这一领域不断成长，为行业的发展贡献一份力量。

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove