（二十）学习笔记：解析 `animal_crossing::wild_NFT` 模块

1. **模块简介**

`animal_crossing::wild_NFT` 是一个 Sui Move 模块，旨在创建、管理和操作与濒危动物相关的 NFT 系统。通过引入 `wild_coin` 和 `SUI`，模块结合金融激励机制实现了 NFT 的铸造、购买、遗弃及空投等功能。

2. **主要结构体及功能**

2.1 **主要结构体**

以下是主要结构体的介绍以及相关功能的补充代码示例。

2.1.1 **Animals**

存储珍稀动物信息的结构体，每种动物包含唯一的 UID 和对应的详细信息表。

```rust
public struct Animals has key, store {
    id: UID,
    animal_infos: Table<u64, AnimalInfo>,
}
```

**功能**：

1. **添加动物信息（Admin 权限）**

   管理员可以向 `Animals` 添加新的动物信息。

   示例代码：

   ```rust
   public fun add_animal(
       _: &NFTAdminCap,
       animals: &mut Animals,
       name: String,
       species: String,
       habitat: String,
       status: u64,
       image_url: String,
       ctx: &mut TxContext,
   ) {
       let new_animal = AnimalInfo {
           id: object::new(ctx),
           name,
           species,
           habitat,
           status,
           image_url,
       };
       let key = table::length(&animals.animal_infos);
       table::add(&mut animals.animal_infos, key, new_animal);
   }
   ```

2. **更新动物信息（Admin 权限）**

   根据给定的键更新指定的动物信息。

   示例代码：

   ```rust
   public fun update_animal(
       _: &NFTAdminCap,
       animals: &mut Animals,
       key: u64,
       new_name: String,
       new_status: u64,
       ctx: &mut TxContext,
   ) {
       assert!(table::contains(&animals.animal_infos, key), ERR_KEY_DOES_NOT_EXIST);
       let animal_info = table::borrow_mut(&mut animals.animal_infos, key);
       animal_info.name = new_name;
       animal_info.status = new_status;
   }
   ```

2.1.2 **AnimalNFT**

每个动物对应的 NFT 结构体，记录了动物的基本信息和收养人的地址。

```rust
public struct AnimalNFT has key, store {
    id: UID,
    name: String,
    animal_id: u64,
    species: String,
    habitat: String,
    adopted_by: address,
    image_url: String,
    create_time: u64,
}
```

**功能**：

1. **铸造 NFT（购买功能）**

   使用特定金额的 `WILD_COIN` 购买指定动物的 NFT。

   示例代码：

   ```rust
   public fun mint_nft(
       animals: &Animals,
       key: u64,
       inputcoin: Coin<wild_coin::WILD_COIN>,
       recipient: address,
       clock: &Clock,
       ctx: &mut TxContext,
   ) {
       assert!(coin::value(&inputcoin) == NFT_PRICE, ERR_NFT_PRICE_IS_EXACTLY_NFT_PRICE_WILD_COIN);
       let animal_info = &animals.animal_infos[key];
       let new_nft = AnimalNFT {
           id: object::new(ctx),
           name: animal_info.name,
           animal_id: key,
           species: animal_info.species,
           habitat: animal_info.habitat,
           adopted_by: recipient,
           image_url: animal_info.image_url,
           create_time: clock::timestamp_ms(clock),
       };
       transfer::public_transfer(new_nft, recipient);
   }
   ```

2. **放弃 NFT（销毁功能）**

   用户可通过销毁 NFT 来收回一定的 `SUI` 或 `WILD_COIN`。

   示例代码：

   ```rust
   public fun abandon_nft(
       nft: AnimalNFT,
       vault: &mut WildVault,
       ctx: &mut TxContext,
   ) {
       let reward_coin = wild_coin::withdraw_wild_coin_from_vault(vault, NFT_PRICE, ctx);
       transfer::public_transfer(reward_coin, nft.adopted_by);
       object::delete(nft.id);
   }
   ```

2.1.3 **MintRecord**

记录 NFT 铸造的历史，包括每种动物的所有 NFT 数据。

```rust
public struct MintRecord has key, store {
    id: UID,
    record: LinkedTable<u64, LinkedTable<ID, u64>>, // 每种动物的 NFT 链接表
    count: u64,
}
```

**功能**：

1. **记录铸造历史**

   将 NFT 铸造记录加入到 `MintRecord` 中。

   示例代码：

   ```rust
   public fun record_minting(
       record: &mut MintRecord,
       nft_id: ID,
       animal_key: u64,
       clock: &Clock,
       ctx: &mut TxContext,
   ) {
       if (!linked_table::contains(&record.record, animal_key)) {
           let mut new_nft_table = linked_table::new<ID, u64>(ctx);
           linked_table::push_back(&mut new_nft_table, nft_id, clock::timestamp_ms(clock));
           linked_table::push_back(&mut record.record, animal_key, new_nft_table);
       } else {
           let nft_table = linked_table::borrow_mut(&mut record.record, animal_key);
           linked_table::push_back(nft_table, nft_id, clock::timestamp_ms(clock));
       };
       record.count = record.count + 1;
   }
   ```

2. **移除铸造记录**

   在 NFT 被放弃时，将其从记录中移除。

   示例代码：

   ```rust
   public fun remove_mint_record(
       record: &mut MintRecord,
       nft_id: ID,
       animal_key: u64,
   ) {
       assert!(linked_table::contains(&record.record, animal_key), ERR_KEY_DOES_NOT_EXIST);
       let nft_table = linked_table::borrow_mut(&mut record.record, animal_key);
       linked_table::remove(nft_table, nft_id);
       if (linked_table::is_empty(nft_table)) {
           linked_table::remove(&mut record.record, animal_key);
       };
       record.count = record.count - 1;
   }
   ```

# 3. 核心逻辑：空头发放机制

本节详细阐述系统核心逻辑“空头发放”的实现，包括数据收集、权重计算、分发奖励等核心步骤，结合代码示例展示具体实现。

## 3.1 空头发放的流程概述
1. 数据收集：从系统中获取所有相关 NFT 数据，包括其状态和持有时长。
2. 权重计算：基于状态权重和时间权重，计算总权重。
3. 奖励分发：按权重比例分配奖励，确保激励公平性。

## 3.2 核心函数解析

以下是实现“空头发放”的完整代码及其功能分解。

```rust
public fun calculate_send_airdrop_distribution(
    _: &NFTAdminCap,             // 管理权限验证
    record: &MintRecord,         // 链上记录存储所有 NFT 信息
    animals: &Animals,           // 动物信息表
    vault: &mut WildVault,       // 系统资金库
    clock: &Clock,               // 当前时间
    ctx: &mut TxContext          // 交易上下文
) {
    let mut total_status_weight = 0u64;
    let mut total_time_weight = 0u64;
    let mut airdrop_table = linked_table::new<ID, u64>(ctx);

    // Step 1: 收集数据并计算总权重
    let current_time = clock::timestamp_ms(clock);
    let mut front_item = linked_table::front(&record.record);
    let mut nft_weights = linked_table::new<ID, Nft_weight>(ctx);

    while (option::is_some(front_item)) {
        let key = option::borrow(front_item);
        let nfts = linked_table::borrow(&record.record, *key);
        let animal_info = table::borrow(&animals.animal_infos, *key);
        let status_weight = animal_info.status;

        let mut front_nft = linked_table::front(nfts);
        while (option::is_some(front_nft)) {
            let nft_key = option::borrow<ID>(front_nft);
            let create_time = linked_table::borrow(nfts, *nft_key);

            // 计算持有时长的时间权重
            let time_held = current_time - *create_time;
            let time_weight = time_held / 86400000 + 1;

            total_status_weight += status_weight;
            total_time_weight += time_weight;

            linked_table::push_back(&mut nft_weights, *nft_key, Nft_weight {
                status_weight,
                time_weight,
            });

            front_nft = linked_table::next(nfts, *nft_key);
        };

        front_item = linked_table::next(&record.record, *key);
    };

    assert!(total_status_weight > 0, 1);
    assert!(total_time_weight > 0, 2);

    // Step 2: 基于权重计算空头分配
    let mut front_item = linked_table::front(&nft_weights);
    while (option::is_some(front_item)) {
        let nft_id = option::borrow(front_item);
        let Nft_weight { status_weight, time_weight } = linked_table::borrow(&nft_weights, *nft_id);

        let status_ratio = *status_weight * 1_000_000_000 / total_status_weight;
        let time_ratio = *time_weight * 1_000_000_000 / total_time_weight;

        // 自定义奖励分配公式
        let reward = status_ratio * 8 / 10 + time_ratio * 2 / 10;
        linked_table::push_back(&mut airdrop_table, *nft_id, reward);

        front_item = linked_table::next(&nft_weights, *nft_id);
    };

    // Step 3: 发放空头奖励
    wild_coin::distribute_airdrop(&airdrop_table, vault, ctx);
    linked_table::drop(airdrop_table);
    linked_table::drop(nft_weights);
}
```

## 3.3 功能分解
1. 数据收集与初始化：
   - 从 MintRecord 和 Animals 中提取每个 NFT 的状态信息和创建时间。
   - 计算 `status_weight` 和 `time_weight`。
2. 总权重计算：
   - `status_weight` 根据动物的当前状态赋予不同权重。
   - `time_weight` 根据 NFT 持有的天数计算，时间越长权重越高。
3. 空头奖励计算：
   - 通过状态权重和时间权重的比例计算每个 NFT 的奖励。
   - 默认权重分配规则：状态权重占比 80%，时间权重占比 20%。
4. 奖励分发与清理：
   - 调用 `wild_coin::distribute_airdrop` 函数分发奖励。
   - 清理分配数据表释放资源。

## 3.4 技术亮点
1. 动态权重计算：权重计算逻辑支持灵活扩展，可调整分配比例。
2. 链表高效存储：采用 `linked_table` 实现 NFT 权重与奖励的高效存储和迭代。
3. 代码模块化：逻辑清晰分层，便于未来维护和扩展。

通过该设计，系统实现了一个公平、高效的空头发放机制，增强了用户参与的激励效果，为平台经济生态注入活力。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)