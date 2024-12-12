# sui-move进阶：vector

`0x1::vector` 是 Sui Move 中提供的动态数组模块，用于管理可变大小的容器。向量支持任意类型的存储，具有灵活的增删查改功能，底层实现采用原生操作以确保高效性。

如果是学过Rust的朋友，应该对Vector不陌生，但Move的vector仍然与Rust中有差异，尤其它的方法接口是需要特别学习一下的。

---

## Vector 的特性

1. **动态大小**：支持动态增长和缩减。
2. **0 基索引**：访问元素的索引从 `0` 开始。
3. **泛型支持**：可以存储任意类型的元素。
4. **高效操作**：常用操作如追加、删除、交换等以原生实现。


## 常量

| 常量名称              | 错误码   | 描述                                   |
|-----------------------|----------|----------------------------------------|
| `EINDEX_OUT_OF_BOUNDS` | 131072   | 索引越界错误。                         |

---

## 核心操作

以下是 `vector` 模块的主要功能，分为创建、查询、修改和高级操作四类。

### 创建与初始化

#### 创建空向量
```move
public fun empty<Element>(): vector<Element>
```

创建一个空向量。

示例：
```move
let v = vector::empty<u64>();
```

#### 创建包含单个元素的向量
```move
public fun singleton<Element>(e: Element): vector<Element>
```
返回一个仅包含单个元素的向量。

示例：
```move
let v = vector::singleton(42);
```
### 查询操作

#### 获取长度
```move
public fun length<Element>(v: &vector<Element>): u64
```

返回向量的长度。

示例：
```move
let len = vector::length(&v);
```

#### 检查是否为空
```move
public fun is_empty<Element>(v: &vector<Element>): bool
```

如果向量为空，返回 true，否则返回 false。

示例：
```move
let empty = vector::is_empty(&v);
```
#### 判断元素是否存在
```move
public fun contains<Element>(v: &vector<Element>, e: &Element): bool
```

检查指定元素是否在向量中。

示例：
```move
let exists = vector::contains(&v, &42);
```

#### 获取元素索引
```move
public fun index_of<Element>(v: &vector<Element>, e: &Element): (bool, u64)
```

返回指定元素的索引（如果存在）。

示例：
```move
let (found, idx) = vector::index_of(&v, &42);
```

#### 借用元素

##### 不可变借用：

```move
public fun borrow<Element>(v: &vector<Element>, i: u64): &Element
```

示例：

```move
let val = vector::borrow(&v, 0);
```

##### 可变借用：

```move
public fun borrow_mut<Element>(v: &mut vector<Element>, i: u64): &mut Element
```

示例：

```move
let val_mut = vector::borrow_mut(&mut v, 0);
*val_mut = 100;
```
### 修改操作

#### 追加元素
```move
public fun push_back<Element>(v: &mut vector<Element>, e: Element)
```

在向量末尾添加一个元素。

示例：
```move
vector::push_back(&mut v, 42);
```

#### 弹出元素
```move
public fun pop_back<Element>(v: &mut vector<Element>): Element
```

移除并返回向量末尾的元素。

示例：
```move
let last = vector::pop_back(&mut v);
```

#### 移除元素

##### 按索引移除元素（保持顺序）：

```move
public fun remove<Element>(v: &mut vector<Element>, i: u64): Element\
```

示例：

```move
let removed = vector::remove(&mut v, 1);
```

##### 按索引移除元素（不保持顺序）：

```move
public fun swap_remove<Element>(v: &mut vector<Element>, i: u64): Element
```

示例：

```move
let removed = vector::swap_remove(&mut v, 1);
```

#### 插入元素
```move
public fun insert<Element>(v: &mut vector<Element>, e: Element, i: u64)
```

在指定位置插入元素。

示例：
```move
vector::insert(&mut v, 42, 1);
```

#### 交换元素
```move
public fun swap<Element>(v: &mut vector<Element>, i: u64, j: u64)
```

交换向量中两个位置的元素。

示例：
```move
vector::swap(&mut v, 0, 1);
```

### 高级操作

#### 反转向量
```move
public fun reverse<Element>(v: &mut vector<Element>)
```

原地反转向量中的元素顺序。

示例：
```move
vector::reverse(&mut v);
```

#### 追加另一个向量
```move
public fun append<Element>(lhs: &mut vector<Element>, other: vector<Element>)
```

将另一个向量的所有元素追加到当前向量。

示例：
```move
vector::append(&mut v, other_v);
```

#### 连接嵌套向量

```move
public fun flatten<T>(v: vector<vector<T>>): vector<T>
```
将嵌套向量展平为单个向量。

示例：
```move
let flat = vector::flatten(nested_v);
```

### 销毁操作

#### 销毁空向量
```move
public fun destroy_empty<Element>(v: vector<Element>)
```

销毁一个空向量。如果向量不为空，则中止。

示例：
```move
vector::destroy_empty(v);
```

## 使用示例

以下示例展示了 vector 模块的常见操作：

```move
module example::vector_usage {
    public fun main() {
        // 创建一个空向量
        let mut v = vector::empty<u64>();

        // 添加元素
        vector::push_back(&mut v, 10);
        vector::push_back(&mut v, 20);

        // 查询操作
        let len = vector::length(&v);
        let contains_10 = vector::contains(&v, &10);

        // 修改操作
        vector::swap(&mut v, 0, 1);
        let popped = vector::pop_back(&mut v);

        // 高级操作
        vector::reverse(&mut v);

        // 销毁向量
        vector::destroy_empty(v);
    }
}
```
## 总结

0x1::vector 是一个功能强大的动态数组模块，提供了丰富的操作接口：

- 基础操作：如创建、添加、移除元素。
- 查询操作：如检查长度、索引和元素是否存在。
- 高级操作：如反转、连接和嵌套向量展平。

该库位于0x1中，是Sui Move最根本的功能之一。

但说实在的，对于这种很底层的库，目前而言我们也只需要记住它的接口就行了，甚至记不住也没关系————反正还能查嘛！

活用网络，不要当死板的coder。

不要逼自己去背，没用，多写就记住了。

>（说白了难道我在这里教你，我便全将它记住了吗？不存在的）

**噢，对了，记得通过接口的英文意思去推断它的功能，这往往是对的，标准库的程序员并没有防御性编程的习惯。**

*再不济还有编译器呢（笑）*

已经介绍过了`table`,在下一节，我将进行`vec_map`的介绍，探讨Sui Move中另一种表（不是说只有这两种）的内容和用法。