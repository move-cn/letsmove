/// 代币交换模块：实现两种代币之间的兑换功能
module m2887_swap::m2887_swap {

    use m2887_faucet_coin::m2887_faucet_coin::M2887_FAUCET_COIN;
    use m2887_coin::m2887_coin::M2887_COIN;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};

    /// 错误代码：输入金额不足
    const EInputNotEnough: u64 = 0;
    /// 错误代码：流动性池余额不足
    const EPoolNotEnough: u64 = 1;

    /// 管理员权限凭证，用于管理流动性池
    public struct AdminCap has key { id: UID }

    /// 流动性池结构，存储两种代币的余额
    public struct Pool has key {
        id: UID,
        /// 水龙头代币余额
        faucet_coin: Balance<M2887_FAUCET_COIN>,
        /// 自定义代币余额
        my_coin: Balance<M2887_COIN>,
    }

    /// 初始化函数：创建流动性池和管理员权限
    /// @param ctx - 交易上下文
    fun init(ctx: &mut TxContext) {
        // 创建空的流动性池
        let pool = Pool {
            id: object::new(ctx),
            faucet_coin: balance::zero<M2887_FAUCET_COIN>(),
            my_coin: balance::zero<M2887_COIN>(),
        };
        // 共享流动性池对象，使其可被所有人访问
        transfer::share_object(pool);
        // 将管理员权限转移给合约部署者
        transfer::transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
    }

    /// 存入自定义代币到流动性池
    /// @param pool - 流动性池引用
    /// @param input - 输入的代币
    /// @param amount - 存入金额
    /// @param ctx - 交易上下文
    public entry fun deposit_my_coin(
        pool: &mut Pool,
        input: Coin<M2887_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let caller = tx_context::sender(ctx);
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);
        let mut input_balance = coin::into_balance(input);
        // 如果输入金额大于存入金额，返还多余部分
        if (input_value > amount) {
            balance::join(
                &mut pool.my_coin,
                balance::split(&mut input_balance, amount),
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, caller);
        } else {
            balance::join(&mut pool.my_coin, input_balance);
        };
    }

    /// 存入水龙头代币到流动性池
    /// @param pool - 流动性池引用
    /// @param input - 输入的代币
    /// @param amount - 存入金额
    /// @param ctx - 交易上下文
    public entry fun deposit__faucet_coin(
        pool: &mut Pool,
        input: Coin<M2887_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let caller = tx_context::sender(ctx);
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);
        let mut input_balance = coin::into_balance(input);
        // 如果输入金额大于存入金额，返还多余部分
        if (input_value > amount) {
            balance::join(
                &mut pool.faucet_coin,
                balance::split(&mut input_balance, amount),
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, caller);
        } else {
            balance::join(&mut pool.faucet_coin, input_balance);
        };
    }

    /// 管理员提取自定义代币
    /// @param _ - 管理员权限凭证
    /// @param pool - 流动性池引用
    /// @param amount - 提取金额
    /// @param ctx - 交易上下文
    public entry fun withdraw_zzf222_coin(
        _: &AdminCap,
        pool: &mut Pool,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let my_coin_balance = balance::split(&mut pool.my_coin, amount);
        let my_coin = coin::from_balance(my_coin_balance, ctx);
        transfer::public_transfer(my_coin, tx_context::sender(ctx));
    }

    /// 管理员提取水龙头代币
    /// @param _ - 管理员权限凭证
    /// @param pool - 流动性池引用
    /// @param amount - 提取金额
    /// @param ctx - 交易上下文
    public entry fun withdraw_zzf222_faucet_coin(
        _: &AdminCap,
        pool: &mut Pool,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let faucet_coin_balance = balance::split(&mut pool.faucet_coin, amount);
        let faucet_coin = coin::from_balance(faucet_coin_balance, ctx);
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
    }

    /// 将水龙头代币兑换为自定义代币
    /// @param pool - 流动性池引用
    /// @param input - 输入的水龙头代币
    /// @param amount - 兑换金额
    /// @param ctx - 交易上下文
    /// 兑换比例：2000:1000 (水龙头代币:自定义代币)
    public entry fun swap_faucet_coin_to_my_coin(
        pool: &mut Pool,
        input: Coin<M2887_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let caller = tx_context::sender(ctx);
        let input_value = coin::value(&input);
        // 计算兑换后得到的自定义代币数量
        let output_value = amount * 1000 / 2000; // 兑换比例 2000:1000
        assert!(input_value >= amount, EInputNotEnough);
        let mut input_balance = coin::into_balance(input);
        assert!(balance::value(&pool.my_coin) >= output_value, EPoolNotEnough);
        
        // 处理多余的输入金额
        if (input_value > amount) {
            balance::join(
                &mut pool.faucet_coin,
                balance::split(&mut input_balance, amount),
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, caller);
        } else {
            balance::join(&mut pool.faucet_coin, input_balance);
        };
        
        // 转出兑换得到的自定义代币
        let output_balance = balance::split(&mut pool.my_coin, output_value);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, caller);
    }

    /// 将自定义代币兑换为水龙头代币
    /// @param pool - 流动性池引用
    /// @param input - 输入的自定义代币
    /// @param amount - 兑换金额
    /// @param ctx - 交易上下文
    /// 兑换比例：1000:2000 (自定义代币:水龙头代币)
    public entry fun swap_my_coin_to_faucet_coin(
        pool: &mut Pool,
        input: Coin<M2887_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let caller = tx_context::sender(ctx);
        let input_value = coin::value(&input);
        // 计算兑换后得到的水龙头代币数量
        let output_value = amount * 2000 / 1000; // 兑换比例 1000:2000
        assert!(input_value >= amount, EInputNotEnough);
        let mut input_balance = coin::into_balance(input);
        assert!(balance::value(&pool.faucet_coin) >= output_value, EPoolNotEnough);
        
        // 处理多余的输入金额
        if (input_value > amount) {
            balance::join(
                &mut pool.my_coin,
                balance::split(&mut input_balance, amount),
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, caller);
        } else {
            balance::join(&mut pool.my_coin, input_balance);
        };
        
        // 转出兑换得到的水龙头代币
        let output_balance = balance::split(&mut pool.faucet_coin, output_value);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, caller);
    }
}
