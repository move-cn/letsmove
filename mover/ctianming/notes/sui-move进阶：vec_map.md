# sui-move进阶：vec_map

`0x2::vec_map` 模块提供了一种基于向量实现的键值映射数据结构（`VecMap`）。它支持常见的映射操作，数据以插入顺序存储，而非按键排序。

然而，它的操作复杂度为 `O(N)`，其设计主要是为小型映射提供编程便利。

它作为一个基于向量（vector）的映射结构，如果想要对其进行位于中部的修改、插入或删除，其开销是非常大的。当我们有此需求预期时，应当避免使用vec_map

当我们的需求是：

- 一个不用太大的映射结构

- 不用频繁对其进行位于中部的修改

这样的情况，我们可以放心地使用vec_map

---

## VecMap 的特点

1. **基于向量实现**：
   - 使用向量存储键值对，确保按插入顺序排列。
   - 不允许重复键。

2. **泛型支持**：
   - 键类型 `K` 必须具有 `copy` 能力。
   - 值类型 `V` 没有额外能力要求。

3. **限制**：
   - 对于大规模映射或需要按键排序的映射，建议使用其他手写解决方案。

---

## 数据结构

### VecMap
```move
struct VecMap<K: copy, V> has copy, drop, store {
    contents: vector<Entry<K, V>>, // 存储键值对的向量
}
```

Entry
```move
struct Entry<K: copy, V> has copy, drop, store {
    key: K,       // 键
    value: V,     // 值
}
```
## 常量
| 常量名称            | 错误码 | 描述                                 |
|---------------------|--------|--------------------------------------|
| EKeyAlreadyExists   | 0      | 键已存在于映射中                     |
| EKeyDoesNotExist    | 1      | 键不存在于映射中                     |
| EMapNotEmpty        | 2      | 映射非空，无法销毁                   |
| EIndexOutOfBounds   | 3      | 索引越界                             |
| EMapEmpty           | 4      | 映射为空，无法弹出元素               |
| EUnequalLengths     | 5      | 构造映射时，键和值的向量长度不匹配   |

## 核心操作

以下是 vec_map 模块提供的主要功能。

### 创建与初始化

#### 创建空映射
```move
/// Create an empty `VecMap`
public fun empty<K: copy, V>(): VecMap<K, V> {
    VecMap { contents: vector[] }
}
```
创建一个空的 VecMap。

示例：
```move
let map = vec_map::empty<u64, bool>();
```

### 插入与删除

#### 插入键值对
```move
/// Insert the entry `key` |-> `value` into `self`.
/// Aborts if `key` is already bound in `self`.
public fun insert<K: copy, V>(self: &mut VecMap<K, V>, key: K, value: V) {
    assert!(!self.contains(&key), EKeyAlreadyExists);
    self.contents.push_back(Entry { key, value })
}
```
插入一个键值对。
如果键已存在，则中止并抛出 EKeyAlreadyExists。

示例：

```move
vec_map::insert(&mut map, 1, true);
```

#### 删除键值对

```move
/// Remove the entry `key` |-> `value` from self. Aborts if `key` is not bound in `self`.
public fun remove<K: copy, V>(self: &mut VecMap<K, V>, key: &K): (K, V) {
    let idx = self.get_idx(key);
    let Entry { key, value } = self.contents.remove(idx);
    (key, value)
}
```
移除指定键的键值对。

如果键不存在，则中止并抛出 EKeyDoesNotExist。

示例：

```move
let (key, value) = vec_map::remove(&mut map, &1);
```

#### 弹出最近插入的键值对

```move
public fun pop<K: copy, V>(self: &mut vec_map::VecMap<K, V>): (K, V)
```

移除并返回最后插入的键值对。

如果映射为空，则中止并抛出 EMapEmpty。

示例：

```move
let (key, value) = vec_map::pop(&mut map);
```

### 查询操作

#### 检查键是否存在
```move
/// Return true if `self` contains an entry for `key`, false otherwise
public fun contains<K: copy, V>(self: &VecMap<K, V>, key: &K): bool {
    get_idx_opt(self, key).is_some()
}
```

返回键是否存在于映射中（bool值）。

示例：

```move
let exists = vec_map::contains(&map, &1);
```

#### 获取键值对的值

##### 不可变获取：

```move
#[syntax(index)]
/// Get a reference to the value bound to `key` in `self`.
/// Aborts if `key` is not bound in `self`.
public fun get<K: copy, V>(self: &VecMap<K, V>, key: &K): &V {
    let idx = self.get_idx(key);
    let entry = &self.contents[idx];
    &entry.value
}
```
示例：

```move
let value = vec_map::get(&map, &1);
```

##### 可变获取：

```move
#[syntax(index)]
/// Get a mutable reference to the value bound to `key` in `self`.
/// Aborts if `key` is not bound in `self`.
public fun get_mut<K: copy, V>(self: &mut VecMap<K, V>, key: &K): &mut V {
    let idx = self.get_idx(key);
    let entry = &mut self.contents[idx];
    &mut entry.value
}
```

示例：

```move
let value_mut = vec_map::get_mut(&mut map, &1);
*value_mut = false;
```

##### 尝试获取：

```move
/// Safely try borrow a value bound to `key` in `self`.
/// Return Some(V) if the value exists, None otherwise.
/// Only works for a "copyable" value as references cannot be stored in `vector`.
public fun try_get<K: copy, V: copy>(self: &VecMap<K, V>, key: &K): Option<V> {
    if (self.contains(key)) {
        option::some(*get(self, key))
    } else {
        option::none()
    }
}
```

- 若存在，返回`option::some(*get(self, key))`

- 若不存在，返回`option::none()`

这个函数主要是可避免panic，也就是可以获得可预期的结果，而不必导致程序崩溃。`

示例：

```move
let opt_value = vec_map::try_get(&map, &1);
```
### 元素操作

#### 获取映射的大小
```move
/// Return the number of entries in `self`
public fun size<K: copy, V>(self: &VecMap<K, V>): u64 {
    self.contents.length()
}
```

返回映射中键值对的数量。

示例：

```move
let size = vec_map::size(&map);
```

#### 检查映射是否为空
```move 
/// Return true if `self` has 0 elements, false otherwise
public fun is_empty<K: copy, V>(self: &VecMap<K, V>): bool {
    self.size() == 0
}
```

返回映射是否为空。

示例：

```move 
let empty = vec_map::is_empty(&map);
```

### 键值对的导入与导出

#### 拆解映射为键和值向量
```move
/// Unpack `self` into vectors of its keys and values.
/// The output keys and values are stored in insertion order, *not* sorted by key.
public fun into_keys_values<K: copy, V>(self: VecMap<K, V>): (vector<K>, vector<V>) {
    let VecMap { mut contents } = self;
    // reverse the vector so the output keys and values will appear in insertion order
    contents.reverse();
    let mut i = 0;
    let n = contents.length();
    let mut keys = vector[];
    let mut values = vector[];
    while (i < n) {
        let Entry { key, value } = contents.pop_back();
        keys.push_back(key);
        values.push_back(value);
        i = i + 1;
    };
    contents.destroy_empty();
    (keys, values)
}
```
示例：
```move
let (keys, values) = vec_map::into_keys_values(map);
```

#### 从键和值向量构造映射
```move
/// Construct a new `VecMap` from two vectors, one for keys and one for values.
/// The key value pairs are associated via their indices in the vectors, e.g. the key at index i
/// in `keys` is associated with the value at index i in `values`.
/// The key value pairs are stored in insertion order (the original vectors ordering)
/// and are *not* sorted.
public fun from_keys_values<K: copy, V>(mut keys: vector<K>, mut values: vector<V>): VecMap<K, V> {
    assert!(keys.length() == values.length(), EUnequalLengths);
    keys.reverse();
    values.reverse();
    let mut map = empty();
    while (keys.length() != 0) map.insert(keys.pop_back(), values.pop_back());
    keys.destroy_empty();
    values.destroy_empty();
    map
}
```

示例：
```move
let map = vec_map::from_keys_values(keys, values);
```

### 高级操作

#### 获取键列表
```move
/// Returns a list of keys in the map.
/// Do not assume any particular ordering.
public fun keys<K: copy, V>(self: &VecMap<K, V>): vector<K> {
    let mut i = 0;
    let n = self.contents.length();
    let mut keys = vector[];
    while (i < n) {
        let entry = self.contents.borrow(i);
        keys.push_back(entry.key);
        i = i + 1;
    };
    keys
}
```

返回映射中所有键的向量。

示例：
```move
let key_list = vec_map::keys(&map);
```

#### 按索引访问键值对

##### 获取键值对：

```move
/// Return a reference to the `idx`th entry of `self`. This gives direct access into the backing array of the map--use with caution.
/// Note that map entries are stored in insertion order, *not* sorted by key.
/// Aborts if `idx` is greater than or equal to `size(self)`
public fun get_entry_by_idx<K: copy, V>(self: &VecMap<K, V>, idx: u64): (&K, &V) {
    assert!(idx < size(self), EIndexOutOfBounds);
    let entry = &self.contents[idx];
    (&entry.key, &entry.value)
}


示例：

```move
let (key, value) = vec_map::get_entry_by_idx(&map, 0);
```

##### 移除键值对：

```move 
/// Remove the entry at index `idx` from self.
/// Aborts if `idx` is greater than or equal to `size(self)`
public fun remove_entry_by_idx<K: copy, V>(self: &mut VecMap<K, V>, idx: u64): (K, V) {
    assert!(idx < size(self), EIndexOutOfBounds);
    let Entry { key, value } = self.contents.remove(idx);
    (key, value)
}

```

示例：

```move
let (key, value) = vec_map::remove_entry_by_idx(&mut map, 0);
```

## 使用示例

以下是一个 VecMap 的完整使用示例：

```move
module example::vec_map_usage {
    use 0x2::vec_map;

    public fun main() {
        // 创建空映射
        let mut map = vec_map::empty<u64, bool>();

        // 插入键值对
        vec_map::insert(&mut map, 1, true);
        vec_map::insert(&mut map, 2, false);

        // 查询操作
        let exists = vec_map::contains(&map, &1);
        let value = vec_map::get(&map, &1);

        // 修改操作
        let removed = vec_map::remove(&mut map, &1);

        // 获取键列表
        let keys = vec_map::keys(&map);

        // 拆解映射
        let (keys, values) = vec_map::into_keys_values(map);
    }
}
```

## 总结
0x2::vec_map 是一个轻量级的映射实现，适合小规模映射需求：

- 支持标准的键值操作，如插入、删除、查询。
- 数据存储按插入顺序排列，提供良好的可预测性。
- 操作复杂度为 O(N)，大规模映射建议使用其他优化方案。

还是那句话，如果对开销没有预期，不要使用vec_map，否则当你未来面对令人头疼的频繁操作开销与效率，会想打当初的自己三拳的。

当然，个人项目就没有这种顾虑了，爱怎么用怎么用，反正可以随时推倒重来。