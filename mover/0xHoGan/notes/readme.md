# Task1 Hello Move

## 1.学习资源

* [Bootcamp 01_hello](https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello)
* [任务指南](https://github.com/move-cn/letsmove/tree/main/task)
* [提交作业](https://github.com/move-cn/letsmove)
* [通用工具讲解（Vs Code、Git）](https://github.com/hoh-zone/lets-fullstack)

## 2.Prerequisites（Liunx）

```
sudo apt-get update
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

## 3.Install Sui（Liunx）

1. Go to [Sui](https://github.com/MystenLabs/sui).
2. In the right pane, find the Releases section.
3. Click the release tagged Latest to open the release's page.
4. In the Assets section of the release, select the .tgz compressed file that corresponds to your operating system.
5. Extract all files from the .tgz file into the preferred location on your system.

```
wget .tgz
tar -zxvf  .tgz
```

6. Navigate to the expanded folder. You should have the following extracted files:

| Name | Description |
| ---- |    ----     |
|move-analyzer | Language Server Protocol implementation. |
|sui | Main Sui binary.|
|sui-bridge | Sui native bridge.|
|sui-data-ingestion | Capture Full node data for indexer to store in a database.|
|sui-faucet | Local faucet to mint coins on local network.|
|sui-graphql-rpc | GraphQL service for Sui RPC. |
|sui-node | Run a local node.|
|sui-test-validator | Run test validators on a local network for development.|
|sui-tool | Provides utilities for Sui.|

7. Add the folder containing the extracted files to ~/.bashrc. 

```
export PATH=$PATH:~/sui
```

8. Start a new terminal session or type source ~/.bashrc to load the new PATH value.

```
source ~/.bashrc
```

## 4.Check Sui is Installed

```
Sui -V
```

## 5.Sui Wallet
* [SuiWallet（Chrome）](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

## 6.Sui Explorer
* [Suiscan](https://suiscan.xyz/testnet/home)
* [SuiVision](https://testnet.suivision.xyz/)

## 7.Sui CLI Command
* Get Sui Address

```
sui client addresses
```

tips：The first time you start Sui client without having a client.yaml file, the console displays the following message:

```
Config file ["`<PATH-TO-FILE>`/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
```

* Get Sui Faucet

```
sui client faucet
```

* Request test tokens through cURL

```
curl --location --request POST 'https://faucet.testnet.sui.io/gas' 
--header 'Content-Type: application/json' 
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "`<YOUR SUI ADDRESS>`"
    }
}'
```

* Get Sui Gas

```
sui client gas
```

* Add a Mnemonic Phrase to Sui
```
sui keytool import "INPUT KEY_SCHEME" ed25519
```

## 8.创建项目

```
sui move new hello_move
```

* 将如下代码复制到sources/hello_move.move

```
module hello_move::hello ;

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
```

## 9.发布上链

```
sui client publish
```

* 如遇到访问github网络问题，可修改Move.toml中的dependencies段

```
[dependencies]
Sui = { git = "https://gitee.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
```

# Task2 Move Coin
## 1.学习资源
* [Bootcamp 02_basic](https://github.com/hoh-zone/move-bootcamp/tree/main/02_basic)
* [文档](https://docs.sui.io/standards/coin)

## 2.Move基础数据类型
* 变量的定义
```
let 变量名称: 类型 = 变量值;    # 不可变变量
let mut 变量名称: 类型 = 变量值;  # 可变变量
```

* 数字类型(Number)
  * Move只有6个无符号整数
  * Move没有负数和小数
     * 小数定义： a / b，只要放大整数的倍数
     * 负数定义： 前端展现和约定的方式表示，比如U8类型的1-127表示负数，128-255表示正数 
  * 如果未指定类型，编译器会尝试推断类型，如果无法推断，则假定为U32
  * 有两种常用进制：十进制、以0x为前缀十六进制
  * 运算符： 加+、减-、乘*、除/、%取余数
    * 只有类型相同的才能做基本运算
    * as是Move的整数类型转换运算符，比如1u8 as u64
    * Move不支持类型的隐式转换

| u8  | Unsigned 8-bit | 0 - 255 |
| --- | --- | --- |
| u16 | Unsigned 16-bit | 0 - 65535 |
| u32 | Unsigned 32-bit | 0 - 4294967295 |
| u64 | Unsigned 64-bit | 0 - 2的64次方-1 |
| u128 | Unsigned 128-bit | 0 - 2的128次方-1  |
| u256 | Unsigned 256-bit | 0 - 2的256次方-1 |

* 布尔类型（Bool）
  * 值只有两种：true和false
  * 支持与&&、或||、非！运算  

* 地址类型（Address）
  * 长度为32字节
  * 在表达式中，值需要使用前缀@
  * Move.toml中的[addresses]定义，就可以在代码中引用
```
[addresses]
hello_move = "0x0"
let address1: address = @hello_move
```

* 编译合约
```
sui move build
```

## 3.包、模块、方法
* 包
  * 包是同一个合约地址包含的全部代码的集合，由很多模块组成

* 模块（Module）
  * module hello_move::hello
    * 关键字module表示包
    * hello_move来自Move.toml的[addresses]
    * hello和外面的文件名对应

* 方法（Function）
  * 语法
```
fun <identifier><[type_parameters: constraint],*>([identifier: type],*): <return_type> <acquires [identifier],*> <function_body>
```

  * 方法访问权限控制

| 方法签名  | 调用范围 | 返回值 |
| --- | --- | --- |
| fun call() | 只能在模块内调用 | 可以有 |
| public fun call() | 全部合约能调用 | 可以有 |
| public entry fun call() | 全部合约能调用和Dapp（RPC）调用 | 无 |
| entry fun call() | 只能Dapp（RPC）调用 | 无 |
| public(package) fun call() | 只能当前的模块能调用 | 可以有 |
  * init方法
    * 只能是私有的
    * 会在发布合约时自动调用一次
    * 只有两种形式
```
fun init(ctx: &mut TxContext) {}
fun init(otw: EXAMPLE, ctx: &mut TxContext) {}
```

## 4.第一个Dapp
* NodeJs安装
```
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
sudo apt-get install -y nodejs

# Node.js version
node -v

# npm version
npm -v

sudo npm install -g pnpm
```

* [脚手架](https://sdk.mystenlabs.com/dapp-kit/create-dapp)
  * 创建Dapp项目，会提供两种模板 react-client-dapp（仅有前端） 和 react-e2e-counter（前端和后端）
```
pnpm create @mysten/dapp --template react-e2e-counter
```

* 发布上链
```
cd  my-first-sui-dapp/move/counter
sui client publish
```

* 安装依赖
```
cd  my-first-sui-dapp
pnpm install
```

* 添加合约地址
  * my-first-sui-dapp/src下的constants.ts添加部署的合约地址

* 运行Dapp项目
```
pnpm dev
```

## 5.基础语法
* 注释
```
//  # 注释
/*   */  # 块注释
///  # 文档注释  
```

* if(条件语句)
```
if (condition) true_branch else ()
```

* while（条件循环语句）
  * 满足条件为True，才会执行表达式
```
while ( idx <= 99 ) {
  idx = idx + 1;
  if ( idx % 2 == 0) continue;  # continue 跳出本次循环
  # break  直接跳出循环
}
```

* loop（无限循环语句）
  * 没有条件判断，会一直循环，直到break loop结束。
```
loop {
  i = i + 1
}
```

## 6.Object定义
* Struct（结构体）
  * 结构体是Move中创建自定义类型的唯一方法。
  * 只能在模块内部定义，并且以关键字public struct开头
  * 
```
public struct NAME {
    FIELD1: TYPE1,
    FIELD2: TYPE2,
    ...
}
```

* 数据模型
  * 以太坊和Aptos通过账户（account）余额来追踪区块链状态
  * 比特币和Cardano则使用UTXO来记账

* 对象（Object）
  * 对象在sui上存储，维护了一个全局的Map数据结构: Map<Id, object>
  * 对象定义
    * 必须有key能力
    * 第一个字段必须是ID，而且类型是sui::object::UID
```
public  struct ColorObject has key {
        id: UID,
        red: u8,
        green: u8,
        blue: u8,
}
```

* 资产所有权
  * 分为独有资产和共有资产

* object所有权
  * 独享所有权：对象被某个地址拥有
  * 共享所有权：对象被全局共享
  * 参数传递方式：按值 (T)、可变引用 ( &mut T) 和只读引用 ( &T)
```
fun f(consume: T, write: &mut T, read: &T)
T: transfer, delete, write, read
&mut T: write, read
&T: read
```

* 所有权方法

| 方法  | 生成的方法 | 属性 |
| --- | --- | --- |
| transfer | 独享对象 | key |
| public_transfer | 独享对象 | key + store |
| freeze_object | 共享对象 - 常量 | key |
| public_freeze_object | 共享对象 - 常量| key + store |
| share_object | 共享对象 | key |
| public_share_object | 共享对象 | key + store |

## 7.内置的四种能力
* ability
  * copy - 被修饰的值可以被复制。
  * drop - 被修饰的值在作用域结束时可以被丢弃。
  * key - 被修饰的值可以作为键值对全局状态进行访问。
  * store - 被修饰的值可以被存储到其他结构体。

* 语法
```
public struct Dog has key,store{
    }
```

* 只有key
  * 将结构体定义成对象，对象有全局ID,可以被全局存储和查找
  * 自定义转移规则

* 只有store
  * 可以存储到其他对象里面

* 只有drop
  * 被修饰的值在离开作用域的时候会被自动析构（删除）
  * 基本数据类型默认实现了drop

* key + store
  * 对象有全局ID，可以被全局存储和查找
  * 可以被任意转移，不被转移规则限定

* 没有任何能力
  * 只能存活当前事务，也就是同一个交易

* key和drop互斥
  * key和drop不能同时存在

* copy + drop
  * 标准的线上日志输出，用于记录日志

## 8.常量
* 语法
```
const  Name : Type = Value
Type in    'u8', 'u16', 'u32', 'u64', 'u128', 'u256', 'bool', 'address', 'vector<_>'
```
## 9.debug（命令行调试代码打印日志）
* 语法
  * 需要在方法之前添加 #[test]
```
#[test]
print
print_stack_trace
```
## 10.错误处理（Error）
* 语法
```
// === Errors ===
const ECallerNotHouse: u64 = 0;
const EInsufficientBalance: u64 = 1;

assert!(ctx.sender() == house_data.house(), ECallerNotHouse);
```

## 11.泛型（Generics）
* 泛型是具体类型或其他属性的抽象替代品*。范型使得在编写 Move 代码时提供更强的灵活性，并避免逻辑重复。
  * 泛型的第一个作用就是消除模板代码
  * 泛型的第二个作用就是兼容未来的数据类型
  * 泛型的第三个作用就是做未被使用的泛型的主要类型关联

* 结构体泛型
```
public struct Box<T> {
    value: T
}

public struct Box2<T: store + drop> has key, store {
   id:UID,
   value: T
}
```

* phantom 泛型
  * 泛型未被使用,只是占位
```
public struct Balance<phantom T> has store {
   value: u64
}
```

* enum和match

```
public enum IPVersion {
       IpV4,
       IpV6,
}


match (ip) {
       IPVersion::IpV4 => {},
       IPVersion::IpV6 => {},
}
```

* use 语句和aliases 语句
```
use std::string::String;
use std::string::String as MyString;
public use fun std::string::from_ascii as String.to_string;
```

## 实战发布Coin
* 创建项目
```
sui move new my_coin
```

* 独享源码
```
module my_coin::usd;

use sui::coin::create_currency;
use std::option::{none};
use sui::transfer::{ public_transfer, public_freeze_object};
use sui::url::Url;

public struct USD has drop{}


fun init(usd: USD, ctx: &mut TxContext){
    let no = none<Url>();
    let (treasury, coin_metadata) =
        create_currency(usd, 8,  b"USD",b"USD",b"this is usd",no, ctx);

    public_freeze_object(coin_metadata);

    public_transfer(treasury, ctx.sender());

}
```

* 命令行调用合约模块
```
sui client call --package $PACKAGE --module $MODULE --function "create_box" --args $OBJECT_ID --type-args "0x2::coin::Coin<0x2::sui::SUI>" 
```

# Task3 Move NFT
## 1. 一个简单的NFT
* 创建项目
```
sui move new my_nft
```

* 源码如下
```
module my_nft::my_nft;

use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id:object::new(ctx),
        name:string::utf8(b"0xHogan NFT"),
        image_url:string::utf8(b"https://0xhogan.4everland.store/Logo.jpg"),
    };

    transfer(my_nft, sender(ctx))
}
```

*  发布上链

```
sui client publish
```

* Mint测试
  * [Suiscan](https://suiscan.xyz/testnet/home) 输入合约地址，在[Contracts]段的[Execute]的[Mint]参数处输入图片地址，执行合约

## 2. 官方NFT
* [display](https://docs.sui.io/standards/display)

* 源码
```
module display_nft::display_nft;

use std::string;
use std::string::{utf8, String};

use sui::tx_context::sender;

use sui::package;
use sui::display;

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

public struct DISPLAY_NFT has drop {}

fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
    let keys = vector[
        utf8(b"name"),
        utf8(b"link"),
        utf8(b"image_url"),
        utf8(b"description"),
        utf8(b"project_url"),
        utf8(b"creator"),
    ];

    let values = vector[
        utf8(b"{name}"),
        utf8(b"https://sui-heroes.io/hero/{id}"),
        utf8(b"{image_url}"),
        utf8(b"A true Hero of the Sui ecosystem!"),
        utf8(b"https://sui-heroes.io"),
        utf8(b"Unknown Sui Fan"),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display::update_version(&mut display);

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());

    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"0xHogan display NFT"),
        image_url: string::utf8(b"https://0xhogan.4everland.store/Logo.jpg")
    };

    transfer::public_transfer(nft, sender(ctx));
}

public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let id = object::new(ctx);
    let nft = MyNFT {
        id,
        name,
        image_url,
    };
    transfer::public_transfer(nft, sender(ctx));
}
```
* 切换到主网发布
```
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443
sui client switch --env mainnet
sui client publish
```




# Task4 Move Game

# Task5 Move Swap

# Task6 SDK PTB

# Task7 Move CTF Check In

# Task8 Move CTF POW
