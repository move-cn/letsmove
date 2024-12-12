# sui-move进阶：生命周期

对于许多语言的初学者而言，很可能缺乏生命周期的概念，例如通过C语言入门编程的朋友们。但在例如Move和Rust这样的注重安全的编程语言中，生命周期是一个非常重要的概念，甚至许多时候编译器会要求你注意变量的生命周期。

在 Sui Move 编程中，生命周期用于描述变量和资源的存在周期及其作用范围。Move 的生命周期模型通过静态类型系统强制执行所有权和引用规则，确保资源的安全性，防止常见的内存管理错误，如悬挂引用或双重释放。

本教程将详细讲解 Sui Move 的生命周期管理，包括生命周期的基本概念、作用范围、引用与所有权的交互，以及常见的生命周期规则。

> `遮蔽`与`Move和Copy`两节引用了sui move reference：https://reference.sui-book.com

---

## 生命周期的基本概念

生命周期指的是变量或资源从创建到销毁的整个过程。在 Move 中，生命周期的管理依赖于以下原则：

1. 所有权规则：资源类型具有唯一的所有权。

2. 作用范围：变量的生命周期受其作用域限制。

3. 静态验证：生命周期在编译时被静态验证，避免运行时错误。


## 生命周期与作用范围

### 局部变量的生命周期

局部变量的生命周期从声明开始，到其所在的代码块结束为止。例如：

```move
fun main() {
    let x = 10; // x 的生命周期开始
    let y = x + 1; // x 和 y 在作用域内
} // x 和 y 的生命周期结束
```

一个局部变量的声明周期仅在其声明的代码块内（如果不作其他如复制的操作的话），如果尝试在代码块外使用局部变量，将会报错：

```move
let x = 0;
{
    let y = 1;
};
x + y // 错误！
//  ^ 未绑定的局部变量 'y'
```

一般而言，Move的基本类型都具有drop能力，所以当变量超出作用范围时，Move 会自动清理该变量，并释放相关资源。

### 资源类型的生命周期

资源类型（如 has key 或 has store 的结构体）具有特殊的生命周期规则：

- 资源的所有权不可复制：资源类型的生命周期由所有权决定，不能通过赋值操作复制资源。

- 资源的销毁：资源超出作用范围后，必须显式移动或销毁。(除非它具有drop能力)

还是以Coin为例：

```move
public struct Coin<phantom T> has key, store {
    id: UID,
    balance: Balance<T>,
}

```

Coin具有key和store能力，这代表它在链上唯一存在，并具有相应的所有权。在创建和使用完Coin之后，我们必须显式地（如果没有，就是你所调用的函数替你做了这一工作）声明移动或是销毁它：

```move
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"my_coin mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        // 显式地移动Coin
        transfer::public_transfer(coin, recipient)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        debug::print(&string(b"burn"));
        // 显式地销毁Coin
        coin::burn(treasury_cap, coin);
    }
```



## 生命周期与引用

### 引用的生命周期

引用的生命周期受其创建位置和作用范围的限制：

- 引用的生命周期不能超过被引用值的生命周期。

- Move 不允许引用的引用，以简化生命周期管理。

示例：合法引用
```move
fun main() {
    let x = 10;
    let ref_x = &x; // ref_x 的生命周期与 x 相同
    let value = *ref_x; // 解引用 ref_x
} // x 和 ref_x 生命周期结束
```
示例：非法引用

```move
fun illegal() {
    let x = 10;
    let ref_x = &x;
    let ref_ref_x = &ref_x; // 错误！Move 不支持引用的引用
}
```

## 生命周期与资源的所有权转移

在 Move 中，资源的所有权可以通过以下方式转移：

- 显式移动：通过函数调用将资源的所有权从一个变量转移到另一个变量。

- 资源返回值：将资源作为函数的返回值，转移所有权。

一般而言，我们调用transfer.move中的函数来进行所有权的转移。

所有权转移源代码：

```move
/// Transfer ownership of `obj` to `recipient`. `obj` must have the `key` attribute,
/// which (in turn) ensures that `obj` has a globally unique ID. Note that if the recipient
/// address represents an object ID, the `obj` sent will be inaccessible after the transfer
/// (though they will be retrievable at a future date once new features are added).
/// This function has custom rules performed by the Sui Move bytecode verifier that ensures
/// that `T` is an object defined in the module where `transfer` is invoked. Use
/// `public_transfer` to transfer an object with `store` outside of its module.
public fun transfer<T: key>(obj: T, recipient: address) {
    transfer_impl(obj, recipient)
}

/// Transfer ownership of `obj` to `recipient`. `obj` must have the `key` attribute,
/// which (in turn) ensures that `obj` has a globally unique ID. Note that if the recipient
/// address represents an object ID, the `obj` sent will be inaccessible after the transfer
/// (though they will be retrievable at a future date once new features are added).
/// The object must have `store` to be transferred outside of its module.
public fun public_transfer<T: key + store>(obj: T, recipient: address) {
    transfer_impl(obj, recipient)
}
```

概括一下，就是将`obj`的所有权发送给`recipient`，而当资源只有key能力时使用tansfer，当资源还具有store能力时使用public_transfer函数。

有趣的是，它们底层都是调用这样一个函数：

```move
public(package) native fun transfer_impl<T: key>(obj: T, recipient: address);
```

遗憾的是没有找到这一函数的底层实现，如果有了解的，欢迎赐教。


## 生命周期规则总结

- 规则 1：变量的生命周期受作用范围限制

    变量的生命周期从声明开始，到其作用域结束为止。

- 规则 2：资源的所有权是唯一的

    资源类型具有唯一的所有权，所有权的转移必须显式进行。

- 规则 3：引用的生命周期不得超出被引用值

    引用的生命周期不能超过被引用变量的生命周期，Move 静态验证引用关系。

- 规则 4：禁止引用的引用

    Move 不允许引用的引用，简化了生命周期管理。

## 遮蔽

如果 let 引入的局部变量与作用域中已有的变量同名，那么之前的变量在此作用域后将无法访问。这称为 遮蔽。

```move
let x = 0;
assert!(x == 0, 42);

let x = 1; // x 被遮蔽
assert!(x == 1, 42);
当一个局部变量被遮蔽时，它不需要保留之前的类型。

let x = 0;
assert!(x == 0, 42);

let x = b"hello"; // x 被遮蔽
assert!(x == b"hello", 42);
```

局部变量被遮蔽后，其值仍然存在，但将不再可访问。这点在处理没有 drop 能力 的类型的值时尤为重要，因为该值的所有权必须在函数结束前转移。

```
module 0x42::example {
    public struct Coin has store { value: u64 }

    fun unused_coin(): Coin {
        let x = Coin { value: 0 }; // 错误！
//          ^ 此局部变量仍包含没有 `drop` 能力的值
        x.value = 1;
        let x = Coin { value: 10 };
        x
//      ^ 返回无效
    }
}
```

当局部变量在作用域内被遮蔽时，遮蔽仅在该作用域内有效。一旦作用域结束，遮蔽就消失了。

```move
let x = 0;
{
    let x = 1;
    assert!(x == 1, 42);
};
assert!(x == 0, 42);
```
请记住，局部变量在被遮蔽时可以改变类型。

```move
let x = 0;
{
    let x = b"hello";
    assert!(x = b"hello", 42);
};
assert!(x == 0, 42);
```

## Move和Copy

在 Move 中，所有局部变量可以通过 move 或 copy 两种方式使用。如果没有明确指定其中一种，Move 编译器可以推断出应该使用 copy 还是 move。这意味着在上述所有例子中，编译器会插入 move 或 copy。

从其他编程语言过来的人会更熟悉 copy，因为它会创建变量内部值的新副本以供表达式使用。使用 copy，局部变量可以多次使用。

```move
let x = 0;
let y = copy x + 1;
let z = copy x + 2;
```

任何具有 copy 能力 的值都可以以此方式复制，并且除非指定了 move，否则会自动复制。

move 将值从局部变量中取出，而不复制数据。一旦发生 move，该局部变量将不再可用，即使值的类型具有 copy 能力 也是如此。

```move
let x = 1;
let y = move x + 1;
//      ------ 局部变量在此处被移动
let z = move x + 2; // 错误！
//      ^^^^^^ 无效使用局部变量 'x'
y + z
```

### 安全性

Move 的类型系统将阻止在值移动后继续使用该值。这与let声明中描述的安全检查相同，防止局部变量在分配值之前被使用。

### 推断

如上所述，如果未指定 copy 或 move，Move 编译器会推断出应该使用 copy 还是 move。该算法非常简单：

- 任何具有 copy 能力 的值被视为 copy。

- 任何引用（可变 &mut 和不可变 &）被视为 copy。

    - 除了在特殊情况下，为了可预测的借用检查错误而被视为 move。这将在引用不再使用时发生。

- 其他任何值被视为 move。

给定以下结构体

```move
public struct Foo has copy, drop, store { f: u64 }
public struct Coin has store { value: u64 }
```

我们有以下示例

```move
let s = b"hello";
let foo = Foo { f: 0 };
let coin = Coin { value: 0 };
let coins = vector[Coin { value: 0 }, Coin { value: 0 }];

let s2 = s; // copy
let foo2 = foo; // copy
let coin2 = coin; // move
let coins2 = coin; // move

let x = 0;
let b = false;
let addr = @0x42;
let x_ref = &x;
let coin_ref = &mut coin2;

let x2 = x; // copy
let b2 = b; // copy
let addr2 = @0x42; // copy
let x_ref2 = x_ref; // copy
let coin_ref2 = coin_ref; // copy
```

## 总结
Sui Move 的生命周期管理以静态验证为核心，确保资源和引用的安全性：

- 作用范围限制：变量的生命周期由作用域决定。

- 资源的唯一所有权：资源的生命周期由所有权规则严格控制。

- 安全引用：Move 静态验证引用生命周期，防止悬挂引用和数据竞争。
