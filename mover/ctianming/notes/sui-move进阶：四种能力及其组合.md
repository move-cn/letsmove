# sui-move进阶：四种能力及其组合

在 Sui Move 中，**能力（Abilities）** 是一种类型系统特性，用于约束资源或结构体的行为。能力声明定义了某种类型的可操作性，如存储、复制或丢弃。Sui Move 提供了四种能力：`store`、`key`、`copy` 和 `drop`。本教程将深入解析这四种能力的用途、规则以及它们在智能合约设计中的应用。

---

## 什么是能力？

能力是一种类型属性，用于描述资源或结构体在 Move 中的操作约束。例如：
- 某些类型可以被存储在全局状态中。
- 某些类型可以被复制或丢弃。

Move 的能力系统通过显式声明这些行为限制，确保资源的安全性和操作的合理性。

---

## Sui Move 的四种能力

### `store` 能力

**`store`** 表示一种类型可以存储在全局状态中。例如，区块链上的资源通常需要存储，因此它们需要具备 `store` 能力。

规则：

- 只有具备 `store` 能力的类型，才能存储在全局状态中。

- 使用 `has store` 显式声明。

示例：

```move
module example::StoreExample {
    public struct StorableResource has store {
        id: u64,
        value: u64,
    }

    public fun save_resource(resource: StorableResource) {
        move_to<StorableResource>(@0x1, resource);
    }
}
```

应用场景:

- 代币（Coin）：需要存储到链上的全局状态中。

- 智能合约配置：如参数和状态信息。

### key 能力

key 表示一种类型可以通过唯一标识符存储在全局状态中。带有 key 能力的类型必须具备一个 UID 字段，用于唯一标识该对象。

规则:

- 必须具备 key 能力才能使用 move_to 将资源存储到全局状态。

- 带有 key 能力的类型通常会包含一个 UID 字段。

示例:

```move
module example::KeyExample {
    use sui::object::UID;

    public struct KeyedResource has key {
        id: UID,
        value: u64,
    }

    public fun save_keyed_resource(resource: KeyedResource) {
        move_to<KeyedResource>(@0x1, resource);
    }
}
```

应用场景:

- 唯一资源：如 NFT。

- 账户标识：需要通过 UID 唯一标识的资源。

### copy 能力

copy 表示一种类型的值可以被复制。与资源（如代币）不同，某些数据类型（如整数）需要频繁复制以简化操作，这种情况下需要具备 copy 能力。

规则:

- 默认情况下，基本数据类型（如 u8、bool）具备 copy 能力。

- 使用 has copy 显式声明后，自定义类型也可以支持复制。

示例:

```move
module example::CopyExample {
    public struct CopyableResource has copy {
        value: u64,
    }

    public fun duplicate(resource: CopyableResource): (CopyableResource, CopyableResource) {
        (resource, resource) // 允许复制
    }
}
```

应用场景:

- 临时变量：如配置、计数器。

- 轻量级对象：不需要严格的所有权管理。

###  drop 能力

drop 表示一种类型的值可以被丢弃。某些类型在生命周期结束时必须显式销毁（如资源类型），但带有 drop 能力的类型可以自动丢弃。

规则:

- 默认情况下，基本数据类型（如 u8、bool）具备 drop 能力。

- 自定义类型需通过 has drop 显式声明支持丢弃。

示例:

```move
module example::DropExample {
    public struct DroppableResource has drop {
        value: u64,
    }

    public fun discard(resource: DroppableResource) {
        // 自动丢弃，无需显式销毁
    }
}
```

应用场景:

- 临时数据：如日志信息。

- 非关键性资源：无需严格管理生命周期的类型。

## 能力的组合

能力可以组合使用，以满足不同场景的需求。例如：

```move
module example::CombinedAbilities {
    use sui::object::UID;

    /// 具备 key 和 store 能力的资源
    public struct ManagedResource has key, store {
        id: UID,
        value: u64,
    }
}
```

- key, store：该资源可以通过唯一标识符存储到链上的全局状态中。

- 一般而言key 与store 的组合是最常见的，而copy 和drop 可以根据需要进行组合。

## 能力的约束与推导

在使用泛型和结构体时，能力可以被约束或推导：

能力约束： 使用泛型类型时，可以指定能力约束：

```move
public fun example<T: store>(resource: T) {
    move_to<T>(@0x1, resource);
}
```

能力推导： 类型的能力可以根据其字段的能力自动推导。例如：

```move
public struct DerivedResource<T> {
    value: T,
}
```

如果 T 具备 store 能力，则 `DerivedResource<T>` 也具备 store 能力。

## 实践：设计具备能力的智能合约
代币实现示例
结合以上能力设计一个基本的代币结构：

```move
module example::Token {
    use sui::object::UID;

    /// 定义代币资源
    public struct Token has key, store {
        id: UID,
        balance: u64,
    }

    /// 创建新代币
    public fun mint(id: UID, amount: u64): Token {
        Token { id, balance: amount }
    }

    /// 销毁代币
    public fun burn(token: Token) {
        token.id.delete(); // 显式销毁 UID
    }
}
```
6. 总结

- 能力的选择：
    - 根据类型的用途合理选择能力，避免不必要的能力传播。

- 能力的限制：
    - 利用能力限制类型行为，例如禁止复制或丢弃关键资源。

- 结合类型系统设计：
    - 使用能力约束设计泛型函数，提升代码的灵活性和安全性。

Sui Move目前的四种能力已经足够为目前实践中的项目提供便利和保障。而目前sui move 并不允许开发者自定义能力以满足一些额外的需求。

当然，肯定有学过rust的朋友联想起了trait，并疑惑：

为什么sui move 不允许自定义能力呢？

答：为了安全。在区块链的世界里，再怎么谨慎也不为过了。

但也不必灰心，据内部消息，Sui 官方正有允许自定义能力的计划，或许就在明年也说不定。




