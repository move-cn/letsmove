## 安装环境
官方提供了好几种方式进行安装，我这里使用二进制文件的方式。
1. 首先[下载二进制文件](https://github.com/MystenLabs/sui)；
2. 将下载的压缩包解压，并将解压之后的目录路径配置到环境变量中；
3. 执行 `sui --version`，确认安装成功。Mac 上首次执行可能会出错，可以在命令行收入：`xattr -d com.apple.quarantine ~/sui/*` 解决。
4. vs code 安装插件：Move 和 Move syntax；
5. 安装浏览器插件钱包，我安装的是 Sui Wallet；

## sui client 常用命令

- `sui client` 连接到 sui 网络，首次执行按提示输入创建钱包
- `sui client envs` 查看当前连接的网络
- `sui client new-env --alias <ALIAS> --rpc <RPC-SERVER-URL>` 添加网络并设置别名
- `sui client switch --env <ALIAS>` 切换网络
- `sui client active-address` 查看当前活跃的地址
- `sui client gas` 查看活跃地址余额以及 gasCoinId
- `sui client balance` 查看活跃地址余额
- `sui client merge-coin --primary-coin <gas coin id> --coin-to-merge <gas coin id> --gas-budget <GAS_BUDGET>` // 合并 gas 余额
- `sui client new-address ed25519 test` 生成新钱包，test 为钱包别名可以省略
- `sui client switch --address <address别明>` 切换当前活跃地址

[更多命令](https://docs.sui.io/references/cli/client)

## 入门 Move

### 1. 创建 package
创建项目 `sui move new package_name`
项目结构：
```
- hello_sui
  |- sources
  |  |- hello_sui.move
  |- tests
  |  |- hello_sui_tests.move
  |- Move.toml // 清单文件，声明元数据信息、依赖、地址等
```
### 2. 编译、测试 package
编译项目：`sui move build` // 在项目的根目录执行
单元测试：`sui move test` // 在项目的根目录执行
### 3. 发布 package
检查字节码是否超过规定值：`sui client verify-bytecode-meter` // 发布之前执行，避免消耗不必要 gas
发布命令：`sui move publish --gas-budget 5000000` // Sui v1.24.1 之后 --gas-budget 5000000 可以省略

### 4. Move 语法
- 强类型语言
- 数据类型包括：
  - 基本数据类型
    - 整型（只支持正整数）：u8, u32, u64, u128, u265
    ```
    // 不同类型正整数比较大小，先用 as 类型转换然后再比较
    public fun compare(): bool {
      let a:u8 = 10;
      let b:u32 = 30;
      (a as u32) >= b
    }
    ```
    - 布尔：值只有 true、false
    - 地址：区块链中的地址，格式一般 0x 开头。
  - 自定义类型（结构体）

#### 变量
*变量作用域只在声明它的代码块中生效*
```
// 定义变量语法：let name = 表达式
let a: u8;
let a = 10; // 直接赋值正整数，变量类型为 u64
let a:u8 = 10;
let a = true;
let a = 0x0;
```

#### 常量
```
// 使用 const 关键字，只能在模块内访问
const TOTAL: u64 = 6;
```

#### 流程控制
```
// 语法：if(布尔表达式) 表达式1 else 表达式2; 注意括号结尾需要分号；
let i = 10;

// 单行不加花括号
if(i > 5) i = i + 1;

// 多行加花括号
if(i > 6) {
  i = i + 1;
};

// if...else
if(i > 3) {
  i = i + 1;
} else {
  i = i -1;
};

```

#### 循环
```
// while 循环
while( i < 3) {
  i = i + 1;
};

// loop 循环
loop {
  if(i >= 8) {
    break; // 满足条件跳出循环
  };
}

// continue： 跳过本次循环，进入下一个循环

```

#### 退出语句
```
// 以下两行代码是等价的
if(i > 5) abort 0;

assert!(i <= 5, 0); // 条件为 true 的时候继续执行，否则抛出错误码 0
```

#### 函数
```
// 定义语法
// fun function_name(arg1: u64, arg2: bool): (u8, bool) {
//   // 函数体
// }

// 返回值： return x 结尾不需要分号！！
fun compare(a: u64, b: u64): u8 {
  if(a == b) {
    return 0 // 直接返回
  };
  // 返回值在最后一时可以省略 return
  if(a > b) {
    1 // 省略 return
  } else {
    2 // 省略 return
  }
}

// 多个返回值
fun call_return_nums(): u64 {
  let (a, b) = return_nums(); // 接收多个函数返回值，必须有括号
  if(b) {
    a
  } else {
    0
  }
}
fun return_nums(): (u64, bool) {
  (19, true)
}
```

#### Debug
```
// 打印变量：std::debug::print($v);
// 打印堆栈：std::debug::print_stack_trace();

// 然后结合单元测试就可以看到打印的信息
fun a_greate_than_b(a: u64, b: u64): bool {
  std::debug::print(&a);
  std::dubug::print(&b);
  a >= b
}
```

#### 结构体

**注意：结构体不能包含自身类型**

命名规则：
  * 结构体名称大写字母开头，包含大小写字母、下划线和数字组成，大驼峰命名法
  * 字段名小写字母、数字和下划线组成

```
use std::string::{String, utf8};

// 声明一个 HelloWorld 类型，包含两个字段
public struct HelloWorld has drop {
  no: u64,
  text: string::String // 字符串类型字段
}

public fun new_hello_world(): HelloWorld {
  // 实例化结构体
  HelloWorld {
    no: 1,
    text: string::utf8(b'hello world')
  }
}

// 定义方法，让外部模块可以访问结构体中定义的字段
// 参数为不可变引用  &
public fun hello_world_text(hw: &HelloWorld): String {
  hw.text
}

// 参数为可变引用 &mut
public fun change_text(hw: &mut HelloWorld) {
  hw.text = utf8(b"change it");
}
```
