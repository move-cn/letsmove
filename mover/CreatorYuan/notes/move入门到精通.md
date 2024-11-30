# MOVE 智能合约编程语言
- 定义资产
- 读，写，删除，转移资产
- 权限检查，访问权限控制

## 变量的定义
- let 变量名称:类型 = 变量值   let a: u32 = 10u32  强类型编程语言，没有隐试转换  
- move 只有6个无符号整数 没有负数和小数 
  - u8         0-255
  - u16        0-65535
  - u32        0-4294967295
  - u64        0 - 2^64-1
  - u128       0 - 2^128-1
  - u256       0 - 2^256-1
- 小数 a/b , 放大整数的倍数表示小数  U8 1-127 表示负数 128-225 表示正数
- 运算符 + - * / % (加 减乘 除 取余)
- as 运算  整数类型转换运算符 只有相同类型才能做运算  
- 布尔  &&  ||  !   (true && true   true|| false = false)
- 地址类型 address 钱包地址 (32字节)  let address1: address = @0x1 


# 编写 Move 包
```shell
$ sui move new hello_world  # 新建
$ touch my_first_package/sources/my_module.move
$ sui move build
$ sui move test
```
# 官方文档
https://docs.sui.io/
https://docs.sui.io/concepts/sui-move-concepts
https://docs.sui.io/guides/developer/getting-started/get-coins

## 发布包
```shell
$ sui client publish --gas-budget 5000000
$ sui client objects
$ sui client ptb \
--assign forge @<FORGE-ID> \
--assign to_address @<TO-ADDRESS> \
--move-call <PACKAGE-ID>::my_module::new_sword forge 3 3 \
--assign sword \
--transfer-objects "[sword]" to_address \
--gas-budget 20000000

https://sui-mainnet-endpoint.blockvision.org
```

## module 定义模块  fun 定义方法

```sui move

module mod::a {  // 模块
  use sui::tx_context::TxContext;
  fun init(ctx: &mut TxContext){
  }
  fun a(){ // fun foo<T1,T2>(x:u64,y:T1,z:T2):(T2,T1,64){(z,y,x)}
  }
  public fun b(){}
  public(package) fun c(){}
  public entry fun d(){}
  public fun f(a:u32, b:u32): bool{}
}

```

## 访问方法权限控制
| 方法签名                       | 调用范围              | 返回值 |
|:---------------------------|:------------------|:----|
| fun call()                 | 只能模块内调用           | 可以有 |
| public fun call()          | 全部合约能调用           | 可以有 |
| public entry fun call()    | 全部合约和Dapp(RPC)能调用 | 无   |
| entry fun call()           | 只能Dapp(RPC)能调用    | 无   |
| public(package) fun call() | 只能当前包使用           | 可以有 |


## init方法
- 只能是私有的
- 会在发布合约时是自动调用一次
- 只有两种形式
  - fun init(ctx: &mut TxContext){}
  - fun init(witness: Struct, ctx: &mut TxContext){}

## mut 关键字
- let mut a:u32 = 32;
- a = 64;
- 变量可以改变
## 下划线开头的变量
- let _a = 10u32;
- 变量不会用到
## print()
- 本地调试代码输出
```sui move
module std::debug{
  native public fun print<T>(x: &T);
  native public fun print_stack_track();
}
```

## 注释
- // 注释
- /* */ 块注释
- /// 文档注释

## if
```sui move

if () true
if () true else ()

let maximum: u64 = if(x>y) x else y;
let z = if(maximum<10) 10u8 else 100u64 

```
## while 
- 重复语句体,直到false
```sui move
fun sum(n: u64): u64{
    let mut sum = 0;
    let mut i = 1;
    while (i<n){
        sum = sum + i;
        i = i + 1;
    };
    sum
}
```
## break
- 退出循环
```sui move
fun min_factor(n: u64): u64{
    let mut i = 2;
    while (i<=n){
        if (n % i == 0) break;
        i = i + 1;
    };
    i
}
```
## continue
- 跳过循环的其余部分,继续进行下次迭代
```sui move
fun sum(n: u64): u64{
    let mut sum = 0;
    let mut i = 0;
    while (i<n){
        i = i + 1;
        fi (i % 20 == 0) continue;
        sum = sum + i;
    };
    sum
}
```
## loop 
- 重复循环体,直到break
- loop{} 等价 while(true)
```sui move
fun sum(n: u64): u64{
    let mut sum = 0;
    let mut i = 0;
    loop {
        i = i + 1;
        fi (i>n) break;
        sum = sum + i;
    };
    sum
}
```

## struct 
- 结构体 : 自定义类型
- 由字段组成 : key-value, 字段名称-存储内存
- 只能在模块内定义, 只能 public struct 开头
```sui move
public struct name{
    file1 : type1,
    file2 : type2,
    ...
}
# 什么时候使用 : u8 - u256 bool 不能完整表达时,把不同数据类型组合成复杂数据结构
module sui::s{
  public struct Person{
    age:u64,
    gender:u8,
    height:u64
  }
}

```

## UTXO
- 账户模本模型
- 适合并行运算

## 对象
- sui存储 : 全局的Map数据结构Map<ID,object>
- key是id (唯一的) , 值是Object

## move Object
- sui上的资产都是对象, 万物都是对象
- sui维护一个全局的map<id,object>的结构,所有的对象都为 全局存储
- 所有的对象都有一个全局唯一ID
- 对象可以 互相嵌套

## 对象的定义
- 必须有 key 的能力
- 必须第一个字段是id,而且类型为 sui::object::UID
```sui move

module book::obj{
  use sui::object::UID;
  public struct Obj has key{
    id: UID,
    red:u8,
    green:u8,
    blue:u8
  }
}

```
## 资产的定义
- 一切皆资产
## 资产所有全
- 独有资产 : 归属于个人
- 共有资产 : 公共拥有

## 代码理解所有权
- 对拥有所有权的对象实例，可以做增删改查
- 如果函数传入一个当前操作人没有所有权的对象实例，会报错

## Object 所有权
- 对象有字段标记所有权
- 独享所有权 : 对象被某个地址拥有
- 共享所有权 : 对象被全局共享

## 所有权在函数之间传递的访问权限 (重点理解)
- fn f(consume:T,write:&mu T,read:&T)
- T: transfer,delete,write,read (传类型的值:权限最大,转移 删除 写 读)
- &mut T:write,read (传可变引用:可读可写)
- &T:read (传不可变引用:只读)

## 所有权的方法
- crates/sui-framework/packages/sui-framework/sources/transfer.move
- E:\sui\crates\sui-framework\packages\sui-framework\sources\transfer.move

| 方法                   | 生成的方法   | 属性          |
|:---------------------|:--------|:------------|
| transfer             | 独享对象    | key         |
| public_transfer      | 独享对象    | key + store |
| freeze_object        | 共享对象-常量 | key         |
| public_freeze_object | 共享对象-常量 | key + store |
| share_object         | 共享对象    | key         |
| public_share_object  | 共享对象    | key + store |

## 四种能力
- copy   可以被复制
- drop   作用域结束后可以被丢弃
- key    可以作为键值对全局状态进行访问
- store  可以被存储到其他结构体

## 只有key
- 对象,自定义转移规则
- 对象有全局ID,可以被全局存储和转移
## 只有store
- 可以被存储到其他结构体
## 只有drop
- 在离开作用域的时候会被自带析构
- 基本数据类型默认实现了drop
## key + store
- 对象, 可以被任意转移,被转移规则限定
- 对象有全局ID,可以被全局存储和查找
## 没有任何能力
- 只能存活当前事务,也就是同一交易
## key 和 drop 互斥
- key 和 drop 不能同时存在
## event
- copy + drop
- 标准的线上日志输出,用于记录日志

## 常量
- const Name:Type = Value
- Type in u8 u16 u32 u64 u138 u256 bool address vector<_>
- const TenName:u32 = 10;
- const OneName:u32 = 0x1;
- const Str:vector<u8> = b'3123123'';
- const AddrMe:address = @0x22;

## 错误处理
- abort 10  终止
- assert!(num>10,ErrMustGet10);  断言

## debug
- 命令行调试代码打印日志
- print
- print_stack_trace

## 泛型传参
```shell
sui client call 
--package $PACKAGE
--module $MODULE
--function "create_box"
--args $OBJECT_ID
--type-args "0x2::coin::Coin<0x2::sui::SUI>"
--gas-budget 100000000

```
## phantom泛型
- 泛型未被使用
- 容器能力规则不满足

## Capablility设计模式
- public struct XxCap has key {id: UID}
- 一种权限的设计模式,
- 需要做什么的时候,必须传入这个结构体的实例来验证你是不是有这个权限
- 这个权限一般来说是一个object有key的能力,可以适当加store的能力

## witness见证者设计模式
- public struct Witness has drop {}
- 这个结构体创建出来是为了创建另一个资源需要的一种权限,
- 创建的同一个实例只能使用一次，
- 这个结构体创建出来需要可以销毁，
- 可以简单理解成权限的特殊模式
- 要点： 结构体没有字段，只有drop能力，实例只能使用一次

## one-time-witness 见证者模式
- public struct OTW has drop{}
- types::is_one_time_witness(&witness)
- 是一个特殊的见证者，
- 作用就是同一个包下面的同一个结构体，只能创建处理一个实例来做证
- 同一个结构体只能用一次，不然报错
- 要点：
  - 模块名大写的结构体，
  - 结构体没有字段，
  - 只有drop能力，
  - 只能传教一个实例来做证

## Transferable Witness 可以转移见证者模式
- public strust WITNESS has store, drop()
- public strust WitnessBox has key {id:UID,witness:WITNESS}
- 这个见证者结构体可以创建了放在一个容器里面，
- 随着容器转移所有权，需要用到的时候在取出来做见证
- 要点：
  - 结构体没有字段
  - 只有drop能力和store
  - 需要一个object的容器来包装

## hot-potato设计模式
- public struct Receipt{ price:u64}
- public fun create(xx:XX,...):(Receipt{},Coin<x>)
- public fun burn(rece:Receipt,...)
- 简单理解就是烫手的山芋，你拿到手里肯定处理不了，你只能还回去
- 关键点：
  - 结构体没有任何能力
  - 提供对外方法创建结构体
  - 提供对外的方法销毁这个结构体


