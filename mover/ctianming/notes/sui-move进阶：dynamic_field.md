# sui-move进阶：dynamic_field

上一节我们说到，table模块的实现用到了dynamic_field，而我将在这一节针对该库进行进一步的讲解。

`0x2::dynamic_field` 模块为 Sui 对象提供了动态字段功能。这允许开发者在对象构造后动态地添加字段，而不是仅依赖静态声明的字段定义。

动态字段为对象扩展提供了极大的灵活性，并且是实现核心集合类型的基础模块之一。

---

## 动态字段的核心概念

### 动态字段的特点
1. 动态命名：
   - 动态字段的名称可以是任何具有 `copy`、`drop` 和 `store` 能力的值，例如整数、布尔值或字符串。

   - 与静态字段不同，动态字段的名称无需预先声明。

2. 基于对象系统的存储：
   - 动态字段通过 Sui 的对象系统存储和管理。

   - 每个动态字段由一个唯一标识符（`UID`）管理，其值是基于对象 ID、字段名称和值类型的哈希生成。


## 动态字段的结构定义

### `Field` 结构
动态字段的核心数据结构如下：

```move
struct Field<Name: copy, drop, store, Value: store> has key {
    id: object::UID,   // 动态字段的唯一标识符
    name: Name,        // 字段名称
    value: Value,      // 字段值
}
```

能力要求:

- 字段名称（Name）：必须具有 copy、drop 和 store 能力。

- 字段值（Value）：必须具有 store 能力。

## 核心操作

以下是 dynamic_field 模块中提供的主要功能：

### 添加动态字段

函数原型

```move
/// Adds a dynamic field to the object `object: &mut UID` at field specified by `name: Name`.
/// Aborts with `EFieldAlreadyExists` if the object already has that field with that name.
public fun add<Name: copy + drop + store, Value: store>(
    // we use &mut UID in several spots for access control
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
该函数的功能是：
    - 将动态字段添加到对象。
    - 如果字段名称已存在，则中止并抛出`EFieldAlreadyExists`错误。

相信还有人好奇，这个函数所调用的两个函数：`hash_type_and_key`和`add_child_object`又是个什么情况呢？

答：

*它们是move的native函数，由runst实现，如果可能的话，我后续将进行Sui库的分析与解读，并写出教程。*

示例
```move
let obj_id = ...; // 对象的 UID
dynamic_field::add(&mut obj_id, "name", "Alice");
```

### 不可变借用动态字段

函数原型

```move
/// Immutably borrows the `object`s dynamic field with the name specified by `name: Name`.
/// Aborts with `EFieldDoesNotExist` if the object does not have a field with that name.
/// Aborts with `EFieldTypeMismatch` if the field exists, but the value does not have the specified
/// type.
public fun borrow<Name: copy + drop + store, Value: store>(object: &UID, name: Name): &Value {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    let field = borrow_child_object<Field<Name, Value>>(object, hash);
    &field.value
}
```
该函数的功能是：

    - 返回指定字段名称的不可变引用。
    - 如果字段不存在，则中止并抛出 EFieldDoesNotExist。
    - 如果字段的类型与指定类型不匹配，则中止并抛出 `EFieldTypeMismatch`。

示例:

```move
let name = dynamic_field::borrow(&obj_id, "name");
assert!(*name == "Alice");
```
### 可变借用动态字段

函数原型

```move
/// Mutably borrows the `object`s dynamic field with the name specified by `name: Name`.
/// Aborts with `EFieldDoesNotExist` if the object does not have a field with that name.
/// Aborts with `EFieldTypeMismatch` if the field exists, but the value does not have the specified
/// type.
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
该函数的功能是：

    - 返回指定字段名称的可变引用。
    - 如果字段不存在或类型不匹配，则行为与 borrow 类似。

换言之，它就是`borrow`函数的mut版本，对于是否可以返回mut引用，请回忆或者回看我已完成的引用教程。

示例

```move
let name_mut = dynamic_field::borrow_mut(&mut obj_id, "name");
*name_mut = "Bob"; // 修改字段值
```

### 移除动态字段

函数原型

```move
/// Removes the `object`s dynamic field with the name specified by `name: Name` and returns the
/// bound value.
/// Aborts with `EFieldDoesNotExist` if the object does not have a field with that name.
/// Aborts with `EFieldTypeMismatch` if the field exists, but the value does not have the specified
/// type.
public fun remove<Name: copy + drop + store, Value: store>(object: &mut UID, name: Name): Value {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    let Field { id, name: _, value } = remove_child_object<Field<Name, Value>>(object_addr, hash);
    id.delete();
    value
}
```
该函数的功能是：

    - 移除指定字段并返回其值。
    - 如果字段不存在或类型不匹配，则行为与 borrow 类似。

示例:

```move
let removed_value = dynamic_field::remove(&mut obj_id, "name");
assert!(removed_value == "Alice");
```

### 检查存在性

#### 检查动态字段是否存在

检查名称`(Name)`是否存在
```move
/// Returns true if and only if the `object` has a dynamic field with the name specified by
/// `name: Name` but without specifying the `Value` type
public fun exists_<Name: copy + drop + store>(object: &UID, name: Name): bool {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    has_child_object(object_addr, hash)
}
```

无需过多解释。

#### 检查名称和类型是否匹配

```move
/// Returns true if and only if the `object` has a dynamic field with the name specified by
/// `name: Name` with an assigned value of type `Value`.
public fun exists_with_type<Name: copy + drop + store, Value: store>(
    object: &UID,
    name: Name,
): bool {
    let object_addr = object.to_address();
    let hash = hash_type_and_key(object_addr, name);
    has_child_object_with_ty<Field<Name, Value>>(object_addr, hash)
}
```

在检查动态字段是否存在之外，还检查其是否匹配(Name与Value匹配)。

示例

```move
let exists = dynamic_field::exists_(&obj_id, "name");
assert!(exists);
let exists_with_type = dynamic_field::exists_with_type<&str>(&obj_id, "name");
assert!(exists_with_type);
```

### 条件移除字段

函数原型

```move
/// Removes the dynamic field if it exists. Returns the `some(Value)` if it exists or none otherwise.
public fun remove_if_exists<Name: copy + drop + store, Value: store>(
    object: &mut UID,
    name: Name,
): Option<Value> {
    if (exists_<Name>(object, name)) {
        option::some(remove(object, name))
    } else {
        option::none()
    }
}
```

该函数的功能是：

    - 如果字段存在，则移除并返回 Option::some 包裹的值。
    - 如果字段不存在，则返回 Option::none。

示例：

```move
match dynamic_field::remove_if_exists(&mut obj_id, "name") {
    option::some(value) => debug::print(&value),
    option::none => debug::print("Field does not exist"),
}
```
## 错误常量

| 常量                             | 错误码 | 描述                                   |
|----------------------------------|--------|----------------------------------------|
| EFieldAlreadyExists              | 0      | 动态字段已存在                         |
| EFieldDoesNotExist               | 1      | 动态字段不存在                         |
| EFieldTypeMismatch               | 2      | 字段存在但类型不匹配                   |
| EBCSSerializationFailure         | 3      | 序列化失败                             |
| ESharedObjectOperationNotSupported | 4      | 尝试将共享对象添加为动态字段时发生错误 |

## 动态字段的实现细节

- 字段唯一标识符（UID）：

    - UID 基于对象地址、字段名称和值类型的哈希生成。
    - 通过 hash_type_and_key 函数计算哈希值。

- 动态字段存储：

    - 使用 add_child_object 将字段添加到对象。
    - 使用 borrow_child_object 和 borrow_child_object_mut 实现字段的不可变和可变借用。

## 动态字段的应用场景

- 动态扩展对象：

    - 在运行时向对象添加新属性，而无需修改类型定义。
实现集合类型：

    - 作为核心集合类型（如 Table）的基础模块。

- 灵活的存储与查询：

    - 使用动态字段实现高效的键值存储和管理。

## 总结
0x2::dynamic_field 模块提供了一种灵活的方式扩展 Sui 对象的功能：

- 支持动态字段的增删改查。
- 借助 Sui 的对象系统，确保存储和引用的安全性。
- 提供静态验证以防止类型不匹配或字段冲突。

掌握动态字段的使用，是构建复杂智能合约的关键技能。

许多高级的合约和代码，其实都应用了dynemic_field这样的底层库，了解和理解这些底层库对于进一步掌握Sui Move编程是必要的。