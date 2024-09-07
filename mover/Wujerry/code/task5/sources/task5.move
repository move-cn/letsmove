/// Module: wujerry
module wujerry::swap {
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};

    // 流动性证明
    public struct LP<phantom EYMERIA_FAUCET, phantom EYMERIA_COIN> has drop {}

    // 池子
    public struct Pool<phantom T, phantom U> has key, store {
        id: UID,
        balance_a: Balance<T>,
        balance_b: Balance<U>,
        lp_supply: Supply<LP<T, U>>,
    }

    // 创建池子
    entry fun create_pool<T, U>(coin_a: Coin<T>, coin_b: Coin<U>, ctx: &mut TxContext) {
        let liquidity = std::u64::sqrt(coin_a.balance().value() * coin_b.balance().value());
        let mut lp_supply = balance::create_supply<LP<T, U>>(LP<T, U> {});
        let lsp = lp_supply.increase_supply(liquidity);
        let pool = Pool<T, U> {
            id: object::new(ctx),
            balance_a: coin_a.into_balance(),
            balance_b: coin_b.into_balance(),
            lp_supply,
        };
        // 共享池子
        transfer::share_object(pool);
        // 转移流动性证明
        let lp_token = coin::from_balance(lsp, ctx);
        transfer::public_transfer(lp_token, ctx.sender());
    }

    // 添加流动性
    entry fun add_liquidity<T, U>(
        pool: &mut Pool<T, U>,
        mut coin_a: Coin<T>,
        mut coin_b: Coin<U>,
        ctx: &mut TxContext,
    ) {
        let a_value = coin_a.balance().value();
        let b_value = coin_b.balance().value();
        let rate_a = a_value / pool.balance_a.value();
        let rate_b = b_value / pool.balance_b.value();

        // 计算添加的流动性
        let share = std::u64::min(rate_a, rate_b);
        let new_lsp = share * pool.lp_supply.supply_value();
        let new_lp = pool.lp_supply.increase_supply(new_lsp);

        // 转移新的流动性证明
        let new_lp_token = coin::from_balance(new_lp, ctx);
        transfer::public_transfer(new_lp_token, ctx.sender());

        // 把多余的币转给调用者
        if (rate_a > rate_b) {
            let redundant_a_amount = a_value - rate_b * pool.balance_a.value();
            let redundant_a = coin_a.split(redundant_a_amount, ctx);
            transfer::public_transfer(redundant_a, ctx.sender());
        }else if (rate_b > rate_a) {
            let redundant_b_amount = b_value - rate_a * pool.balance_b.value();
            let redundant_b = coin_b.split(redundant_b_amount, ctx);
            transfer::public_transfer(redundant_b, tx_context::sender(ctx));
        };

        pool.balance_a.join(coin_a.into_balance());
        pool.balance_b.join(coin_b.into_balance());
    }

    // 移除流动性
    entry fun remove_liquidity<T, U>(
        pool: &mut Pool<T, U>,
        lsp: Coin<LP<T, U>>,
        ctx: &mut TxContext,
    ) {
        let lsp_value = lsp.balance().value();
        let pool_a = pool.balance_a.value();
        let pool_b = pool.balance_b.value();
        let pool_lsp = pool.lp_supply.supply_value();

        let a = pool_b * lsp_value / pool_lsp;
        let b = pool_a * lsp_value / pool_lsp;
        //移除LSP供应
        pool.lp_supply.decrease_supply(lsp.into_balance());
        // let coin_a = pool.balance_a.;
        let coin_a = coin::take(&mut pool.balance_a, a, ctx);
        let coin_b = coin::take(&mut pool.balance_b, b, ctx);
        transfer::public_transfer(coin_a, ctx.sender());
        transfer::public_transfer(coin_b, ctx.sender());
    }

    // 交换
    entry fun swap_a_2_b<T, U>(
        pool: &mut Pool<T, U>,
        in: Coin<T>,
        ctx: &mut TxContext,
    ) {
        let input_value = in.balance().value();

        let new_pool_a = pool.balance_a.value() + input_value;
        let new_pool_b = pool.balance_a.value() * pool.balance_b.value() / new_pool_a;

        // 计算输出的代币数
        let output_amount = pool.balance_b.value() - new_pool_b;
        // 从池子中取出代币
        let output_coin = coin::take(&mut pool.balance_b, output_amount, ctx);
        // 更新流动性池库存
        pool.balance_a.join(in.into_balance());
        // 转移代币给发起调用者
        transfer::public_transfer(output_coin, tx_context::sender(ctx));
    }

    // 交换
    entry fun swap_b_2_a<T, U>(
        pool: &mut Pool<T, U>,
        in: Coin<U>,
        ctx: &mut TxContext,
    ) {
        let input_value = in.balance().value();

        let new_pool_b = pool.balance_b.value() + input_value;
        let new_pool_a = pool.balance_a.value() * pool.balance_b.value() / new_pool_b;

        // 计算输出的代币数
        let output_amount = pool.balance_a.value() - new_pool_a;
        // 从池子中取出代币
        let output_coin = coin::take(&mut pool.balance_a, output_amount, ctx);
        // 更新流动性池库存
        pool.balance_b.join(in.into_balance());
        // 转移代币给发起调用者
        transfer::public_transfer(output_coin, tx_context::sender(ctx));
    }
}
