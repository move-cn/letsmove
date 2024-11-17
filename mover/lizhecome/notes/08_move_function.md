
# （八）Move语言的函数

今天继续学习HOH水分子社区的视频课程，了解了函数的方方面面。
函数在Move语言中扮演着“执行者”的角色，是处理各种操作和业务逻辑的核心模块。在这篇学习笔记中，我们将深入探讨Move语言的函数（Function）、表达式（Expression）、控制流（Control Flow）以及结构方法（Struct Methods）。让我们一起来揭开Move函数的神秘面纱吧！

## 1. 函数(Function)

在Move中，函数是实现具体功能的基本单元，就像工厂中的一条流水线，接收输入（参数），经过加工（函数体），最终产出结果（返回值）。

函数的基本结构：

```move
public fun function_name(param1: Type1, param2: Type2): ReturnType {
    // 函数体
}
```

- `public`：可选的访问修饰符，表示函数可以被外部模块调用，就像商店里公开销售的商品。
- `function_name`：函数名称，是唯一标识函数的名字。
- `param1`、`param2`：函数的输入参数，类似于工厂流水线上传输的原料，需声明类型。
- `ReturnType`：返回值类型，指定函数的输出结果，可能是数值、布尔值、结构体等。

示例：

```move
module ExampleModule {
    public fun add(x: u64, y: u64): u64 {
        x + y
    }
}
```

在这个例子中，`add` 函数接受两个 `u64` 类型的参数，返回它们的和。它就像一台简单的加法计算器，只需提供两个输入，它就能输出结果。

## 2. 表达式(Expression)

表达式是Move语言中用于执行计算的基本元素，就像数学公式中的每个部分，是程序逻辑中不可或缺的“砖瓦”。

常见的表达式：
- 常量表达式：直接量，例如 `5, true`，表示固定的值。
- 变量引用：例如 `x, my_var`，表示已存储的值。
- 算术运算：例如 `a + b, x - y`，用于执行数学计算。
- 函数调用：例如 `add(1, 2)`，表示调用函数并获取结果。

示例：

```move
public fun example_expression(a: u64, b: u64): u64 {
    let result = a * b + 10;
    result
}
```

在这个示例中，`a * b + 10` 是一个典型的表达式，计算 `a` 和 `b` 的乘积再加上 `10`，类似于“购物总价 + 运费”的计算过程。

## 3. 控制流(Control Flow)

控制流是决定程序执行路径的“交通信号灯”，它让代码有条不紊地执行。Move支持的控制流结构主要有条件判断和循环。

3.1 条件判断（If-Else）

条件判断通过检查布尔表达式来决定执行哪个分支，就像我们决定是否带伞要看今天是否下雨。

```move
public fun check_even(x: u64): bool {
    if (x % 2 == 0) {
        true
    } else {
        false
    }
}
```

在这个例子中，我们检查 `x` 是否为偶数，如果是则返回 `true`，否则返回 `false`。

3.2 循环（Loop, While）

Move语言中的循环类似于“跑步机”，可以重复执行一段代码，直到满足特定条件为止。

Loop 示例：

```move
public fun sum_to_n(n: u64): u64 {
    let mut i = 0;
    let mut sum = 0;
    loop {
        if (i > n) {
            break;
        }
        sum = sum + i;
        i = i + 1;
    }
    sum
}
```

- `loop` 是一种无限循环，通过 `break` 跳出循环。这个例子计算从 `0` 到 `n` 的和，类似于一个自动加法器。

While 示例：

```move
public fun factorial(n: u64): u64 {
    let mut result = 1;
    let mut i = 1;
    while (i <= n) {
        result = result * i;
        i = i + 1;
    }
    result
}
```

- `while` 循环通过条件判断是否继续执行，就像在游戏中，角色的生命值大于零时才能继续战斗。

## 4. 结构方法（Struct Methods）

Move中的结构体（Struct）不仅用于存储数据，还可以“携带”方法，让数据具备自我处理的能力。结构方法（Struct Methods）类似于给机器人安装指令，让它能完成特定任务。

结构方法示例：

```move
module UserModule {
    struct User has key {
        id: u64,
        name: vector<u8>,
    }

    public fun new_user(id: u64, name: vector<u8>): User {
        User { id, name }
    }

    public fun get_id(user: &User): u64 {
        user.id
    }

    public fun update_name(user: &mut User, new_name: vector<u8>) {
        user.name = new_name;
    }
}
```

- `new_user` 是构造函数，用于创建新的 `User` 实例。
- `get_id` 方法用于获取 `User` 的 `id`，类似于读取用户的身份信息。
- `update_name` 方法用于修改 `User` 的 `name`，使用 `&mut` 表示可变引用，允许对实例进行修改。

## 总结

通过这篇学习笔记，我们了解了Move语言中的函数、表达式、控制流和结构方法。Move的设计强调安全性和高效性，提供了独特的机制来确保合约行为的安全和可预测。理解这些基础知识后，我们可以更加自如地编写智能合约，为区块链应用程序的开发打下坚实基础。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)