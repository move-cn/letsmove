# （十四）深入理解 Move 的 Table 和 Bag：动态数据存储的魔法

在 Move 编程语言中，我们经常需要构建动态的数据结构来满足链上复杂业务需求，比如存储大量键值对或者处理异构数据。虽然动态字段（Dynamic Fields）提供了一些灵活性，但 Move 的 Table 和 Bag 是更进一步的解决方案，特别是在需要计数、保护对象免于意外删除时。这篇学习笔记将带你全方位理解 Table 和 Bag 的核心机制，并通过丰富的代码实例来解析它们的用法。

## 1. 为什么需要 Table 和 Bag？

在 Move 中，动态字段（Dynamic Fields）允许对象动态添加和移除字段。但存在以下问题：

1. 删除对象的风险：如果一个对象包含未删除的动态字段，当该对象被删除时，这些动态字段将变得不可访问。
2. 数据结构局限性：动态字段无法提供诸如键值对集合的统计和类型安全等高级特性。

因此，Table 和 Bag 应运而生：
- Table：一个同构集合，所有键和值的类型必须一致。
- Bag：一个异构集合，允许存储任意类型的键值对。

## 2. Table 和 Bag 的基础结构

### 2.1 Table：同构键值对映射

```move
module sui::table {

    struct Table<K: copy + drop + store, V: store> has key, store { /* 内部实现 */ }

    public fun new<K: copy + drop + store, V: store>(
        ctx: &mut TxContext,
    ): Table<K, V>;
}
```

特点：
- Table 是一个同构的映射集合，键和值的类型分别固定为 K 和 V。
- 创建时需要使用 `sui::table::new` 函数并传入一个事务上下文 `TxContext`，因为 Table 本质上是一个可以转移、共享和包裹的对象。

### 2.2 Bag：异构键值对集合

```move
module sui::bag {

    struct Bag has key, store { /* 内部实现 */ }

    public fun new(ctx: &mut TxContext): Bag;
}
```

特点：
- Bag 是一个异构的集合，不要求键和值具有一致的类型。
- 同样是对象类型，创建 Bag 需要传递事务上下文。
  
注意：Bag 和 Table 的关系类似于动态字段中的 field 和 object field 的区别。Table 的 ObjectTable 版本允许值为对象类型，但这些对象在链上是可见的，而 Table 的普通版本对外隐藏了存储的值。

## 3. Table 和 Bag 的常见操作

Table 和 Bag 提供了一组通用 API，涵盖了增、删、查、改操作。以下以 Table 为例进行讲解。

### 3.1 添加键值对

```move
module sui::table {

    public fun add<K: copy + drop + store, V: store>(
        table: &mut Table<K, V>,
        k: K,
        v: V,
    );
}
```

示例：

```move
fun example_add(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    sui::table::add(&mut table, 1, 100); // 添加键 1，值 100
    sui::table::add(&mut table, 2, 200); // 添加键 2，值 200
}
```

注意：如果尝试添加一个已存在的键，事务将失败。

### 3.2 借用键值对

```move
module sui::table {

    public fun borrow<K: copy + drop + store, V: store>(
        table: &Table<K, V>,
        k: K
    ): &V;
}
```

示例：

```move
fun example_borrow(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    sui::table::add(&mut table, 1, 100);
    
    let value = sui::table::borrow(&table, 1); // 借用键 1 的值
    assert!(*value == 100, 0);                // 验证值是否为 100
}
```

### 3.3 修改键值对

```move
module sui::table {

    public fun borrow_mut<K: copy + drop + store, V: store>(
        table: &mut Table<K, V>,
        k: K
    ): &mut V;
}
```

示例：

```move
fun example_borrow_mut(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    sui::table::add(&mut table, 1, 100);
    
    let value_mut = sui::table::borrow_mut(&mut table, 1);
    *value_mut = 200; // 修改键 1 的值为 200
}
```

### 3.4 删除键值对

```move
module sui::table {

    public fun remove<K: copy + drop + store, V: store>(
        table: &mut Table<K, V>,
        k: K,
    ): V;
}
```

示例：

```move
fun example_remove(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    sui::table::add(&mut table, 1, 100);
    
    let value = sui::table::remove(&mut table, 1); // 删除键 1
    assert!(value == 100, 0);                      // 验证删除的值是否为 100
}
```

### 3.5 查询长度

```move
module sui::table {

    public fun length<K: copy + drop + store, V: store>(
        table: &Table<K, V>,
    ): u64;

    public fun is_empty<K: copy + drop + store, V: store>(
        table: &Table<K, V>
    ): bool;
}
```

示例：

```move
fun example_length(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    sui::table::add(&mut table, 1, 100);
    
    let len = sui::table::length(&table);  // 获取长度
    assert!(len == 1, 0);                  // 验证长度是否为 1
}
```

### 3.6 清空 Table 或 Bag

Table 和 Bag 都无法直接通过作用域结束自动销毁，因为它们没有 `drop` 属性。需要显式调用以下函数销毁：

```move
module sui::table {

    public fun destroy_empty<K: copy + drop + store, V: store>(
        table: Table<K, V>,
    );

    public fun drop<K: copy + drop + store, V: drop + store>(
        table: Table<K, V>,
    );
}
```

注意：`destroy_empty` 仅在集合为空时可用；而 `drop` 要求值类型 `V` 拥有 `drop` 能力。

## 4. Table 与 Bag 的深度对比

| 特性       | Table                        | Bag                          |
|------------|------------------------------|------------------------------|
| 键值类型   | 同构 (K, V)                  | 异构                         |
| 可见性     | 普通版本对外不可见；ObjectTable 可见 | 普通版本对外不可见；ObjectBag 可见 |
| 删除保护   | 支持                         | 支持                         |
| 使用场景   | 固定类型的键值对映射         | 动态类型的键值对集合         |

## 5. 实战：构建一个多用户评分系统

以下是一个综合示例，展示如何使用 Table 和 Bag 构建一个评分系统，每个用户可以对多个项目进行评分。

```move
module example::rating_system {

    use sui::table;
    use sui::bag;

    struct User has key, store {
        id: UID,
        ratings: Table<u64, u8>, // 每个用户存储项目评分
    }

    public fun add_user(ctx: &mut TxContext): User {
        let user = User {
            id: object::new_uid(ctx),
            ratings: table::new(ctx),
        };
        user
    }

    public fun rate_project(user: &mut User, project_id: u64, rating: u8) {
        assert!(rating <= 5, 0); // 评分范围：0-5
        table::add(&mut user.ratings, project_id, rating);
    }

    public fun get_rating(user: &User, project_id: u64): u8 {
        *table::borrow(&user.ratings, project_id)
    }

    public fun average_rating(user: &User): f64 {
        let len = table::length(&user.ratings) as f64;
        let mut total: u64 = 0;
        for project_id in table::keys(&user
```
## 代码解析

1. **添加用户**：通过 `add_user` 函数为每个用户创建一个 `User` 对象，并初始化一个 `Table` 来存储项目评分。
2. **评分功能**：`rate_project` 函数允许用户为指定的项目（以项目 ID 标识）提供评分（0-5）。
3. **查询评分**：通过 `get_rating` 函数可以快速查询某个项目的评分。
4. **平均评分计算**：`average_rating` 函数遍历 `Table` 中的所有评分，并计算其平均值。

## 6. 清理和销毁：保证链上资源管理

在链上，资源的管理至关重要。Move 中，`Table` 和 `Bag` 的清理方式确保了链上数据的安全性。

### 6.1 销毁空集合

如果集合为空，可以调用 `destroy_empty` 函数销毁它。

```move
fun cleanup_empty_table(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    // 此时 Table 为空，可以销毁
    sui::table::destroy_empty(table);
}
```

### 6.2 销毁非空集合

如果集合不为空，必须显式处理其值才能销毁。例如，`drop` 函数要求值类型支持 `drop`。

```move
fun cleanup_non_empty_table(ctx: &mut TxContext) {
    let mut table = sui::table::new<u64, u64>(ctx);
    sui::table::add(&mut table, 1, 100);
    sui::table::add(&mut table, 2, 200);

    // 显式处理每个值后，再销毁 Table
    let value1 = sui::table::remove(&mut table, 1);
    let value2 = sui::table::remove(&mut table, 2);
    sui::table::drop(table); // 销毁
}
```

## 7. Bag 的独特功能：异构存储与类型查询

`Bag` 支持存储异构数据，并允许通过类型检查值的存在性。

### 7.1 检查键是否存在

```move
module sui::bag {

    public fun contains<K: copy + drop + store>(
        bag: &Bag,
        k: K
    ): bool;

    public fun contains_with_type<K: copy + drop + store, V: store>(
        bag: &Bag,
        k: K
    ): bool;
}
```

示例：

```move
fun example_bag_contains(ctx: &mut TxContext) {
    let mut bag = sui::bag::new(ctx);
    sui::bag::add(&mut bag, 1, 100u8);
    sui::bag::add(&mut bag, "key", "value");

    let contains_key = sui::bag::contains(&bag, "key");
    let contains_key_with_type = sui::bag::contains_with_type<&str, &str>(&bag, "key");

    assert!(contains_key, 0);               // 验证键 "key" 是否存在
    assert!(contains_key_with_type, 1);    // 验证键 "key" 且值为字符串
}
```

## 8. 表与袋的比较总结

**表（Table）**适合场景：
- 需要存储同构键值对。
- 需要在链上隐藏存储值的场景（如 Table 的普通版本）。

**袋（Bag）**适合场景：
- 需要存储异构数据。
- 需要灵活的键值类型检查。

| 功能对比  | Table    | Bag      |
|-----------|----------|----------|
| 键值对类型 | 同构     | 异构     |
| 隐藏值    | 普通 Table 隐藏；ObjectTable 可见 | 普通 Bag 隐藏；ObjectBag 可见 |
| 类型检查支持 | 不支持  | 支持（通过 contains_with_type） |

## 9. 实战延伸：NFT 交易市场中的应用

以下示例展示如何使用 `Bag` 构建一个简单的 NFT 交易市场，其中每个卖家可以列出多个 NFT。

```move
module marketplace::nft_market {

    use sui::bag;

    struct Seller has key, store {
        id: UID,
        nfts: Bag, // 使用 Bag 存储每个卖家的 NFT 列表
    }

    public fun new_seller(ctx: &mut TxContext): Seller {
        let seller = Seller {
            id: object::new_uid(ctx),
            nfts: bag::new(ctx),
        };
        seller
    }

    public fun list_nft(seller: &mut Seller, nft_id: u64, price: u64) {
        bag::add(&mut seller.nfts, nft_id, price); // 列出 NFT
    }

    public fun buy_nft(ctx: &mut TxContext, seller: &mut Seller, nft_id: u64) {
        let price = bag::remove(&mut seller.nfts, nft_id); // 从卖家移除 NFT
        transfer::transfer_tokens(ctx, price);            // 模拟支付（具体实现略）
    }

    public fun get_listing(seller: &Seller, nft_id: u64): u64 {
        *bag::borrow(&seller.nfts, nft_id) // 查询 NFT 的价格
    }
}
```

## 10. 结语

通过 Move 的 `Table` 和 `Bag`，我们可以高效地管理链上的动态集合。它们提供了比动态字段更强大的功能，尤其适合复杂数据结构的开发。在链上应用开发中，选择合适的数据结构不仅可以提升性能，还能降低出错的风险。


> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)