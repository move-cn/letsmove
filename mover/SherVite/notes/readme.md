笔记：
基本数据类型
运算符
包，模块，方法；
实战脚手架





Let a:u32 = 10u32;

a 变量名称：类型=变量值

Let mut  xxxxxx 加上mut  是可变变量，上面那个变量是不可改变得。

U8 u16 u32 u64 u128 u256
move语言里 只有6个无符号整数，没有小数和负数


小数定义：a/b ，不加括号。例子：C * a  /  b

负数：前端展现和约定方式表示
ex：U8类型得1~127表示负数，128~255表示正数。

不同数据类型一起运算时要注意转换，例如A是u16  B是64U，运算时 A +_ B  把A as u64 +B, 一般小转大。适当加（A as u64）
“as” 运算符，同类型才能做基本运算，as 是证书类型得运算符。MOV语言不支持类型得隐式转换。语法样式为“1u8 as u64 ”  将“1” 从u8 类型转化为 u64  类型。




布尔型：
Bool 是move 对布尔值 true false 是 非 逻辑判断的。


地址类型：
Address 在move 中特殊类型，代表在合约里面表示一个钱包地址字节长度是32字节。
"@" + "数字（16进制）"
“@”具名
[addresses]
Primitive = “0x0”
Hello1=“0xffsdsdskk……sds”

模块，mod  如果mod 定义某个钱包地址 或者授权，方便后期权益改变。不然每个地址挨个更改链接。

包  是同一个合约地址包含的全部代码集合，有很多模块组成。
Module 
Use
Fun init 


Fun  只有模块内可定义使用
Public fun 所有合约范围可以使用
Public （pakage）fun 只有当前包里可以使用 比 public fun 权限小一些

Public entry fun  其他合约都可以调用
Entry fun  命令行可以调用，包以外其他合约不可以调用


我能同时部署这两个testnet  和 devnet 吗？在后续sui package publish 时候，直接切换使用.
是否可以同时部署 Testnet 和 Devnet？ • 
答案：不能直接在同一个 Move.toml 文件中同时部署 Testnet 和 Devnet 的依赖。你需要分别配置和发布，或者使用其他方法管理多个网络的依赖。