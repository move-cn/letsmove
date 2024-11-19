# （七）Move语言基础数据类型

继续学习HOH水分子社区的Move语言开发课程，本次视频讲解的是Move的基础类型。
在Move语言中，数据类型设计强调安全性和一致性，是开发智能合约时必须掌握的基础。本篇笔记总结了视频中的相关内容，包括变量的定义、数字类型及其表示、浮点数和负数的处理、类型转换、布尔类型、以及地址类型等内容。

## 1. 变量的定义与可变性

### 1.1 不可变变量

在Move中，默认情况下定义的变量是不可变的。这意味着一旦你给变量赋值，之后就不能再修改它的值。

```move
public fun example() {
    let x: u8 = 10;
    // x = 20; // 错误：不可变变量无法修改
}
```

### 1.2 可变变量

如果需要创建可变变量，可以使用`mut`关键字。这时变量的值就可以被修改了。

```move
public fun example_mutable() {
    let mut x: u8 = 10;
    x = 20; // 合法：可变变量可以修改
}
```

## 2. 数字类型

Move中的数字类型全部为无符号整数，这里列出了所有的数字类型及其取值范围：

- `u8`：8位无符号整数，范围：0-255。
- `u16`：16位无符号整数，范围：0-65535。
- `u32`：32位无符号整数，范围：0-2^32-1。
- `u64`：64位无符号整数，范围：0-2^64-1。
- `u128`：128位无符号整数，范围：0-2^128-1。
- `u256`：256位无符号整数，范围：0-2^256-1。

### 2.1 字面量表示

Move支持灵活的字面量表示形式，使代码更具可读性：

- 标准表示：`123`表示十进制整数。
- 下划线分割：`1_000_000`，用于提高可读性，相当于`1000000`。
- 十六进制：`0x1A`表示十进制的26。
- 类型后缀：如`8u8`表示`u8`类型，`1000u64`表示`u64`类型。

```move
public fun literals_example() {
    let decimal = 123;
    let readable = 1_000_000;
    let hex = 0x1A;
    let small_num: u8 = 8u8;
    let large_num: u256 = 1_000_000u256;
}
```

### 2.2 类型转换

Move支持类型之间的转换，例如将`u8`转换为`u64`：

```move
public fun conversion_example(x: u8): u64 {
    let y: u46 = x as u64;
    y
}
```

## 3. 浮点数的处理

在Move中，没有浮点数（如`f32`、`f64`），主要是为了确保区块链计算的精度和一致性。我们通常使用分数或定点数来替代浮点数。

### 3.1 使用定点数替代浮点数

以下是用分子和分母实现定点数的示例：

```move
public fun create_from_rational(numerator: u64, denominator: u64): u64 {
    let scaled_numerator = (numerator as u128) << 64;
    let scaled_denominator = (denominator as u128) << 32;
    assert!(scaled_denominator != 0, 1); // 确保分母不为0
    let quotient = scaled_numerator / scaled_denominator;
    quotient as u64
}
```

解释：
- 使用分子和分母来计算定点数，扩大倍数来模拟浮点数精度。
- `u128`扩展避免计算溢出，位移操作模拟小数点。

## 4. 负数的处理

Move中没有有符号整数类型（如`i8`、`i64`），所有整数类型都是无符号整数。因此，如果需要处理负数，可以通过位操作来模拟。

### 4.1 使用位操作模拟有符号整数

对于`u8`（0到255），可以模拟如下：
- `0-127`：视为正数（即0到127）。
- `128-255`：视为负数（即-128到-1）。

```move
module SignHandling {
    /// 模拟将`u8`解释为有符号整数
    public fun to_signed_u8(value: u8): u8 {
        if (value < 128u8) {
            return value;
        } else {
            return 256u8 - value;
        }
    }
}
```

示例：
- 输入`value = 200u8`时，`to_signed_u8`函数会返回`56`，代表`-56`。

## 5. 布尔类型

Move中的布尔类型是`bool`，它包含`true`和`false`两个值，常见的逻辑操作有：
- 与：`&&`
- 或：`||`
- 非：`!`

```move
public fun boolean_example(x: u8, y: u8): bool {
    let result = (x > y) && (x < 100);
    !result
}
```

## 6. 地址类型

在Move中，`address`类型用于表示账户地址，通常用于访问区块链上的账户和模块。

### 6.1 定义与使用

地址类型用16字节的值表示，使用`0x`前缀。例如，`0x1`表示标准库地址。

```move
module AddressExample {
    public fun print_address(addr: address) {
        // 假设存在一个打印函数
        // print!("Address: ", addr);
    }

    public fun check_address(addr: address): bool {
        addr == @0x1
    }
}
```

### 6.2 配置文件中定义地址

Move开发环境允许你在`Move.toml`文件中配置常用地址，例如：

```toml
[addresses]
Std = "0x1"
MyModule = "0x2"
```

在代码中可以直接引用这些配置的地址：

```move
module MyModule::Example {
    use Std::Vector;

    public fun example() {
        let address = @Std;
        // 使用配置文件中的地址
    }
}
```

### 6.3 动态传递地址

函数可以接收`address`类型作为参数，从而支持更灵活的调用：

```move
module Transfer {
    public fun transfer_funds(sender: address, receiver: address, amount: u64) {
        // 实现转账逻辑
        // Balance::withdraw(sender, amount);
        // Balance::deposit(receiver, amount);
    }
}
```

## 总结

本文介绍了Move中的基础数据类型和处理方式，从无符号整数到布尔类型，再到地址类型，涵盖了Move的基本编程构建块。Move语言设计上注重安全性和一致性，通过掌握这些基础类型的使用，能够帮助你编写更高效和安全的智能合约。希望这篇笔记对你理解和使用Move语言有所帮助！


> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)