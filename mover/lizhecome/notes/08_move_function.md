# （八）Move语言的函数

今天继续学习 HOH 水分子社区的视频课程，深入探索了 Move 语言中的函数设计、表达式、控制流和结构方法。函数在 Move 中是实现逻辑的核心，就像一台机器，灵活地加工输入并产出结果。在这篇笔记中，我们将全面学习这些概念，并结合高级用法及实际场景，为智能合约开发奠定坚实的基础。

## 1. 函数(Function)

### 1.1 基础语法与结构

函数是 Move 的基本操作单元，完成输入到输出的映射。其基本结构如下：

```move
public fun function_name(param1: Type1, param2: Type2): ReturnType {
    // 函数体
}
```

- `public`：访问修饰符，决定函数是否可被外部调用。
- 参数：每个参数都需要显式声明类型，Move 不支持隐式类型推导。
- 返回值类型：可以是基本类型、结构体、甚至是一个元组。

示例：

```move
module ExampleModule {
    public fun multiply(x: u64, y: u64): u64 {
        x * y
    }
}
```

此函数接收两个 `u64` 类型参数，返回它们的乘积。这个简单的乘法函数可以用在支付计算或奖励分发中。

### 1.2 高级用法

#### 1.2.1 泛型函数

Move 支持泛型函数，允许函数处理多种数据类型。通过使用类型参数，可以让函数更具灵活性。

```move
public fun swap<T>(a: &mut T, b: &mut T) {
    let temp = *a;
    *a = *b;
    *b = temp;
}
```

- 类型参数 `T` 允许此函数交换任意类型的值，而不仅限于特定类型。

#### 1.2.2 默认参数

Move 不直接支持默认参数，但可以通过函数重载实现类似效果：

```move
public fun greet_with_name(name: vector<u8>): vector<u8> {
    b"Hello, ".concat(&name)
}

public fun greet(): vector<u8> {
    greet_with_name(b"Guest")
}
```

`greet` 方法是简化版本，默认参数为 “Guest”。


## 2. 表达式(Expression)

表达式是代码逻辑的核心，Move 支持多种表达式形式，结合优雅的设计规则，既简洁又安全。

### 2.1 常见表达式类型

1. 常量表达式：直接值，例如 `true, 100, b"abc"`。
2. 变量引用：如 `x`。
3. 函数调用：如 `add(1, 2)`。
4. 算术运算：如 `a + b, x / y`。

### 2.2 示例：条件运算嵌套表达式

```move
public fun calculate_tax(income: u64): u64 {
    if (income > 50_000) {
        income * 20 / 100
    } else {
        income * 10 / 100
    }
}
```

### 2.3 高级用法：模式匹配与元组

```move
public fun divide_and_remainder(a: u64, b: u64): (u64, u64) {
    (a / b, a % b)
}

public fun example_usage() {
    let (quotient, remainder) = divide_and_remainder(10, 3);
}
```

## 3. 控制流(Control Flow)

控制流是程序逻辑的核心。Move 支持条件分支和循环，以实现复杂流程。

### 3.1 条件分支

```move
public fun classify(x: u64): vector<u8> {
    if (x > 100) {
        b"High"
    } else if (x > 50) {
        b"Medium"
    } else {
        b"Low"
    }
}
```

### 3.2 使用 match

`match` 是 Move 中类似模式匹配的高级控制流工具，比 `if-else` 更优雅且扩展性更强，尤其适合处理枚举类型。

#### 3.2.1 基本用法

```move
match expression {
    pattern1 => action1,
    pattern2 => action2,
    _ => default_action,
}
```

- `expression`：匹配的值，可以是变量或表达式。
- `pattern`：匹配条件。
- `action`：匹配成功后执行的代码块。
- `_`：通配符，匹配所有未覆盖的情况。

#### 3.2.2 示例：枚举匹配

```move
module OrderModule {
    enum OrderStatus {
        Pending,
        Processing,
        Shipped,
        Completed,
    }

    public fun get_order_status_message(status: OrderStatus): vector<u8> {
        match status {
            OrderStatus::Pending => b"Your order is pending.",
            OrderStatus::Processing => b"Your order is being processed.",
            OrderStatus::Shipped => b"Your order has been shipped.",
            OrderStatus::Completed => b"Your order is completed.",
            _ => b"Unknown status.",
        }
    }
}
```

#### 3.2.3 高级用法：多层次模式匹配

```move
module NestedMatchExample {
    struct Result {
        value: u64,
        error: bool,
    }

    public fun handle_result(result: Result): vector<u8> {
        match result {
            Result { value, error: false } if value > 100 => b"Large value and no error.",
            Result { value, error: false } => b"Value is okay and no error.",
            Result { value: _, error: true } => b"An error occurred.",
            _ => b"Unexpected state.",
        }
    }
}
```

### 3.3 循环

#### 3.3.1 loop 示例

```move
public fun fibonacci(n: u64): u64 {
    let mut a = 0;
    let mut b = 1;
    let mut i = 0;
    loop {
        if (i >= n) {
            break;
        }
        let temp = a + b;
        a = b;
        b = temp;
        i = i + 1;
    }
    a
}
```

#### 3.3.2 递归模拟循环

```move
public fun sum_recursive(n: u64): u64 {
    if (n == 0) {
        0
    } else {
        n + sum_recursive(n - 1)
    }
}
```

## 4. 结构方法（Struct Methods）

### 4.1 方法链式调用

通过在方法中返回 `&mut Self` 或新的实例，支持链式调用。

```move
module BankModule {
    struct Account has key {
        balance: u64,
    }

    public fun new_account(initial_balance: u64): Account {
        Account { balance: initial_balance }
    }

    public fun deposit(&mut self, amount: u64): &mut Self {
        self.balance = self.balance + amount;
        self
    }

    public fun withdraw(&mut self, amount: u64): &mut Self {
        if (self.balance >= amount) {
            self.balance = self.balance - amount;
        }
        self
    }

    public fun reset(&mut self): &mut Self {
        self.balance = 0;
        self
    }
}
```

### 4.2 链式调用示例

```move
public fun example_usage() {
    let mut account = BankModule::new_account(1000);
    account.deposit(500).withdraw(300).reset();
    assert!(account.balance == 0, b"Balance should be zero after reset.");
}
```

## 总结

通过本次学习，我们系统地掌握了 Move 函数、表达式、控制流、`match` 的使用以及结构方法链式调用的高级技巧。Move 强调安全性与高效性，是区块链智能合约开发的强大工具。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)