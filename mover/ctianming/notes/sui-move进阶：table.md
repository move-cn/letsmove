# sui-move进阶：table

Sui Move 中的 `0x2::table` 模块提供了一种类似映射（Map）的集合，用于存储键值对。与传统集合不同，`Table` 的键和值并不直接存储在 `Table` 结构体中，而是通过 Sui 的对象系统进行管理。这使得 `Table` 成为一个句柄，用于操作存储在对象系统中的数据。

---

## Table 的特性

### 存储在对象系统中

   - 键值对不直接存储在 `Table` 实例中，而是分散存储在 Sui 的对象系统中。

   - 不同的 `Table` 即使有相同的键值对，也不会在运行时被认为相等。

我们可以来看看table的源码：
```move
public struct Table<phantom K: copy + drop + store, phantom V: store> has key, store {
    /// the ID of this table
    id: UID,
    /// the number of key-value pairs in the table
    size: u64,
}
```

可以看到table只有两个内部变量：id 和size：
 - id 赋予table 唯一的标识（这也是拥有key能力的资源所必须的）

 - size标记table的大小，有多少个键值对就有多少个size 

在来看一个基本的table库函数的定义：

```move
/// Adds a key-value pair to the table `table: &mut Table<K, V>`
/// Aborts with `sui::dynamic_field::EFieldAlreadyExists` if the table already has an entry with
/// that key `k: K`.
public fun add<K: copy + drop + store, V: store>(table: &mut Table<K, V>, k: K, v: V) {
    field::add(&mut table.id, k, v);
    table.size = table.size + 1;
}
```

这里调用了dynamic_field库中的add函数，这部分我将在后续单独将该库的时候去分析，这里我们只需知道：

> K是一个拥有copy 、drop 、store能力的对象，V是一个拥有store能力的对象。该函数的作用是向Table添加一个由K指定的V动态对象。

示例：
   ```move
   let table1 = table::new<u64, bool>();
   let table2 = table::new<u64, bool>();
   table::add(&mut table1, 0, false);
   table::add(&mut table1, 1, true);
   table::add(&mut table2, 0, false);
   table::add(&mut table2, 1, true);
   assert!(&table1 != &table2); // 两个 Table 不相等
高效的动态存储：
```

通过 Sui 的对象系统管理存储，提升了存储和检索的灵活性。

## 核心操作

以下是 0x2::table 模块中支持的核心操作：

### 创建 Table

new 函数用于创建一个新的空表：
```move
/// Creates a new, empty table
public fun new<K: copy + drop + store, V: store>(ctx: &mut TxContext): Table<K, V> {
    Table {
        id: object::new(ctx),
        size: 0,
    }
}
```
示例：

```move
let table = table::new<u64, bool>(&mut ctx);
```

### 添加键值对

add 函数用于向 Table 添加键值对：

```move
/// Adds a key-value pair to the table `table: &mut Table<K, V>`
/// Aborts with `sui::dynamic_field::EFieldAlreadyExists` if the table already has an entry with
/// that key `k: K`.
public fun add<K: copy + drop + store, V: store>(table: &mut Table<K, V>, k: K, v: V) {
    field::add(&mut table.id, k, v);
    table.size = table.size + 1;
}
```

如果该键已存在，将会抛出`sui::dynamic_field::EFieldAlreadyExists`错误。

示例：
```move
table::add(&mut table, 42, true);
```

### 借用键对应的值

#### 不可变借用:

borrow 函数返回键对应的值的不可变引用：

```move
#[syntax(index)]
/// Immutable borrows the value associated with the key in the table `table: &Table<K, V>`.
/// Aborts with `sui::dynamic_field::EFieldDoesNotExist` if the table does not have an entry with
/// that key `k: K`.
public fun borrow<K: copy + drop + store, V: store>(table: &Table<K, V>, k: K): &V {
    field::borrow(&table.id, k)
}
```

如果键不存在，会中止并抛出 `EFieldDoesNotExist` 错误。

示例：
```move
let value = table::borrow(&table, 42);
```

#### 可变借用

borrow_mut 函数返回键对应的值的可变引用：

```move
#[syntax(index)]
/// Mutably borrows the value associated with the key in the table `table: &mut Table<K, V>`.
/// Aborts with `sui::dynamic_field::EFieldDoesNotExist` if the table does not have an entry with
/// that key `k: K`.
public fun borrow_mut<K: copy + drop + store, V: store>(table: &mut Table<K, V>, k: K): &mut V {
    field::borrow_mut(&mut table.id, k)
}
```

示例：
```move
let value_mut = table::borrow_mut(&mut table, 42);
*value_mut = false; // 修改值
```

### 移除键值对

remove 函数用于移除键值对并返回对应的值：

```move
/// Removes the key-value pair in the table `table: &mut Table<K, V>` and returns the value.
/// Aborts with `sui::dynamic_field::EFieldDoesNotExist` if the table does not have an entry with
/// that key `k: K`.
public fun remove<K: copy + drop + store, V: store>(table: &mut Table<K, V>, k: K): V {
    let v = field::remove(&mut table.id, k);
    table.size = table.size - 1;
    v
}
```

如果键不存在，会中止并抛出 `EFieldDoesNotExist` 错误。

示例：
```move
let value = table::remove(&mut table, 42);
```

### 检查键是否存在

contains 函数用于检查键是否存在于 Table 中：

```move
/// Returns true iff there is a value associated with the key `k: K` in table `table: &Table<K, V>`
public fun contains<K: copy + drop + store, V: store>(table: &Table<K, V>, k: K): bool {
    field::exists_with_type<K, V>(&table.id, k)
}
```

示例：
```move
let exists = table::contains(&table, 42);
```

### 获取 Table 的大小

获取长度:
    
    length 函数返回 Table 中的键值对数量：

```move
/// Returns the size of the table, the number of key-value pairs
public fun length<K: copy + drop + store, V: store>(table: &Table<K, V>): u64 {
    table.size
}
```

### 检查是否为空

is_empty 函数返回 Table 是否为空：

```move
/// Returns true iff the table is empty (if `length` returns `0`)
public fun is_empty<K: copy + drop + store, V: store>(table: &Table<K, V>): bool {
    table.size == 0
}
```

示例：

```move
let size = table::length(&table);
let empty = table::is_empty(&table);
```

### 销毁 Table

销毁空表:

    destroy_empty 函数销毁一个空的 Table：

```move
/// Destroys an empty table
/// Aborts with `ETableNotEmpty` if the table still contains values
public fun destroy_empty<K: copy + drop + store, V: store>(table: Table<K, V>) {
    let Table { id, size } = table;
    assert!(size == 0, ETableNotEmpty);
    id.delete()
}
```
如果 Table 非空，会中止并抛出 `ETableNotEmpty` 错误。

### 销毁任意 Table

drop 函数可销毁可能非空的 Table，要求值类型 V 具有 drop 能力：

```move
/// Drop a possibly non-empty table.
/// Usable only if the value type `V` has the `drop` ability
public fun drop<K: copy + drop + store, V: drop + store>(table: Table<K, V>) {
    let Table { id, size: _ } = table;
    id.delete()
}
```

示例：

```move
if table::is_empty(&table) {
    table::destroy_empty(table);
} else {
    table::drop(table);
}
```

## 总结
0x2::table 是 Sui Move 中提供的一个高效键值存储结构，通过 Sui 的对象系统管理存储，实现了灵活且安全的动态存储。

- 关键特性
    - 使用对象系统存储键值对，提升了扩展性。
    - 支持基础的增删改查操作。
    - 静态验证所有权规则，防止数据竞争和内存错误。
- 常见用途
    - 实现复杂的智能合约逻辑，如动态存储和检索数据。
    - 高效管理全局状态中的数据。
    - 通过 Sui 对象系统扩展合约的功能。

学习过其他语言HashMap或者其他Map结构的朋友应该可以比较容易的理解本库的内容和用法，基本是没有差别的。

但这是区块链，我们可以看到每一个键值都拥有key或者store能力，这意味着它们都将存储在链上，所以你或许需要注意一下开销：

>如果不想要开销超出预期的话，尽量减少需要存储在链上的数据。
>除非你知道你正在做什么，并对未来需要进行的操作和可能的开销
>存在预期。