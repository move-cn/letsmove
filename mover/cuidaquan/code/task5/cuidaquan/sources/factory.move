module cuidaquan::factory {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::coin::Coin;
    use sui::table::{Self, Table};
    use sui::event;
    use std::string::{Self, String};
    use cuidaquan::liquidity_pool::{Self};

    /// 工厂结构，管理所有流动性池
    public struct Factory has key {
        id: UID,
        pools: Table<String, address>,
        pool_list: vector<String>,
        default_fee_percent: u64,
        owner: address,
    }

    /// 工厂创建事件
    public struct FactoryCreatedEvent has copy, drop {
        factory_id: address,
        owner: address,
        default_fee_percent: u64,
    }

    /// 池创建事件
    public struct PoolCreatedByFactoryEvent has copy, drop {
        factory_id: address,
        pool_id: address,
        pool_key: String,
        coin_x_type: String,
        coin_y_type: String,
    }

    /// 错误码
    const E_NOT_OWNER: u64 = 0;
    const E_POOL_ALREADY_EXISTS: u64 = 1;
    const E_POOL_DOES_NOT_EXIST: u64 = 2;
    const E_INVALID_FEE_PERCENT: u64 = 3;
    const E_SAME_COIN_TYPE: u64 = 4;

    /// 创建工厂
    public fun create_factory(
        default_fee_percent: u64,
        ctx: &mut TxContext
    ) {
        // 验证费率在合理范围内 (0-5%)
        assert!(default_fee_percent <= 500, E_INVALID_FEE_PERCENT);
        
        let factory_id = object::new(ctx);
        let factory_address = object::uid_to_address(&factory_id);
        let owner = tx_context::sender(ctx);
        
        let factory = Factory {
            id: factory_id,
            pools: table::new(ctx),
            pool_list: vector::empty(),
            default_fee_percent,
            owner,
        };
        
        // 发出工厂创建事件
        event::emit(FactoryCreatedEvent {
            factory_id: factory_address,
            owner,
            default_fee_percent,
        });
        
        // 共享工厂对象
        transfer::share_object(factory);
    }

    /// 创建流动性池
    public fun create_pool<CoinTypeX, CoinTypeY>(
        factory: &mut Factory,
        coin_x: Coin<CoinTypeX>,
        coin_y: Coin<CoinTypeY>,
        fee_percent: u64,
        ctx: &mut TxContext
    ) {
        // 只有所有者可以创建池子
        assert!(tx_context::sender(ctx) == factory.owner, E_NOT_OWNER);
        
        // 确保代币类型不同
        assert!(!is_same_type<CoinTypeX, CoinTypeY>(), E_SAME_COIN_TYPE);
        
        // 验证费率在合理范围内 (0-5%)
        assert!(fee_percent <= 500, E_INVALID_FEE_PERCENT);
        
        // 生成池键
        let pool_key = get_pool_key<CoinTypeX, CoinTypeY>();
        
        // 确保池不存在
        assert!(!table::contains(&factory.pools, pool_key), E_POOL_ALREADY_EXISTS);
        
        // 创建流动性池
        let pool = liquidity_pool::create_pool(coin_x, coin_y, fee_percent, ctx);
        let pool_id = object::uid_to_address(liquidity_pool::get_pool_id(&pool));
        
        // 将池添加到工厂
        table::add(&mut factory.pools, pool_key, pool_id);
        vector::push_back(&mut factory.pool_list, pool_key);
        
        // 发出池创建事件
        event::emit(PoolCreatedByFactoryEvent {
            factory_id: object::uid_to_address(&factory.id),
            pool_id,
            pool_key,
            coin_x_type: get_coin_name<CoinTypeX>(),
            coin_y_type: get_coin_name<CoinTypeY>(),
        });
        
        // 共享池对象
        transfer::public_share_object(pool);
    }

    /// 使用默认费率创建流动性池
    public fun create_pool_with_default_fee<CoinTypeX, CoinTypeY>(
        factory: &mut Factory,
        coin_x: Coin<CoinTypeX>,
        coin_y: Coin<CoinTypeY>,
        ctx: &mut TxContext
    ) {
        let default_fee = factory.default_fee_percent;
        create_pool<CoinTypeX, CoinTypeY>(
            factory,
            coin_x,
            coin_y,
            default_fee,
            ctx
        )
    }

    /// 更新默认费率
    public fun update_default_fee_percent(
        factory: &mut Factory,
        new_fee_percent: u64,
        ctx: &mut TxContext
    ) {
        // 只有所有者可以更新费率
        assert!(tx_context::sender(ctx) == factory.owner, E_NOT_OWNER);
        
        // 验证费率在合理范围内 (0-5%)
        assert!(new_fee_percent <= 500, E_INVALID_FEE_PERCENT);
        
        factory.default_fee_percent = new_fee_percent;
    }

    /// 转移工厂所有权
    public fun transfer_ownership(
        factory: &mut Factory,
        new_owner: address,
        ctx: &mut TxContext
    ) {
        // 只有所有者可以转移所有权
        assert!(tx_context::sender(ctx) == factory.owner, E_NOT_OWNER);
        
        factory.owner = new_owner;
    }

    /// 获取池地址
    public fun get_pool_address<CoinTypeX, CoinTypeY>(
        factory: &Factory
    ): address {
        let pool_key = get_pool_key<CoinTypeX, CoinTypeY>();
        assert!(table::contains(&factory.pools, pool_key), E_POOL_DOES_NOT_EXIST);
        *table::borrow(&factory.pools, pool_key)
    }

    /// 获取所有池键
    public fun get_all_pool_keys(
        factory: &Factory
    ): &vector<String> {
        &factory.pool_list
    }

    /// 获取池数量
    public fun get_pool_count(
        factory: &Factory
    ): u64 {
        vector::length(&factory.pool_list)
    }

    /// 获取默认费率
    public fun get_default_fee_percent(
        factory: &Factory
    ): u64 {
        factory.default_fee_percent
    }

    /// 获取工厂所有者
    public fun get_owner(
        factory: &Factory
    ): address {
        factory.owner
    }

    /// 生成池键（辅助函数）
    fun get_pool_key<CoinTypeX, CoinTypeY>(): String {
        let type_x = get_coin_name<CoinTypeX>();
        let type_y = get_coin_name<CoinTypeY>();
        
        // 确保类型按字典序排序，以确保相同的代币对总是生成相同的键
        if (string_compare(&type_x, &type_y) <= 0) {
            let mut key = string::utf8(b"");
            string::append(&mut key, type_x);
            string::append(&mut key, string::utf8(b":"));
            string::append(&mut key, type_y);
            key
        } else {
            let mut key = string::utf8(b"");
            string::append(&mut key, type_y);
            string::append(&mut key, string::utf8(b":"));
            string::append(&mut key, type_x);
            key
        }
    }

    /// 字符串比较（辅助函数）
    fun string_compare(a: &String, b: &String): u8 {
        let a_bytes = string::as_bytes(a);
        let b_bytes = string::as_bytes(b);
        
        let a_length = vector::length(a_bytes);
        let b_length = vector::length(b_bytes);
        
        let mut i = 0;
        let min_length = if (a_length < b_length) { a_length } else { b_length };
        
        while (i < min_length) {
            let a_byte = *vector::borrow(a_bytes, i);
            let b_byte = *vector::borrow(b_bytes, i);
            
            if (a_byte < b_byte) {
                return 0 // a < b
            } else if (a_byte > b_byte) {
                return 2 // a > b
            };
            
            i = i + 1;
        };
        
        if (a_length < b_length) {
            0 // a < b
        } else if (a_length > b_length) {
            2 // a > b
        } else {
            1 // a == b
        }
    }

    /// 检查两个类型是否相同（辅助函数）
    fun is_same_type<T1, T2>(): bool {
        get_coin_name<T1>() == get_coin_name<T2>()
    }

    /// 获取代币名称（辅助函数）
    fun get_coin_name<CoinType>(): String {
        let type_name = std::type_name::get<CoinType>();
        string::utf8(std::ascii::into_bytes(std::type_name::into_string(type_name)))
    }
}