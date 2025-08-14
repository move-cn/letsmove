# 安装Sui CLI

**Sui CLI**可以用于编译、部署和测试Move智能合约，但它不仅仅是Move编译器。Sui CLI（命令行界面）是专门为Sui区块链设计的工具，可以管理**Move合约**的编译、发布、交互等操作，并执行其他与Sui节点交互的命令。这套工具是Sui生态系统中的官方CLI工具，提供了一个集成的开发环境。

### Step1 在Github中找到安装包

在sui-cli的[github地址](https://github.com/MystenLabs/sui)中找到对应系统的最新的release版本，后缀为`.tgz`,windows系统自带解压的功能，解压结束后的文件有以下几个exe程序组成
  
| 名称                | 描述                                        |
|---------------------|-------------------------------------------|
| move-analyzer       | 语言服务器协议实现。                        |
| sui                 | Sui 主二进制文件。                          |
| sui-bridge          | Sui 原生桥接。                              |
| sui-data-ingestion  | 捕获全节点数据供索引器存储到数据库中。         |
| sui-faucet          | 在本地网络上铸造代币的本地水龙头。            |
| sui-graphql-rpc     | Sui RPC 的 GraphQL 服务。                   |
| sui-node            | 运行本地节点。                              |
| sui-test-validator  | 在本地网络上运行测试验证器以进行开发。        |
| sui-tool            | 提供 Sui 实用工具。                         |

### Step2 添加sui到环境变量

#### Windows 系统

1. 打开系统环境变量：
	- 右键点击“此电脑”或“计算机”，选择“属性”。
	- 点击“高级系统设置”，然后点击“环境变量”按钮。
2. 在系统变量中添加sui的安装路径
	- 在“环境变量”窗口中，找到**系统变量**部分，选择 `Path` 变量，然后点击“编辑”。
	- 在“编辑环境变量”窗口中，点击“新建”，然后输入 `D:\Program Files\sui-cli`（你的 Sui CLI 文件夹路径）。
	- 确保路径输入正确，点击“确定”保存设置，直到所有窗口关闭。
3. 在命令行中使用`sui --version`,以测试是否正确安装

#### Mac系统

1. 打开配置文件，用文本编辑器打开`nano ~/.bashrc`
2. 在打开的文本编辑器中输入`export PATH="path-to-sui"`（你的 Sui CLI 文件夹路径）
3. 保存并退出使用
	1. 按下 `Ctrl+O` 保存文件，然后按下 `Enter` 确认文件名。
	2. 按下 `Ctrl+X` 退出编辑器。
4. 使配置生效，输入`source ~/.bashrc`
5. 关闭当前终端，打开一个新终端输入`sui --version`查看配置是否生效
# 新建Hello World项目

在需要创立项目的目录下打开cmd命令行，输入`sui move new hello_move`,随后在vscode中打开该项目

在vscode的拓展中下载move syntax，以获得高亮的move代码

在`source`文件夹下的`hello_move.move`文件中复制以下的hello word代码
```move
module hello_move::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"move"),
        };
        transfer(hello_move, sender(ctx));
    }
}
```

这个代码定义了一个简单的模块 `hello_move::hello`，可以用来初始化一个“Hello”对象，并将其转移给当前交易的发送者
* `use std::ascii::{String, string};`等行代码是导入必要的库和模块
* 之后，程序定义了一个名为 `Hello` 的结构体，具有 `key` 特性。这是一个 `Move` 中的自定义对象，表示它可以用作链上资源
* `init`是一个公开函数，用于初始化 `Hello` 结构体对象并将其转移给交易发送者

	* `ctx: &mut TxContext`：`ctx` 是一个可变引用类型的交易上下文，它用于获取创建对象所需的上下文信息
		* **`TxContext` 是一个结构体**，它包含了有关交易的上下文信息
		* **`ctx` 是 `TxContext` 类型的一个变量**，表示当前交易的上下文
		* `&mut`表示一个**可变引用**（mutable reference）,在sui中`&`表示一个 不可变引用
		
	* `let hello_move= Hello{}`的部分创建了一个新的 `Hello` 对象
		* 字段 `id` 通过 `object::new(ctx)` 函数生成
			* `object::new` 表示调用 `object` 模块中的 `new` 函数。`new` 函数接收一个 `TxContext` 参数，根据交易上下文生成一个独特的 ID，确保不同的对象不会拥有相同的 ID。
		* `say` 字段则通过 `string(b"move")` 设置成 "move"。
		
* `transfer` 函数将 `hello_move` 对象转移给交易的发送者，`sender(ctx)` 返回的是交易的发送者地址。

## TxContext是什么

在 Sui 区块链中，`TxContext` 是一个重要的结构体，它包含了与当前交易相关的一些关键数据和操作，可以帮助智能合约安全地创建对象、获取交易发送者地址等。

`TxContext` 可以理解为是**交易的“环境记录”**，用来存储和追踪有关交易的一些重要信息。在一个智能合约（比如 Move 合约）运行时，`TxContext` 就像是一个助手，帮我们处理和保存交易过程中所需要的各种数据和上下文。

`TxContext`通常包括了：

- **谁发起了这笔交易**：  
    交易的发送者是谁（也就是账户地址）？通过 `TxContext`，合约可以获取到发起交易的用户地址，这样合约就可以知道该把资产或信息分配给谁。
    
- **生成独一无二的 ID**：  
    在区块链上，每一个资产或对象都需要一个独特的“身份证”（ID），以保证它是唯一的。`TxContext` 提供了生成这些独特 ID 的工具，以确保即使很多用户同时创建同种类型的资产，它们之间也不会混淆。
    
- **交易的其他信息**：  
    `TxContext` 还会包含一些额外的交易信息，比如交易的时间、交易的标识等。这些信息虽然不是直接操作资产时必须的，但在一些复杂的合约逻辑中可能会有帮助，比如记录操作历史等。

# 部署合约到Sui测试网

1. 先通过`sui client faucet`获取测试的sui代币
2. 使用命令`sui client publish`部署合约
	* 在第一个选项中默认空格则发布到测试网中
	* 第二个选项选择0，使用ed25519密钥对方案
	* 在发布之前可以使用`sui move build` 编译move合约

## 遇到的问题

可能会遇到严重的卡顿，通常是网络问题，这时候可以

1. 设置代理(以下是cmd命令，powshell则用`$env:HTTPS_PROXY = "http://127.0.0.1:7897`)
```cmd
set HTTPS_PROXY=http://127.0.0.1:7897
set HTTP_PROXY=http://127.0.0.1:7897
```
2. 把`Move.toml`中依赖项的下载源换成gitee

我这边使用了以上步骤后还是遇到同样的问题，在文件夹中打开一个新终端执行命令设置代理，并把VPN开至全局模式才成功部署