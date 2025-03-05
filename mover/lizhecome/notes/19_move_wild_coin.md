（十九）WILD Coin 模块设计与实现解析

今天我们来全新设计一个代币系统，实现功能如下：

## 一、模块功能概述

该模块实现了一个叫 WILD_COIN 的代币系统，支持以下功能：

1. 创建和管理代币的发行和流通（init, mint_wild, increase_unfrozen_supply, decrease_unfrozen_supply 等）。
2. 提供代币与SUI之间的互换功能（swap_wild_coin_for_sui）。
3. 管理奖励池（claim_reward_from_lending_platform, deposit_sui_coin_to_reward, withdraw_sui_from_reward 等）。
4. 集成去中心化借贷平台，支持存取 SUI（deposit_sui_to_lending_platform, withdraw_sui_from_lending_platform）。
5. 支持捐赠池管理以及空投功能（distribute_airdrop）。

## 二、主要数据结构

模块定义了几种关键的数据结构，具体代码示例如下：

### 1. WILD_COIN

用于定义代币的基本属性和能力。

```rust
module WildCoin {
    struct WILD_COIN has key, store, drop {}
}
```

### 2. Wild_Supply

追踪代币的供应状态。

```rust
module WildCoin {
    struct Wild_Supply has key, store {
        // 当前解冻的代币供应量
        current_unfrozen_supply: u64,
        // 已流通的供应量
        circulating_supply: u64,
    }
}
```

### 3. WildVault

存储代币和奖励池的余额，支持奖励和捐赠管理。

```rust
public struct WildVault has key {
    id: UID,
    sui_balance: Balance<SUI>, // Use Balance type to store SUI
    wild_coin_balance: Balance<WILD_COIN>, // Use Balance type to store WILD_COIN
    reward_sui_blance: Balance<SUI>,
    donation_balance: Balance<SUI>, // Use Balance type to store SUI donations
    account_cap: AccountCap,
    sui_index: u8,
    usdc_index: u8,
}
```

### 4. WILD_COIN_AdminCap

定义管理员权限，确保只有授权用户可以执行敏感操作。

```rust
public struct WILD_COIN_AdminCap has key {
    id: UID,
}
```

这些数据结构协同工作，形成一个完整的代币管理系统。例如，Wild_Supply 记录了解冻和流通供应状态，WildVault 管理金库余额，而 WILD_COIN_AdminCap 则提供权限管理。

# 三、主要函数解析

以下是主要函数的功能解析及对应代码示例：

## 1. 初始化（init）

创建代币的 treasury_cap，并初始化供应池、金库和管理员权限。

```rust
fun init(witness: WILD_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
        witness,
        9,
        b"WILD",
        b"wild coin",
        b"wild coin",
        option::none(),
        ctx,
    );
    let vault = WildVault {
        id: object::new(ctx),
        sui_balance: balance::zero<SUI>(),
        wild_coin_balance: balance::zero<WILD_COIN>(),
        reward_sui_blance: balance::zero<SUI>(),
        donation_balance: balance::zero<SUI>(),
        account_cap: lending::create_account(ctx),
        sui_index: 0,
        usdc_index: 1,
    };
    let supply = Wild_Supply {
        id: object::new(ctx),
        current_unfrozen_supply: 0,
        circulating_supply: 0,
    };
    let admincap = WILD_COIN_AdminCap { id: object::new(ctx) };
    share_object(supply);
    share_object(vault);
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury);
    transfer::transfer(admincap, ctx.sender());
}
```

## 2. 增加和减少解冻供应量（increase_unfrozen_supply 和 decrease_unfrozen_supply）

确保供应量变化的安全性。

### 增加供应量

```rust
public fun increase_unfrozen_supply(_: &WILD_COIN_AdminCap, supply: &mut Wild_Supply, amount: u64) {
    assert!(
        supply.current_unfrozen_supply + amount <= TOTAL_SUPPLY,
        ERR_CANNOT_INCREASE_UNFROZEN_SUPPLY_BEYOND_TOTAL_SUPPLY,
    );
    supply.current_unfrozen_supply += amount;
}
```

### 减少供应量

```rust
public fun decrease_unfrozen_supply(_: &WILD_COIN_AdminCap, supply: &mut Wild_Supply, amount: u64) {
    assert!(
        supply.current_unfrozen_supply >= amount,
        ERR_CANNOT_DECREASE_UNFROZEN_SUPPLY_BELOW_ZERO,
    );
    supply.current_unfrozen_supply -= amount;
}
```

## 3. 代币铸造（mint_wild）

用户使用 SUI 购买 WILD_COIN。

```rust
public fun mint_wild(
    treasury_cap: &mut TreasuryCap<WILD_COIN>,
    bank: &mut WildVault,
    supply: &mut Wild_Supply,
    inputcoin: Coin<SUI>,
    recipient: address,
    ctx: &mut TxContext,
) {
    assert!(
        supply.current_unfrozen_supply <= TOTAL_SUPPLY,
        ERR_CANNOT_UNFREEZE_BEYOND_TOTAL_SUPPLY,
    );
    let balance_dewrap = coin::into_balance(inputcoin);
    assert!(
        supply.circulating_supply + balance::value(&balance_dewrap) <= supply.current_unfrozen_supply,
        ERR_PURCHASE_AMOUNT_EXCEEDS_UNFROZEN_SUPPLY,
    );
    let coin = coin::mint(treasury_cap, balance::value(&balance_dewrap), ctx);
    supply.circulating_supply += balance::value(&balance_dewrap);
    bank.sui_balance.join(balance_dewrap);
    transfer::public_transfer(coin, recipient);
}
```

## 4. 代币与 SUI 的互换（swap_wild_coin_for_sui）

实现代币和 SUI 的互换。

```rust
public fun swap_wild_coin_for_sui(
    treasury_cap: &mut TreasuryCap<WILD_COIN>,
    supply: &mut Wild_Supply,
    vault: &mut WildVault,
    wild_coin: Coin<WILD_COIN>,
    recipient: address,
    ctx: &mut TxContext,
) {
    let amount = coin::value(&wild_coin);
    assert!(supply.circulating_supply >= amount, ERR_CANNOT_SWAP_MORE_THAN_CIRCULATING_SUPPLY);
    burn_wild_coin(treasury_cap, supply, wild_coin);
    let sui_coin = withdraw_sui_from_vault(vault, amount, ctx);
    transfer::public_transfer(sui_coin, recipient);
}
```

## 5. 奖励池管理（deposit_sui_coin_to_reward 和 withdraw_sui_from_reward）

管理奖励池的存取操作。

### 存入 SUI 到奖励池

```rust
public fun deposit_sui_coin_to_reward(vault: &mut WildVault, amount: u64) {
    assert!(amount > 0, "Amount must be positive");
    vault.reward_sui_balance += amount;
}
```

### 从奖励池提取 SUI

```rust
public fun withdraw_sui_from_reward(vault: &mut WildVault, amount: u64) {
    assert!(vault.reward_sui_balance >= amount, "Insufficient reward balance");
    vault.reward_sui_balance -= amount;
}
```

## 6. 借贷平台集成（deposit_sui_to_lending_platform 和 withdraw_sui_from_lending_platform）

与去中心化借贷平台的集成操作。

### 从借贷平台提取 SUI

```rust
public(package) fun withdraw_sui_from_lending_platform(
    vault: &mut WildVault,
    sui_withdraw_amount: u64,
    storage: &mut Storage,
    pool_sui: &mut Pool<SUI>,
    inc_v1: &mut IncentiveV1,
    inc_v2: &mut Incentive,
    clock: &Clock,
    oracle: &PriceOracle,
    ctx: &mut TxContext,
) {
    let withdrawn_balance = lending_core::incentive_v2::withdraw_with_account_cap(
        clock, oracle, storage, pool_sui, vault.sui_index, sui_withdraw_amount, inc_v1, inc_v2, &vault.account_cap
    );
    let withdrawn_coin = coin::from_balance(withdrawn_balance, ctx);
    deposit_sui_to_vault(vault, withdrawn_coin);
}
```

### 将 SUI 存入借贷平台

```rust
public(package) fun deposit_sui_to_lending_platform(
    clock: &Clock,
    storage: &mut Storage,
    pool_a: &mut Pool<SUI>,
    vault: &WildVault,
    deposit_coin: Coin<SUI>,
    inc_v1: &mut IncentiveV1,
    inc_v2: &mut Incentive,
) {
    lending_core::incentive_v2::deposit_with_account_cap<SUI>(clock, storage, pool_a, vault.sui_index, deposit_coin, inc_v1, inc_v2, &vault.account_cap);
}
```

### 从借贷平台领取奖励

```rust
public fun claim_reward_from_lending_platform(
    _: &WILD_COIN_AdminCap,
    clock: &Clock,
    storage: &mut Storage,
    pool_sui: &mut IncentiveFundsPool<SUI>,
    vault: &mut WildVault,
    inc_v2: &mut Incentive,
    ctx: &mut TxContext,
) {
    let reward_balance = lending_core::incentive_v2::claim_reward_with_account_cap<SUI>(
        clock, 
        inc_v2, 
        pool_sui, 
        storage, 
        vault.sui_index, 
        0, 
        &vault.account_cap
    );
    let reward_coin = coin::from_balance(reward_balance, ctx);
    deposit_reward_sui_to_vault(vault, reward_coin);
}
```

7. 空投功能（distribute_airdrop）

向 NFT 持有者分发奖励。
```rust
ppublic(package) fun distribute_airdrop(
    airdrop_table: &LinkedTable<ID, u64>,
    vault: &mut WildVault,
    ctx: &mut TxContext
) {
    // Calculate the total amount of SUI to be distributed
    let total_reward = vault.reward_sui_blance.value();
    // Calculate the donation amount (20% of total reward)
    let donation_amount = total_reward * 20 / 100;

    // Calculate the remaining amount for distribution (80% of total reward)
    let distribution_amount = total_reward - donation_amount;

    // Withdraw the donation amount from the vault and add it to the donation balance
    let donation_coin = withdraw_sui_from_vault_reward(vault, donation_amount, ctx);
    balance::join(&mut vault.donation_balance, coin::into_balance(donation_coin));

    // Withdraw the remaining reward amount from the vault and add it to the sui_balance
    let remaining_reward_coin = withdraw_sui_from_vault_reward(vault, distribution_amount, ctx);
    balance::join(&mut vault.sui_balance, coin::into_balance(remaining_reward_coin));

    // Update the total reward to reflect the remaining amount for distribution
    let total_reward = distribution_amount;

    // Iterate over the airdrop table to distribute the SUI
    let mut front_item = linked_table::front(airdrop_table);
    while (option::is_some(front_item)) {
        let nft_id = option::borrow(front_item);
        let reward_ratio = linked_table::borrow(airdrop_table, *nft_id);
        let reward_amount = (total_reward * *reward_ratio) / 1_000_000_000;

        // Ensure the reward amount is greater than zero
        if (reward_amount > 0) {
            // Withdraw the reward amount from the vault
            let reward_coin = withdraw_sui_from_vault(vault, reward_amount, ctx);

            // Transfer the reward coin to the NFT's address
            let nft_address = nft_id.to_address();
            transfer::public_transfer(reward_coin, nft_address);
        };

        front_item = linked_table::next(airdrop_table, *nft_id);
    }
}
```

# 四、关键实现要点

## 1. 安全性

安全性是设计链上代币系统的核心，以下是模块实现安全性的具体措施：

- **前提条件检查**：
  - 使用 `assert!` 确保所有操作的前提条件满足，以避免逻辑错误或恶意操作。例如：
    - 供应量检查：防止解冻供应量超出最大供应量。
    - 余额检查：在提取或交换代币时，确保金额不超过余额或流通供应量。
    - 空值检查：操作对象（如金库或管理员权限）必须有效。
  
  **示例代码**：
  ```rust
  public fun increase_unfrozen_supply(admin_cap: &WILD_COIN_AdminCap, supply: &mut Wild_Supply, amount: u64) {
      assert!(admin_cap.active, "AdminCap is not active");
      assert!(supply.current_unfrozen_supply + amount <= supply.circulating_supply, 
          "ERR_CANNOT_INCREASE_UNFROZEN_SUPPLY_BEYOND_TOTAL_SUPPLY");
  }
  ```

- **错误码设计**：
  - 模块定义了一组错误码以提高代码的可读性和可维护性。这些错误码通过错误信息清晰地描述了违反的条件或操作失败的原因，例如：
    - `ERR_INSUFFICIENT_BALANCE`: 表示余额不足。
    - `ERR_INVALID_SWAP_AMOUNT`: 表示交换金额无效。
  
  **示例代码**：
  ```rust
  public fun swap_wild_coin_for_sui(vault: &mut WildVault, amount: u64) {
      assert!(vault.wild_coin_balance >= amount, "ERR_INSUFFICIENT_WILD_COIN_BALANCE");
      assert!(vault.sui_balance >= amount, "ERR_INSUFFICIENT_SUI_BALANCE");
  }
  ```

## 2. 对象共享与权限管理

Sui Move 提供了丰富的对象管理机制，模块通过这些机制实现了代币和金库的共享与权限管理。

- **共享对象权限 (share_object)**：
  - 将代币、供应池和金库对象的访问权限共享给特定的地址或模块，允许它们调用相关操作，同时防止未经授权的修改。
  
  **示例代码**：
  ```rust
  public fun init(admin: &signer) {
      let wild_coin = WILD_COIN { id: object::new(), total_supply: 1_000_000 };
      transfer::share_object(admin, &wild_coin);
  }
  ```

- **转移对象所有权 (transfer)**：
  - 在需要完全转移对象控制权时使用 `transfer`。例如，空投功能将代币转移给指定的 NFT 持有者。
  
  **示例代码**：
  ```rust
  public fun distribute_airdrop(vault: &mut WildVault, owner: address, reward: u64) {
      assert!(vault.wild_coin_balance >= reward, "ERR_INSUFFICIENT_BALANCE");
      coin::transfer(owner, reward);
      vault.wild_coin_balance = vault.wild_coin_balance - reward;
  }
  ```

- **对象能力管理**：
  - 对象的能力（如 drop、key 和 store）控制了对象在模块内外的行为。模块设计时明确了对象能力以避免误操作。
  
  **示例代码**：
  ```rust
  struct WILD_COIN has drop, key {
      id: u64,
      total_supply: u64,
  }
  ```

## 3. 模块化设计

模块化设计使得功能划分清晰、逻辑独立，增强了代码的易维护性和可扩展性。

- **功能划分清晰**：
  - 模块将供应管理、奖励管理和借贷集成分别实现，各自专注于一组相关操作，避免了功能之间的耦合。
    - 供应管理：负责代币发行和流通控制（如 `mint_wild`, `increase_unfrozen_supply`）。
    - 奖励管理：处理奖励池和空投功能（如 `deposit_sui_coin_to_reward`, `distribute_airdrop`）。
    - 借贷集成：实现去中心化借贷功能（如 `deposit_sui_to_lending_platform`, `withdraw_sui_from_lending_platform`）。

- **集成外部模块**：
  - 利用外部模块增强功能性，如 `sui::coin` 模块处理 SUI 的存取操作，`lending_core` 模块实现去中心化借贷集成。
  
  **示例代码**：
  ```rust
  use sui::coin;
  use lending_core::{deposit, withdraw};

  public fun deposit_sui_to_lending_platform(vault: &mut WildVault, amount: u64) {
      assert!(vault.sui_balance >= amount, "ERR_INSUFFICIENT_SUI_BALANCE");
      lending_core::deposit(amount);
      vault.sui_balance = vault.sui_balance - amount;
  }
  ```

- **高扩展性**：
  - 模块设计易于扩展，例如：
    - 支持更多的代币类型或资产类型。
    - 集成更多的外部 DeFi 协议（如流动性挖矿或收益聚合器）。
  
  **扩展示例**：
  ```rust
  public fun integrate_new_protocol(vault: &mut WildVault, amount: u64) {
      // 模拟集成新协议逻辑
      new_protocol::deposit(amount);
      vault.sui_balance = vault.sui_balance - amount;
  }
  ```
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)