# sui-move进阶：时间与纪元

在 Sui 框架中，时间是智能合约中常用的元素，用于管理操作期（纪元）和获取精确的时间戳。Sui 提供了两种主要的时间机制：**纪元（Epoch）** 和 **时间（Time）**，它们在质押、验证人集合管理和其他操作中起着重要作用。

---

## 纪元（Epoch)

###  什么是纪元？
纪元表示 Sui 系统中的一个操作期，通常大约每 24 小时更改一次。在一个纪元期间：
- 验证人集合是固定的。
- 纪元边界可能会发生验证人集合的变化。

纪元在 Sui 的共识算法和质押逻辑中至关重要。




###  获取当前纪元

可以通过事务上下文（`TxContext`）读取当前纪元：
```move
public fun current_epoch(ctx: &TxContext) {
    let epoch = ctx.epoch();
    // 使用 epoch 执行逻辑
}
```
### 获取纪元开始时间
纪元开始的 Unix 时间戳（毫秒）也可以通过上下文获取：

```move
public fun current_epoch_start(ctx: &TxContext) {
    let epoch_start = ctx.epoch_timestamp_ms();
    // 使用 epoch_start 执行逻辑
}
```
### 使用场景
 - 质押逻辑：纪元用于管理验证人集合和质押解锁时间。
 - 周期管理：在某些场景中，可以利用纪元模拟固定的 24 小时周期。
## 时间（Time）

### Clock 对象

为了精确测量时间，Sui 提供了 Clock 对象，它记录自 Unix 纪元以来的时间（以毫秒为单位）。Clock 是 Sui 的一个系统对象，在共识提交计划期间由系统更新。

Clock 的结构
```move
struct Clock has key {
    id: UID,
    /// 自 Unix 纪元以来的时间戳（以毫秒为单位）
    timestamp_ms: u64,
}
```
- Clock 对象的地址是固定的，为 0x6。
- Clock 是一个 共享对象，只能通过 不可变引用 访问。

### 获取当前时间
通过 sui::clock::timestamp_ms 获取当前时间：

```move
use sui::clock::Clock;

public fun current_time(clock: &Clock) {
    let time = clock.timestamp_ms();
    // 使用 time 执行逻辑
}
```
示例
```move

use sui::clock::Clock;

public fun log_current_time(clock: &Clock) {
    let time = clock.timestamp_ms();
    debug::print(&time);
}
```
### 访问限制

限制说明

Clock 是一个共享对象，试图以可变方式访问它的事务将失败。
只能通过不可变引用访问 Clock，以确保并行访问的性能。
验证人约束

如果试图以值的形式或可变引用方式传递 Clock：

- 验证人将拒绝签署或执行该事务。

## 纪元与时间的区别
| 特性       | 纪元（Epoch）                   | 时间（Time）                       |
|------------|---------------------------------|------------------------------------|
| 定义       | 表示系统的操作期，每 24 小时更改 | 自 Unix 纪元以来的时间戳（毫秒）   |
| 主要用途   | 管理验证人集合、质押周期         | 精确时间测量                       |
| 数据来源   | TxContext                       | Clock 对象                         |
| 访问方式   | 上下文直接提供                   | 通过共享对象访问                   |

## 使用场景示例

以下是使用纪元和时间的典型场景。

#### 质押周期管理

通过纪元检查某些操作是否已过 24 小时周期：

```move

public fun is_next_epoch(ctx: &TxContext, last_epoch: u64): bool {
    let current = ctx.epoch();
    current > last_epoch
}
```

#### 记录当前时间

通过 Clock 对象记录某操作的精确时间：

```move

use sui::clock::Clock;

public fun record_time(clock: &Clock) {
    let time = clock.timestamp_ms();
    debug::print(&time);
}
```

#### 模拟周期任务

利用纪元和时间戳实现简单的周期性操作：

```move

public fun perform_task_if_due(ctx: &TxContext, last_epoch: u64, clock: &Clock) {
    let current_epoch = ctx.epoch();
    if (current_epoch > last_epoch) {
        let current_time = clock.timestamp_ms();
        debug::print(&current_time);
        // 执行周期任务
    }
}
```

## 注意事项

- 共享对象的访问限制：

    - Clock 对象只能通过不可变引用访问。
    - 避免尝试对 Clock 执行修改操作。

- 纪元的固定性：

    - 在单个纪元内，验证人集合保持固定。
    - 使用纪元边界来管理重要的状态转换，例如更新质押信息。

- 时间精度：

    - Clock 提供毫秒级别的时间精度，非常适合需要精确时间控制的应用场景。

## 总结
Sui Move 的时间机制通过 纪元（Epoch） 和 Clock 对象（Time） 提供灵活的时间管理方式：

- 纪元适用于周期性任务和验证人集合的管理。
- Clock 提供精确的毫秒级时间戳，用于精细时间操作。
