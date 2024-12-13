# sui-move基础：所有权

Sui Move 的所有权系统是其核心设计之一，用于确保资源的安全管理和防止误用。通过静态检查所有权转移和资源生命周期，Sui Move 提供了内置的编程保障，帮助开发者构建安全高效的智能合约。

这篇文章应该被算在sui-move基础里面，为什么要补这样的文章呢？

*————原谅我之前的sui-move基础教程写的太不基础了（悲）*

---

## 什么是所有权？

在 Sui Move 中，所有权决定了一个值（特别是资源）可以被谁访问和修改。Move 的所有权系统包含以下核心概念：
1. **资源的唯一性**：资源类型值只能有一个所有者，确保资源不能被复制或丢弃。
2. **静态所有权检查**：在编译时通过类型系统检查所有权转移和使用规则。
3. **显式所有权转移**：资源只能通过显式移动操作转移所有权。

---

## 所有权的核心规则

### 值的移动

- 当将一个值赋值给另一个变量时，值的所有权会从源变量转移到目标变量。

- 转移后的源变量将变为无效，不能再被访问。

#### 示例
```move
struct Coin has key {
    value: u64,
}

fun transfer_coin() {
    let coin1 = Coin { value: 100 };
    let coin2 = coin1; // coin1 的所有权转移到 coin2
    // coin1 已无效，访问它会导致编译错误
}
```
### 资源类型

资源是 Move 中的特殊类型，具备以下特性：

- 资源类型必须用 has key 声明。
- 资源不能被复制或丢弃。
- 资源只能通过显式移动操作转移。

示例
```move

struct Coin has key {
    value: u64,
}

fun create_coin(): Coin {
    Coin { value: 100 } // 创建一个资源类型值
}

fun consume_coin(coin: Coin) {
    // 使用 coin，所有权已转移到函数内
}

fun example() {
    let coin = create_coin();
    consume_coin(coin); // 所有权转移到 consume_coin，coin 不再有效
}
```

### 复制和丢弃能力

Move 的类型系统通过能力标识符（如 copy 和 drop）控制值的复制和丢弃行为：

- copy：允许复制值。
- drop：允许丢弃值。

资源类型没有 copy 或 drop 能力。

示例

```move

struct Coin has key {
    value: u64,
}

fun invalid_copy_example() {
    let coin1 = Coin { value: 100 };
    let coin2 = coin1; // 合法：所有权转移
    let coin3 = coin1; // 错误：coin1 已被移动，不能再使用
}
```
## 所有权与引用

这部分见以前的教程。

## 所有权与资源管理

### 资源的创建

资源只能由其定义的模块创建，其他模块无法直接构造资源。

示例
```move

module example::coin {
    struct Coin has key {
        value: u64,
    }

    public fun create_coin(): Coin {
        Coin { value: 100 }
    }
}
```

### 资源的销毁

资源必须通过显式操作销毁，确保不会被意外丢弃。

示例
```move

fun destroy_coin(coin: Coin) {
    // coin 被销毁，释放资源
}
```

### 资源的转移

资源可以通过函数参数或返回值在模块之间转移所有权。

示例
```move

fun transfer_example() {
    let coin = Coin { value: 100 };
    let coin2 = move coin; // 显式转移所有权
}
```

## 所有权的应用场景

### 代币管理
资源类型非常适合建模代币和资产，确保唯一性和安全性。

示例
```move

module example::token {
    struct Token has key {
        id: u64,
        owner: address,
    }

    public fun create(owner: address): Token {
        Token { id: 1, owner }
    }

    public fun transfer(token: Token, new_owner: address): Token {
        Token { id: token.id, owner: new_owner }
    }
}
```
### 防止双花
通过所有权系统，Move 可以防止代币或资产的重复使用。

示例
```move

fun pay(token: Token) {
    // token 的所有权被消费，无法再使用
}
```
## 常见错误示例
| 错误                   | 描述                   | 示例                                |
|------------------------|------------------------|-------------------------------------|
| 所有权重复使用         | 尝试使用已移动的值     | `let x = move y; let z = move y;`   |
| 不允许的资源丢弃       | 资源未显式销毁         | `let coin = Coin { value: 100 };`   |
| 同时存在可变与不可变引用 | 值同时有可变和不可变引用 | `let r1 = &coin; let r2 = &mut coin;` |

## 总结
Sui Move 的所有权系统通过静态检查，确保资源的安全管理：

- 所有权规则限制资源的复制和滥用。
- 引用规则防止数据竞争和未定义行为。
- 资源类型用于安全地创建和管理区块链资产。