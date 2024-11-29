# （九）Move语言中的能力（Ability）

本周在直播课和视频课上学习了Move语言中对象的四种能力，在答疑过程中也向U具体请教了key和store的区别，下面是记录的一些理解。
## 能力 (Ability) 是什么？

在 Move 语言中，**能力（Abilities）** 是一种非常独特的概念。简单来说，它决定了一个类型的实例可以做哪些事情，比如是否能被复制、删除、存储到区块链上，或者在全局中找到它。能力的存在，就像是给类型戴上了一个“行为标签”，让我们能够更安全、更高效地开发智能合约。

有趣的是，能力不是后天赋予的，而是在**定义结构体时就声明好**了。这些能力会一直跟随着这个结构体的实例，甚至某些非结构体的类型（比如元组、枚举）也可以拥有能力，只要它们被指定了支持这些能力。

比如，我们可以用 `has` 关键字给类型添加能力，代码看起来像这样：

```move
struct MyStruct has copy, drop {
    field1: u64,
    field2: bool,
}
```

⚠️ 注意：
- Move 中的内置类型（比如 u8、bool）默认拥有 copy、drop 和 store 三种能力。
- 引用类型（比如 &T 和 &mut T）只有 copy 和 drop，没有 store。

### Move 的四种能力

Move 语言为我们提供了四种能力，每一种都赋予类型不同的权限和功能。

1. **copy**
   - 作用：允许复制类型的实例。
   - 应用场景：需要明确哪些类型可以被复制（比如普通数据类型），哪些类型不能被复制（比如代币或资源）。
   - 限制：为了避免滥用，比如“复印”代币，像 Coin 这样的资源默认不能有 copy 能力。
   - 示例：

     ```move
     struct CopyableStruct has copy {
         value: u64,
     }

     fun main() {
         let s1 = CopyableStruct { value: 42 };
         let s2 = s1;  // 允许复制
     }
     ```

2. **drop**
   - 作用：允许删除类型的实例。
   - 应用场景：当类型的实例不再需要时，系统会自动“销毁”它，而不需要我们手动清理。
   - 示例：

     ```move
     struct DroppableStruct has drop {
         value: u64,
     }

     fun main() {
         let s = DroppableStruct { value: 42 };
         // 离开作用域后，`s` 会被自动销毁
     }
     ```

3. **store**
   - 作用：允许将类型的实例存储在全局存储中。
   - 应用场景：共享数据或需要在链上持久化的信息，比如某个配置项、链上状态等。
   - 特点：
     - store 能力允许类型实例作为全局存储中的对象，或者嵌套在其他结构体中。
     - 但没有唯一标识，无法通过全局 ID 查找。
   - 示例：

     ```move
     struct MyStoreStruct has store {
         value: u64,
     }

     module Example {
         fun store_example() {
             let obj = MyStoreStruct { value: 42 };
             // 允许作为另一个对象的字段嵌套存储
             let container = Container { field: obj };
         }
     }

     struct Container has store {
         field: MyStoreStruct,
     }
     ```

4. **key**
   - 作用：允许类型的实例拥有全局唯一标识，并能通过这个 ID 存储或查询。
   - 应用场景：适合需要跨交易标识的资源（比如 NFT、账户等）。
   - 特点：
     - 具有唯一性，允许从全局存储中直接查找实例。
     - 依赖 store，因为只有能存储的东西，才能有唯一标识。
   - 示例：

     ```move
     struct KeyStruct has key {
         id: u64,
     }

     module Example {
         fun use_key() {
             let k = KeyStruct { id: 1 };
             // 利用全局唯一 ID 存储和查找
         }
     }
     ```

### key 和 store 的区别

key 和 store 都与全局存储有关，但它们的侧重点不同，可以简单理解为：
- store 是一个基础能力，表示“能存储”。
- key 是一个更高级的能力，表示“能存储并且能查找”。

#### 区别对比

| 特性       | key   | store |
|------------|-------|-------|
| 全局唯一性 | 是，实例需要有全局唯一 ID | 否，不要求全局唯一 |
| 主要功能   | 用于全局存储和查找实例 | 用于允许实例在全局存储中持久化 |
| 模块交互   | 必须与资源模块（如 move_to）配合使用 | 仅需 store 能力即可持久化实例 |
| 嵌套字段存储 | 无法作为其他结构体的嵌套字段 | 可以作为其他结构体的嵌套字段 |
| 典型场景   | 跨交易可标识的资源（如 NFT、账户等） | 持久化的辅助信息、嵌套的复杂数据结构 |

#### 关系

- key 必须依赖 store，没有 store 的类型不能拥有 key。
- 如果一个结构体即要存储，又需要全局唯一标识，就需要同时拥有 key 和 store。

例如：

```move
struct MyStruct has key, store {
    id: u64,
}
```

### 总结

Move 中的能力 (Abilities) 是类型操作权限的核心机制。通过 copy、drop、store 和 key，我们可以明确类型实例在内存管理、全局存储等方面的行为。这不仅让代码更安全，也让我们更容易避免错误，比如“复制代币”或“资源泄漏”。

合理使用这些能力，可以让智能合约的开发更加清晰高效！
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)