# sui-move进阶：coin.move源码分析

`coin.move` 是 Sui Move 中实现可替代代币（fungible tokens）的核心模块（实际上，因为sui"一切皆对象"和所有权的设计，也自然而然地可以用来实现NFT）。它提供了创建、管理和操作代币的基础工具，包括代币的生成、分割、合并、供应量管理以及监管功能。

在本教程中，我将部分解析 `coin.move` 的设计与功能。

---

## 模块概述

`coin.move` 旨在提供一套通用的代币操作接口，并支持高级功能如：
- 代币分割与合并
- 总供应量管理
- 元数据存储与更新
- 受监管的代币功能（如地址限制、全局暂停）

---

## 核心结构体

### Coin
`Coin` 是代币的核心结构，用于表示某种类型 `T` 的代币及其余额。

```move
public struct Coin<phantom T> has key, store {
    id: UID,
    balance: Balance<T>,
}
```

字段解析:

- id: 每个 Coin 实例的唯一标识符。
- balance: 表示代币的余额，使用 Balance<T> 类型。
功能解析
- phantom T 确保 Coin<T> 类型之间互不干扰。
- key, store 能力允许 Coin 存储在全局状态中。

### CoinMetadata

`CoinMetadata` 用于存储代币的元数据信息，如名称、符号、小数位数等。

```move
public struct CoinMetadata<phantom T> has key, store {
    id: UID,
    decimals: u8,
    name: string::String,
    symbol: ascii::String,
    description: string::String,
    icon_url: Option<Url>,
}
```

字段解析:

- decimals: 小数位数，用于显示格式化的代币余额。
- name: 代币的名称，如 "US Dollar"。
- symbol: 代币符号，如 "USD"。
- description: 对代币的描述。
- icon_url: 可选的图标 URL。

### TreasuryCap

`TreasuryCap` 用于管理代币的总供应量。

```move
public struct TreasuryCap<phantom T> has key, store {
    id: UID,
    total_supply: Supply<T>,
}
```

功能解析:

- 提供安全的供应量管理。
- 确保某种类型的代币只能由其唯一的 TreasuryCap 控制。

### DenyCapV2

`DenyCapV2` 为受监管代币提供高级功能，如地址限制和全局暂停。

```move
public struct DenyCapV2<phantom T> has key, store {
    id: UID,
    allow_global_pause: bool,
}
```

功能解析:

- allow_global_pause: 允许启用全局暂停，禁止所有地址操作该代币。

## 核心功能解析

### 基础代币操作

#### 查询余额

通过 value 获取 Coin 的余额：

```move
public fun value<T>(self: &Coin<T>): u64 {
    self.balance.value()
}
```

#### 分割代币

将一个代币分割为两部分：

```move
public fun split<T>(self: &mut Coin<T>, split_amount: u64, ctx: &mut TxContext): Coin<T> {
    take(&mut self.balance, split_amount, ctx)
}
```

#### 合并代币

将两个代币合并：

```move
public entry fun join<T>(self: &mut Coin<T>, c: Coin<T>) {
    let Coin { id, balance } = c;
    id.delete();
    self.balance.join(balance);
}
```

#### 生成零余额代币

创建一个余额为 0 的占位代币：

```move
public fun zero<T>(ctx: &mut TxContext): Coin<T> {
    Coin { id: object::new(ctx), balance: balance::zero() }
}
```
### 总供应量管理

#### 查询总供应量

```move
public fun total_supply<T>(cap: &TreasuryCap<T>): u64 {
    balance::supply_value(&cap.total_supply)
}
```

#### 铸造代币

通过 TreasuryCap 创建新的代币：

```move
public fun mint<T>(cap: &mut TreasuryCap<T>, value: u64, ctx: &mut TxContext): Coin<T> {
    Coin {
        id: object::new(ctx),
        balance: cap.total_supply.increase_supply(value),
    }
}
```

#### 销毁代币

减少代币的总供应量：

```move
public entry fun burn<T>(cap: &mut TreasuryCap<T>, c: Coin<T>): u64 {
    let Coin { id, balance } = c;
    id.delete();
    cap.total_supply.decrease_supply(balance)
}
```
### 监管代币

#### 地址限制

添加地址到禁止列表：

```move
public fun deny_list_v2_add<T>(
    deny_list: &mut DenyList,
    _deny_cap: &mut DenyCapV2<T>,
    addr: address,
    ctx: &mut TxContext,
) {
    let ty = type_name::get_with_original_ids<T>().into_string().into_bytes();
    deny_list.v2_add(DENY_LIST_COIN_INDEX, ty, addr, ctx)
}
```

#### 启用全局暂停

立即禁止所有地址使用代币：

```move
public fun deny_list_v2_enable_global_pause<T>(
    deny_list: &mut DenyList,
    deny_cap: &mut DenyCapV2<T>,
    ctx: &mut TxContext,
) {
    assert!(deny_cap.allow_global_pause, EGlobalPauseNotAllowed);
    let ty = type_name::get_with_original_ids<T>().into_string().into_bytes();
    deny_list.v2_enable_global_pause(DENY_LIST_COIN_INDEX, ty, ctx)
}
```

### 元数据管理

#### 更新元数据

支持动态更新代币的元数据：

```move
public entry fun update_name<T>(
    _treasury: &TreasuryCap<T>,
    metadata: &mut CoinMetadata<T>,
    name: string::String,
) {
    metadata.name = name;
}
```

## 示例：创建和管理代币

```move
public fun create_currency<T: drop>(
    witness: T,
    decimals: u8,
    symbol: vector<u8>,
    name: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (TreasuryCap<T>, CoinMetadata<T>) {
    (
        TreasuryCap {
            id: object::new(ctx),
            total_supply: balance::create_supply(witness),
        },
        CoinMetadata {
            id: object::new(ctx),
            decimals,
            name: string::utf8(name),
            symbol: ascii::string(symbol),
            description: string::utf8(description),
            icon_url,
        },
    )
}
```

注意这个`witness`，这里使用了`一次性见证者`的设计模式，我将在下一篇教程中进行讲述与探讨。

而我们同样可以创建被管理的代币：

```move
public fun create_regulated_currency_v2<T: drop>(
    witness: T,
    decimals: u8,
    symbol: vector<u8>,
    name: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    allow_global_pause: bool,
    ctx: &mut TxContext,
): (TreasuryCap<T>, DenyCapV2<T>, CoinMetadata<T>) {
    let (treasury_cap, metadata) = create_currency(
        witness,
        decimals,
        symbol,
        name,
        description,
        icon_url,
        ctx,
    );
    let deny_cap = DenyCapV2 {
        id: object::new(ctx),
        allow_global_pause,
    };
    transfer::freeze_object(RegulatedCoinMetadata<T> {
        id: object::new(ctx),
        coin_metadata_object: object::id(&metadata),
        deny_cap_object: object::id(&deny_cap),
    });
    (treasury_cap, deny_cap, metadata)
}
```

源代码对其的解释是：

>通过调用 `create_currency` 创建一种新的货币类型，并附加了一项额外功能，
>
>允许将特定地址的代币冻结。当一个地址被添加到禁止列表时，
它将立即无法将该货币的代币用作交易的输入对象。
>
>此外，从下一个纪元开始，这些地址将无法接收该货币的代币。
`allow_global_pause` 标志启用了一个额外的 API，可禁止所有地址操作该货币的代币。
>
>需要注意的是，这不会影响禁止列表中针对单个地址的条目，
也不会更改 "contains" API 的返回结果。

另外，如果需要使用上述代币管理的相关功能，在创建代币时，我们必须调用`create_regulated_currency_v2`创建可被管理的代币。

## 总结

Coin是sui链的基本资产，因此，理解和使用Coin也是sui move学习最重要的一部分。

还有一些额外的功能与特性我在本篇文章没有提到，希望大家主动去阅读源码，甚至编写用例进行调试。