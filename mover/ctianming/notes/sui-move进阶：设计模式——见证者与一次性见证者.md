# sui-move进阶：设计模式——见证者与一次性见证者

在上一个教程中，我们提到了`witness`，并说它：使用了`一次性见证者`的设计模式。

在本教程中，我们将对其作进一步的讨论。

而在介绍`一次性见证者`之前，我们需要先介绍一下`设计模式——见证者`。

---

## 什么是见证者模式

### 介绍

见证者模式的核心是利用特定的值来证明某个属性的真实性。在 Move 中，这种模式通过模块提供的结构体和函数，确保只有定义模块才能创建特定类型的实例。

### 特点

- **安全性**：模块内的结构体只能由模块创建，防止外部滥用。
- **泛型支持**：见证者允许泛型类型的受限实例化。
- **类型所有权验证**：通过特定值证明模块对类型的所有权。


## Move 中的见证者模式

### 示例

```move
module book::witness {
    /// 需要见证者才能创建的结构体。
    public struct Instance<T> { t: T }

    /// 使用提供的 T 创建 `Instance<T>` 的新实例。
    public fun new<T>(witness: T): Instance<T> {
        Instance { t: witness }
    }
}
```
解析
`Instance<T>` 是一个需要见证者才能创建的泛型结构体。
new 函数接受类型 T 的见证者 witness，并返回 `Instance<T>` 的实例。
只有提供类型 T 的实例，才能调用 new 创建对应的 `Instance<T>`。

### 实现示例

见证者的功能通常通过其他模块中的实现来体现。以下是一个完整的模块示例：

```move
module book::witness_source {
    use book::witness::{Self, Instance};

    /// 作为见证者使用的结构体。
    public struct W {}

    /// 创建 `Instance<W>` 的新实例。
    public fun new_instance(): Instance<W> {
        witness::new(W {})
    }
}
```

#### 功能解析

W 是一个定义在 book::witness_source 模块中的结构体。
通过 new_instance 函数，模块创建并传递 W 的实例，生成 `Instance<W>`。

这一模式证明了 book::witness_source 对 W 的所有权。

### 泛型类型实例化

见证者模式在 Move 中的一个重要应用是泛型类型的受限实例化。以下是一个示例，展示了如何通过见证者模式为泛型类型提供实例化和扩展能力：

#### 供应量管理示例

##### 提供供应

```move
/// 供应类型为 T。用于铸造和销毁。
public struct Supply<phantom T> has key, store {
    id: UID,
    value: u64
}

/// 使用提供的见证者为类型 T 创建新的供应。
public fun create_supply<T: drop>(_w: T): Supply<T> {
    Supply { id: object::new(), value: 0 }
}

/// 获取 `Supply` 的值。
public fun supply_value<T>(supply: &Supply<T>): u64 {
    supply.value
}
```

解析:

`Supply<T>` 是一个泛型结构体，用于管理某种类型 T 的供应量。

create_supply 函数需要提供类型 T 的见证者 _w，确保只能通过见证者来创建 `Supply<T>`。

##### 扩展供应

`Supply<T>` 可以用于创建代币余额 `Balance<T>`。以下是相关代码：

```move
/// 可存储的余额。
struct Balance<phantom T> has store {
    value: u64
}

/// 增加供应量 `value` 并创建具有此值的新 `Balance<T>`。
public fun increase_supply<T>(self: &mut Supply<T>, value: u64): Balance<T> {
    assert!(value < (18446744073709551615u64 - self.value), EOverflow);
    self.value = self.value + value;
    Balance { value }
}
```

功能解析:

increase_supply 允许模块通过修改 `Supply<T>` 的值，铸造新的 `Balance<T>`。

同时泛型参数 T 确保了类型安全，避免跨类型的误操作。

## 一次性见证者(one time witness)

### 介绍

我将重点放在一次性见证者中，实际上，这一种设计模式在我们之前做task2的时候便已经使用过了。

一次性见证者用于某些需要确保某些类型的实例只能被创建一次的场景，它确保结构体的唯一性。

### 定义

一次性见证（OTW）(one time witness)是一种特殊类型的见证，只能使用一次。它不能手动创建，且每个模块中拥有唯一的实例。Sui 适配器将类型视为 OTW，如果满足以下规则：

- 只具有 drop 能力。
- 没有字段。
- 不是泛型类型。
- 模块名称为大写字母。

以下是 OTW 的示例：

```move
module book::one_time {
    /// The OTW for the `book::one_time` module.
    /// Only `drop`, no fields, no generics, all uppercase.
    public struct ONE_TIME has drop {}

    /// Receive the instance of `ONE_TIME` as the first argument.
    fun init(otw: ONE_TIME, ctx: &mut TxContext) {
        // do something with the OTW
    }
}
```
OTW 不能手动构造，任何试图这样做的代码都会导致编译错误。

OTW 可以作为模块初始化器的第一个参数进行接收。由于 init 函数每个模块只调用一次，因此 OTW 保证只被实例化一次。

### 示例

我们直接使用我们task2的代码作为示例：

```move
// 这是一个OTW
public struct MY_COIN has drop {}
```

MY_COIN结构体：

    1. 无字段
    2. 只具有drop能力
    3. 名称全部大写（如果你试图违反的话，编译器会报错）
    4. 不是泛型类型

它完美符合我们OTW的定义。

而在我们编写过的函数init中：

```move
fun init(witness: MY_COIN, ctx: &mut TxContext) {
				let (treasury, metadata) = coin::create_currency(
					witness, 
					6,
					b"MOON",
				    b"CTIANMING_MY_COIN",
			   	    b"MOON_COIN",
					option::none(),
					ctx);
				debug::print(&string(b"init MY_COIN"));
				transfer::public_freeze_object(metadata);
				transfer::public_transfer(treasury, ctx.sender())
		}
```

witness我们传入了MY_COIN作为参数，我再来看看coin.move库文件对create_currency的描述：

```
/// Create a new currency type `T` as and return the `TreasuryCap` for
/// `T` to the caller. Can only be called with a `one-time-witness`
/// type, ensuring that there's only one `TreasuryCap` per `T`.
```

翻译一下，就是：
```move
/// 创建一种新的货币类型 `T` 并返回 `T` 的 `TreasuryCap` 给调用者。
/// 只能使用 `one-time-witness` 类型调用，确保每种 `T` 只有一个 `TreasuryCap`。
```

很明显，一次性见证则模式保证`MY_COIN`只具有一个`TreasuryCap`，这是权限控制所必须的。

一般而言，我们使用标准库时，需要使用一次性见证者模式的函数都有相应描述，所以：

看源码！看源码！看源码！

### 为什么是*一次性见证者*

那么我们来思考一个问题，为什么`一次性见证者`是一次性的？

很显然，仍然以`MY_COIN`为例，它只具有`drop`能力，这使得它在生命周期结束时将自动销毁。

而我们调用create_currency使用了它，而没有对它进行任何的额外处理，它在那之后便自动销毁了，不在有人可以使用它。

也就是说，它是唯一的，也是一次性的。

## 总结

- 见证者模式：通过模块控制类型实例的创建，用于泛型实例化和权限控制。

- 一次性见证者：确保某些类型的实例只能被创建一次，用于关键资源的唯一性管理。