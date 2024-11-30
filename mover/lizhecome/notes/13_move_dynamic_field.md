# （十三）深入浅出Move语言的动态字段 (Dynamic Fields)：从基础到实践

Move语言作为区块链上的智能合约开发语言，以其安全性和灵活性备受瞩目。在Sui区块链的生态中，动态字段 (Dynamic Fields) 提供了一种独特的方式，用于存储和管理数据，同时解决了一些传统字段操作中的局限性。本文将通过详细的讲解、实用的代码示例，带你全面掌握动态字段的理论与实践。

## 什么是动态字段？

动态字段是Sui在Move语言中实现的一种机制，允许开发者为对象动态地添加、访问和删除字段。这种机制打破了传统静态字段的限制，极大地增强了灵活性。

## 动态字段的关键特性

1. **动态扩展性**：
   - 与静态字段必须在结构体声明时固定不同，动态字段可以在运行时添加和删除，提供了更高的灵活性。

2. **异构存储**：
   - 支持存储不同类型的数据，克服了Move中vector类型必须是单一类型的限制。

3. **节约资源**：
   - 仅在访问时消耗Gas，避免了静态字段可能导致的资源浪费。

## 动态字段与对象字段的区别

动态字段有两种主要形式：字段 (Field) 和 对象字段 (Object Field)。它们的主要区别在于存储值的类型及其可访问性。

| 类型       | 描述                                                     | 模块             |
| ---------- | -------------------------------------------------------- | ---------------- |
| 字段       | 可存储任何具有store能力的值，但对象被存储时会被视为“包装” (wrapped)，无法通过外部工具直接访问。 | dynamic_field    |
| 对象字段   | 值必须是对象（即具有key能力，并以UID为首字段），可通过其ID被外部工具访问。 | dynamic_object_field |

## 动态字段的基础操作

### 1. 添加动态字段

通过调用Sui框架提供的add函数，可以将动态字段添加到指定对象中。以下是字段和对象字段的添加方式：

#### 字段添加代码示例

```move
public fun add<Name: copy + drop + store, Value: store>(
    object: &mut UID,
    name: Name,
    value: Value,
) {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    assert!(!has_child_object(object_addr, hash), EFieldAlreadyExists);
    let field = Field {
        id: object::new_uid_from_hash(hash),
        name,
        value,
    };
    add_child_object(object_addr, field)
}
```

#### 对象字段添加代码示例

```move
public fun add<Name: copy + drop + store, Value: key + store>(
    object: &mut UID,
    name: Name,
    value: Value,
) {
    add_impl!(object, name, value)
}
```

#### 实践：添加动态字段

定义两个对象类型：Parent 和 Child。Parent将动态拥有一个Child对象。

```move
public struct Parent has key {
    id: UID,
}

public struct Child has key, store {
    id: UID,
    count: u64,
}

public fun add_child(parent: &mut Parent, child: Child) {
    ofield::add(&mut parent.id, b"child", child);
}
```

结果：
- Parent对象拥有了一个动态字段child，指向Child对象。
- 所有权关系：
  - 发送者地址仍拥有Parent对象。
  - Parent对象通过字段名b"child"拥有Child对象。

### 2. 访问动态字段

要访问动态字段，需要使用borrow和borrow_mut API：

```move
public fun borrow<Name: copy + drop + store, Value: store>(
    object: &UID,
    name: Name,
): &Value {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    let field = borrow_child_object<Field<Name, Value>>(object, hash);
    &field.value
}

public fun borrow_mut<Name: copy + drop + store, Value: store>(
    object: &mut UID,
    name: Name,
): &mut Value {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    let field = borrow_child_object_mut<Field<Name, Value>>(object, hash);
    &mut field.value
}
```

#### 通过字段操作子对象

```move
public fun mutate_child(child: &mut Child) {
    child.count = child.count + 1;
}

public fun mutate_child_via_parent(parent: &mut Parent) {
    mutate_child(ofield::borrow_mut(&mut parent.id, b"child"));
}
```

### 3. 删除动态字段

动态字段的删除通过remove函数实现。删除后可以返回字段值，并进行其他操作（如删除、转移）。

```move
public fun remove<Name: copy + drop + store, Value: store>(
    object: &mut UID,
    name: Name,
): Value {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    let Field { id, name: _, value } = remove_child_object<Field<Name, Value>>(object_addr, hash);
    id.delete();
    value
}
```

#### 删除字段的实践

```move
public fun delete_child(parent: &mut Parent) {
    let Child { id, count: _ } = reclaim_child(parent);
    object::delete(id);
}

public fun reclaim_child(parent: &mut Parent): Child {
    ofield::remove(&mut parent.id, b"child")
}
```

### 4. 注意事项

- 如果尝试访问不存在的字段，交易会失败。
- 字段删除后无法直接访问其值，需提前取回。
- 删除包含动态字段的对象会使这些字段永久无法访问。

## 高级用法：构建动态集合

Sui框架中基于动态字段实现了Table和Bag两种集合类型，支持高效存储和计数，可用于复杂场景。

### 示例：使用Table构建键值对存储

```move
public fun example_table_operations() {
    let table = table::new();
    table::add(&mut table, "key1", 100);
    let value = table::borrow(&table, "key1");
    assert!(*value == 100, "Unexpected value!");
    table::remove(&mut table, "key1");
}
```

## 总结

动态字段为Move语言带来了显著的灵活性，使得开发者可以在复杂应用中实现动态扩展和高效存储。通过本文的学习，相信你已经掌握了动态字段的理论知识和操作技巧，并能在实际开发中熟练应用。继续探索动态集合类型如Table和Bag，你将发现更多可能性！

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)