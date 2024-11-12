# （三）使用 Move 在 Sui 上发行 Coin 快速上手

---
## 0. 在开始之前
本系列文章将深入浅出的全面讲解Move语言，第一篇文章主要介绍背景知识和基本的环境搭建，很多知识点将在后续文章中逐一解释。 
   
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH.png)

本篇文章介绍如何使用 Move 语言在 Sui 上编写简单的代币合约，主要分为两个部分：

- **创建代币**：通过 `coin` 模块，利用一次性见证（one-time witness）和 `create_currency` 函数来发行一种新的代币。
- **实现铸币功能**：使用 `coin` 模块的 `mint` 函数来铸造代币，并分发给用户。

文章将详细讲解实现代币合约的具体步骤以及铸币控制权的配置。

## 定义 Witness

对于初学者来说，`Witness` 是 Move 中一个较为特殊的概念。`Witness` 是一种标记为 `drop` 的一次性资源。其作用是在使用后自动销毁，确保相关资源只被使用一次，防止重复创建同一资源的多个实例。这在代币合约中用于确保代币种类的唯一性和操作的正确性。

```move
struct demo has drop {}
```

### Witness 的功能和重要性

- **一次性使用**：`drop` 特性确保 Witness 使用后自动销毁，从而保证每次代币创建操作的独立性和安全性。
- **类型安全和权限验证**：Witness 的存在有效验证了调用者是否有权限执行特定操作（如代币创建），从而确保合约按预期执行。

### 初始化代币合约

#### 函数定义

为确保代币种类的唯一性和正确的初始化过程，我们定义了一个 `init` 构造函数，接收以下两个参数：

- `witness`：一次性证明，用于验证代币的唯一性和创建者的权限。
- `ctx`：交易上下文，用于处理交易状态和信息。

```move
fun init(witness: MY_COIN, ctx: &mut TxContext) {}
```

#### 创建代币和铸币权转移

在 `init` 函数中，我们将实现代币的创建和铸币权限的转移。

```move
let (treasury, metadata) = coin::create_currency(witness, 6, b"HackQuest", b"WEB3", b"My_token", option::none(), ctx);        
// 冻结 metadata 对象，阻止后续的修改
transfer::public_freeze_object(metadata);
// 将铸币权限转移到合约部署者
transfer::public_transfer(treasury, tx_context::sender(ctx));
// 共享铸币权限（用于水龙头模式，允许任何用户铸币）
transfer::public_share_object(treasury);
```

**注**：`create_currency` 函数参数解释：

- `witness`：一次性证明，用于确认铸币操作的合法性。
- `decimals`：代币的小数位数。
- `symbol`：代币的符号。
- `name`：代币的名称。
- `description`：代币的描述信息。
- `icon_url`：代币的图标 URL（可选）。
- `ctx`：交易上下文，包含发起者身份、交易时间等信息。

### 编写铸币函数

以下为铸币函数 `mint_in_my_module` 的实现，它用于铸造代币并转移给指定用户。

```move
public fun mint_in_my_module(
    treasury_cap: &mut TreasuryCap<MY_COIN>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext
) {
    let coin = coin::mint(treasury_cap, amount, ctx);
    transfer::public_transfer(coin, recipient);
}
```

### 完整代码示例

```move
/*
/// Module: mycoin
module mycoin::mycoin;
*/
module mycoin::my_coin {
    use sui::coin::{Self, TreasuryCap};

    // Witness 是一种标记为 drop 的一次性使用资源。
    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"mycoin", b"my coin", b"My_token", option::none(), ctx);
        // 冻结 metadata 对象，阻止后续修改
        transfer::public_freeze_object(metadata);
        // 将铸币权限转移给合约部署者
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<MY_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}
```

### 合约交互指南

#### 编译项目

在项目路径下执行以下命令编译项目：

```bash
sui move build
```

#### 部署合约

使用以下命令将合约部署到 Sui 区块链：

```bash
sui client publish
```

打开 Sui Explorer，输入 Transaction Digest，找到部署的交易记录。在 `changes` 选项卡中，找到 `package id` 和 `TreasuryCap` 对象 ID（状态为 `published`，对象 ID 以 `cap` 结尾）。

#### 铸币操作

执行以下命令进行铸币：

```bash
sui client call --package 包ID --module my_coin \
--function mint_in_my_module --args 铸币对象ID 数量 接收者地址 \
--gas-budget 10000000
```

**示例**：

```bash
sui client call --package 0xe0ac81bc9b10c46dcfbc9ca6ee092ee2018aa81f97945e \
--module my_coin --function mint_in_my_module \
--args 0xd34384d3fae7101148c6b408b3d426f810f8a2ef46db959ed 100 \
0x43d945f82670c017d1989a8580f6649c4c0b7aa54e44 \
--gas-budget 10000000
```

这样，您就完成了代币的发行和铸造。是不是很简单？快去试试看吧！