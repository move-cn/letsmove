# Move 2024 迁移指南

Move 2024 是由 Mysten Labs 维护的新版本 Move 语言。本指南旨在帮助您了解 2024 版与之前版本的区别。

> 本指南提供了新版本中变化的高级概述。有关更详细和详尽的更改列表，请参阅 [Sui Documentation](https://docs.sui.io/guides/developer/advanced/move-2024-migration)。

## 使用新版

要使用新版，您需要在 `move` 文件中指定版本。版本在 `move` 文件中使用 `edition` 关键字来指定。目前，唯一可用的版本是 `2024.beta`。

```ini
edition = "2024.beta";
```

## 迁移工具

Move CLI 提供了一个迁移工具，可以将代码更新到新版本。要使用迁移工具，请运行以下命令：

```bash
$ sui move migrate
```

迁移工具将更新代码以使用 `let mut` 语法、新的 `public` 修饰符用于结构体，以及用 `public(package)` 函数可见性代替 `friend` 声明。

## 使用 `let mut` 声明可变变量

Move 2024 引入了 `let mut` 语法来声明可变变量。`let mut` 语法用于声明一个可以在声明后更改的可变变量。

> 现在，声明可变变量必须使用 `let mut`。如果尝试在没有 `mut` 关键字的情况下重新赋值变量，编译器将发出错误。

```move
// Move 2020
let x: u64 = 10;
x = 20;

// Move 2024
let mut x: u64 = 10;
x = 20;
```

此外，`mut` 关键字在元组解构和函数参数中用于声明可变变量。

```move
// 通过值传递并修改
fun takes_by_value_and_mutates(mut v: Value): Value {
    v.field = 10;
    v
}

// `mut` 应放在变量名之前
fun destruct() {
    let (x, y) = point::get_point();
    let (mut x, y) = point::get_point();
    let (mut x, mut y) = point::get_point();
}

// 在结构体解包中
fun unpack() {
    let Point { x, mut y } = point::get_point();
    let Point { mut x, mut y } = point::get_point();
}
```

## `friend` 已被弃用

在 Move 2024 中，`friend` 关键字已被弃用。相反，您可以使用 `public(package)` 可见性修饰符使函数对同一包中的其他模块可见。

```move
// Move 2020
friend book::friend_module;
public(friend) fun protected_function() {}

// Move 2024
public(package) fun protected_function_2024() {}
```

## 结构体可见性

在 Move 2024 中，结构体具有可见性修饰符。目前，唯一可用的可见性修饰符是 `public`。

```move
// Move 2020
struct Book {}

// Move 2024
public struct Book {}
```

## 方法语法

在新版本中，以结构体作为第一个参数的函数与结构体关联。这意味着可以使用点表示法调用函数。在与类型定义在同一模块中的方法会自动导出。

> 如果类型在与方法相同的模块中定义，则方法会自动导出。无法为在其他模块中定义的类型导出方法。但是，您可以在模块范围内创建[自定义别名](#method-aliases)来代替。

```move
public fun count(c: &Counter): u64 { /* ... */ }

fun use_counter() {
    // move 2020
    let count = counter::count(&c);

    // move 2024
    let count = c.count();
}
```

## 内置类型的方法

在 Move 2024 中，一些原生和标准类型具有关联方法。例如，`vector` 类型具有 `to_string` 方法，可以将向量转换为 UTF8 字符串。

```move
fun aliases() {
    // 向量转字符串和 ASCII 字符串
    let str: String = b"Hello, World!".to_string();
    let ascii: ascii::String = b"Hello, World!".to_ascii_string();

    // 地址转字节
    let bytes = @0xa11ce.to_bytes();
}
```

有关内置别名的完整列表，请参阅[标准库](../move-basics/standard-library.md#source-code)和[Sui 框架](../programmability/sui-framework.md#source-code)的源代码。

## 借用操作符

一些内置类型支持借用操作符。借用操作符用于获取指定索引处元素的引用。借用操作符定义为 `[]`。

```move
fun play_vec() {
    let v = vector[1,2,3,4];
    let first = &v[0];         // 调用 vector::borrow(v, 0)
    let first_mut = &mut v[0]; // 调用 vector::borrow_mut(v, 0)
    let first_copy = v[0];     // 调用 *vector::borrow(v, 0)
}
```

支持借用操作符的类型有：

- `vector`
- `sui::vec_map::VecMap`
- `sui::table::Table`
- `sui::bag::Bag`
- `sui::object_table::ObjectTable`
- `sui::object_bag::ObjectBag`
- `sui::linked_table::LinkedTable`

要为自定义类型实现借用操作符，需要在方法上添加 `#[syntax(index)]` 属性。

```move
#[syntax(index)]
public fun borrow(c: &List<T>, key: String): &T { /* ... */ }

#[syntax(index)]
public fun borrow_mut(c: &mut List<T>, key: String): &mut T { /* ... */ }
```

## 方法别名

在 Move 2024 中，方法可以与类型关联。可以为本地模块中的任何类型定义别名；如果类型在同一模块中定义，则可以公开定义别名。

```move
// my_module.move
// 本地：类型对模块来说是外来的
use fun my_custom_function as vector.do_magic;

// sui-framework/kiosk/kiosk.move
// 导出：类型在同一模块中定义
public use fun kiosk_owner_cap_for as KioskOwnerCap.kiosk;
```

这就是 Move 2024 迁移指南的主要内容。如果有更多问题或需要进一步指导，请随时询问！