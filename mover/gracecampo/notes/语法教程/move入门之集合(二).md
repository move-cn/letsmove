# move入门之集合(二) : Vector数据衍生类型VecSet深度分析
**🧑‍💻作者：gracecampo**
## 概述
`VecSet` 是 Move 语言中的一种vector数据类型衍生出的集合类型，可以看作是Vector数据类型变种。

### 特点
- **唯一性**：`VecSet` 不允许重复项，确保集合中的每个元素都是唯一的。
- **操作复杂度**：所有操作的时间复杂度为 O(N)。
- **插入顺序**：元素按照插入顺序存储，而不是排序存储。
- 
## VecSet是什么？
VecSet是元素不可重复的向量集合，VecSet的底层基于Vector进行实现。

因为要确保唯一性，相应的VecSet的所有操作，相比Vector要低效。Vector操作时间复杂度为 O(1)，而VecSet操作的时间复杂度为 O(N)
VecSet 位于`module sui::vec_set`,属于sui官方开发的模块,用于vector无法满足的业务场景。
```move
// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module sui::vec_set;
```
### 定义和语法

VecSet在模块内的定义,继承了Vector特性，是元素可变的数据容器，索引从0开始,不同的是VecSet容器内元素唯一。

例子:
```move
let set = vec_set::empty<u8>(); // 创建一个空集合
let mut set = vec_set::singleton(1); // 创建一个包含单个元素的集合

set.insert(2); // 添加2元素到集合
set.insert(3); // 添加3元素到集合

assert!(set.contains(&1), 0); // 检查集合中是否包含元素
assert!(set.size() == 3, 1); // 获取集合中的元素数量
assert!(!set.is_empty(), 2); // 检查集合是否为空

set.remove(&2); // 从集合中移除元素
```

上面代码展示了如何初始化一个`VecSet`,并使用了insert，contains，size，remove函数进行操作展示。

## VecSet是如何实现的？
```move
public struct VecSet<K: copy + drop> has copy, drop, store {
    contents: vector<K>,
}
```
上述是VecSet的代码定义:

可以看到,VecSet接受泛型类型元素，但是限制了元素必须拥有copy + drop能力。

`VecSet` 中的元素必须具备 `copy` 和 `drop` 能力，这是因为：

1. **Copy 能力**：`copy` 能力允许元素被复制。这对于某些操作是必要的，例如在检查集合中是否存在某个元素时，可能需要复制该元素以进行比较。

2. **Drop 能力**：`drop` 能力允许元素被安全地丢弃。这对于集合的内存管理和资源释放很重要。 当一个元素被从集合中移除时，`drop` 能力确保该元素可以被正确地处理和释放。

这些能力确保了 `VecSet` 的元素在操作时能够被安全地复制和删除，符合 Move 语言的安全性和资源管理要求。

了解move中能力介绍，可参考:[move入门之结构体的四大能力](https://learnblockchain.cn/article/9952)

### 异常码定义
```move
/// This key already exists in the map
const EKeyAlreadyExists: u64 = 0;

/// This key does not exist in the map
const EKeyDoesNotExist: u64 = 1;
```
我们可以看到，VecSet定义了两个常量，分别是：EKeyAlreadyExists用以当添加的元素已经存在时，进行异常提示；

EKeyDoesNotExist用于当元素不存在时，进行异常提示（主要用于元素删除方法）

```move
fun get_idx<K: copy + drop>(self: &VecSet<K>, key: &K): u64 {
    let idx_opt = get_idx_opt(self, key);
    assert!(idx_opt.is_some(), EKeyDoesNotExist);
    idx_opt.destroy_some()
}
```
### 函数定义

`VecSet` 提供了一些函数来操作集合中的元素。以下是一些常用的函数：

1. **创建空集合**：
   ```move
   public fun empty<K: copy, drop>(): vec_set::VecSet<K>
   ```
   创建一个空的 `VecSet`。

2. **创建单元素集合**：
   ```move
   public fun singleton<K: copy, drop>(key: K): vec_set::VecSet<K>
   ```
   创建一个只包含一个元素的 `VecSet`。

3. **插入元素**：
   ```move
   public fun insert<K: copy, drop>(self: &mut vec_set::VecSet<K>, key: K)
   ```
   将一个元素插入集合中。如果元素已存在，则操作会中止。

4. **删除元素**：
   ```move
   public fun remove<K: copy, drop>(self: &mut vec_set::VecSet<K>, key: &K)
   ```
   从集合中移除一个元素。如果元素不存在，则操作会中止。

5. **检查包含**：
   ```move
   public fun contains<K: copy, drop>(self: &vec_set::VecSet<K>, key: &K): bool
   ```
   检查集合中是否包含某个元素。

6. **获取大小**：
   ```move
   public fun size<K: copy, drop>(self: &vec_set::VecSet<K>): u64
   ```
   返回集合中元素的数量。

7. **检查是否为空**：
   ```move
   public fun is_empty<K: copy, drop>(self: &vec_set::VecSet<K>): bool
   ```
   检查集合是否为空。

## VecSet应该如何使用？
上面我们已经列出了`VecSet` 模块日常开发常用到的一些函数，接下来我们将一一实践，增加对`VecSet` 模块函数的理解和使用。

注意: <>向量类型必须是`拥有copy + drop 的类型,否则代码将编译报错`,在接下来的演示中将不在说明。
```move
//初始化一个空向量
let vec = vec_set::empty<u8>();
```

上述代码验证一个向量是否为空，我们声明了vec_set<u8>[]的空向量，使用empty<>()函数进行判断，向量是否为空。

注意：当使用empty()函数时，必须指定数据类型，否则将编译错误。

```move
let _a  =vec_set::singleton(0);//如不使用请忽略它，否则将编译报错
```
VecSet::singleton 函数用于创建一个只包含一个元素的 VecSet。

这个函数接受一个参数 key，并返回一个包含该单个元素的 VecSet。

需要注意的是，当我们使用vec_set::singleton()创建一个VecSet时，如果不使用请使用`_`，忽略这个资源，否则将编译报错。
```move
let mut set = vec_set::empty<u8>(); // 创建一个空的 VecSet
set.insert(1); // 插入元素 1
set.insert(2); // 插入元素 2
```

上述代码通过声明一个空的u8类型vec_set，通过insert()函数进行新增元素，因为我们声明了数据类型是u8,新增的元素必须也是u8类型。

```move
let mut set = vec_set::empty<u8>(); // 创建一个空的 VecSet
set.insert(1); // 插入元素 1
set.insert(2); // 插入元素 2
set.remove(&2); // 移除元素 2
```

上述代码通过声明一个空的u8类型vec_set，通过insert()函数新增元素`1,2`,然后通过函数remove()进行删除。

注意：因为vec_set是不重复的集合，它不向vector可以通过下标进行删除,因为它的key是唯一的，所以删除的话也是通过传入key进行删除。

```move
let mut set = vec_set::empty<u8>(); // 创建一个空的 VecSet
set.insert(1); // 插入元素 1
let _is_contains = set.contains(&1);
```

上述代码通过声明一个空的u8类型vec_set，通过insert()函数新增元素`1`,然后通过contains()函数,输入需要判断的元素,判定vec_set是否存在该元素。

```move
let mut set = vec_set::empty<u8>(); // 创建一个空的 VecSet
set.insert(1); // 插入元素 1
let _size = set.size(); //获取VecSet元素数量
let _size = set.is_empty();//判断VecSet是否为空
```
上述代码通过声明一个空的u8类型vec_set，通过insert()函数新增元素`1`,

然后通过size()函数,获取vec_set的元素数量;

然后通过is_empty()函数,判断vec_set是否为空。

## 总结
Vector 和 VecSet 很相似，它们的函数操作，看起来大部分是相同，比如is_empty()，size()，不同点在于VecSet实际上是对Vector封装实现，
增加了元素的唯一性，限制了元素必须拥有 copy，drop能力，这对于我们在日常开发中，带来了很大的便利。
比如我们需要存入不能重复的数据，如果依靠Vector将带来极大的不安全性，使用VecSet这种结构数据，能使我们可以简便的操作数据，
虽然牺牲了部分性能，但提升了代码安全性。

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove
