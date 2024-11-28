# move入门之基础概念
🧑‍💻作者：gracecampo
## 重要性
对于刚入门的开发人员来说，必然需要对sui和move的基本概念有了解，才能更好的理解以及开发应用。

本节将对sui和move中的基础概念进行讲解，希望可以带来一定的帮助。

### package-包
在一个项目中，一个包是包含了move.toml文件，以及source目录的文件夹，move.toml中定义了一个该项目的各项配置信息，source则用于储存项目源码。

![package.png](https://img.learnblockchain.cn/attachments/2024/11/28IZjjKq67388dc324e8c.png)
如图所示： source文件夹是存放源码的目录，move.toml文件是存放项目相关信息及依赖的文件，test文件夹是防止测试文件的目录

在move中一个项目通常被组织为一个包（package）,包将被发布在区块链上，并生成一个地址用于识别，通过将包发布到区块链上，我们可以通过与区块链的交互进行调用。

创建包可以使用：
```shell
sui move  new  你的项目名称
```
一个包可以有多个模块，每个模块可以有单独的作用域，变量，结构体，函数组成。
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
账户 (account) 是识别用户的一种方式。账户由私钥生成，并通过地址来识别。账户可以拥有对象，并且可以发送交易。每个交易都有一个发送者，发送者通过地址来识别。

Sui 支持多种加密算法用于生成账户。支持的曲线有 ed25519、secp256k1。Sui 的加密灵活性使得账户生成具有灵活性和多样性。

我们可以通过第三方钱包进行地址生成，例如sui Wallet

也可以使用sui-cli进行本地生成，命令如下：

```shell
sui client new-address ed25519
```

### transaction 交易
transaction（交易）是区块链系统中一个重要概念，它与现实中的交易不同，在区块链系统中，transaction是与链上交互中，任何改变区块链系统状态的变动都可视为交易。

此类活动可以是转账，调用函数，部署合约，升级合约等操作。

用户通过调用程序中的公开函数与区块链上的智能合约进行交互。这些公开函数定义了可以在交易中执行的操作。交易是由账户发起的，账户发送交易时指定它要操作的对象。

我们可以通过区块浏览器，查看对应的transaction信息

![transaction.png](https://img.learnblockchain.cn/attachments/2024/11/l8HgxLhk67388ddb7c023.png)

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove