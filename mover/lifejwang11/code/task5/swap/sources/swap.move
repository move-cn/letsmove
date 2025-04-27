module swap::lifejwang11 {

    use move_coin::faucet_coin::FAUCET_COIN;
    use move_coin::my_coin::MY_COIN;
    use sui::balance::{Balance, zero};
    use sui::coin::{Coin, from_balance};
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::coin;

    const EPOOLINSUFFICIENTBALANCE: u64 = 0;
    const EUSERINSUFFICIENTBALANCE: u64 = 1;

    public struct SwapPool has key {
        id: UID,
        coin: Balance<MY_COIN>,
        faucet_coin: Balance<FAUCET_COIN>
    }

    public struct Admin has key {
        id: UID,
    }

    // 初始化
    fun init(ctx: &mut TxContext) {
        // 创建池子
        let swapPool = SwapPool {
            id: object::new(ctx),
            coin: zero(),
            faucet_coin: zero(),
        };
        share_object(swapPool);

        // 设置提现权限
        let admin = Admin {
            id: object::new(ctx)
        };
        transfer(admin, ctx.sender());
    }

    // 添加 coin 到池子
    public entry fun add_coin_to_pool(swap_pool: &mut SwapPool, in_coin: &mut Coin<MY_COIN>, amount: u64, ctx: &mut TxContext) {
        let in_obj = in_coin.split(amount, ctx);
        swap_pool.coin.join(coin::into_balance(in_obj));
    }

    public entry fun add_faucet_to_pool(swap_pool: &mut SwapPool, in_coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        let in_obj = in_coin.split(amount, ctx);
        swap_pool.faucet_coin.join(coin::into_balance(in_obj));
    }

    // 币兑换水龙头币
    public entry fun swap_to_faucet(swap_pool: &mut SwapPool, in_coin: &mut Coin<MY_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(in_coin.value() >= amount, EUSERINSUFFICIENTBALANCE);
        let swap_obj = in_coin.split(amount, ctx);
        // 需要转出的数量
        let out_amount = amount;
        assert!(swap_pool.faucet_coin.value() >= out_amount, EPOOLINSUFFICIENTBALANCE);
        // 用户的币转入池子
        swap_pool.coin.join(swap_obj.into_balance());
        // 池子的币转给用户
        let out_balance = swap_pool.faucet_coin.split(out_amount);
        public_transfer(from_balance(out_balance, ctx), ctx.sender());
    }

    // 水龙头币兑换币
    public entry fun swap_to_coin(swap_pool: &mut SwapPool, in_coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(in_coin.value() >= amount, EUSERINSUFFICIENTBALANCE);
        //分割要兑换的币（真实情况可能是前端处理好）
        let in_obj = in_coin.split(amount, ctx);
        // 需要转出的数量
        let out_amount = amount;
        assert!(swap_pool.coin.value() >= out_amount, EPOOLINSUFFICIENTBALANCE);
        // 用户的币转入池子
        swap_pool.faucet_coin.join(coin::into_balance(in_obj));
        // 池子的币转给用户
        let out_balance = swap_pool.coin.split(out_amount);
        let out_coin = from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
    }

    // 管理员从池子里提取
    public entry fun withdraw_coin_from_pool(_: &Admin, swap_pool: &mut SwapPool, amount: u64, ctx: &mut TxContext) {
        assert!(swap_pool.coin.value() >= amount, EUSERINSUFFICIENTBALANCE);
        let outBalance = swap_pool.coin.split(amount);
        public_transfer(from_balance(outBalance, ctx), ctx.sender());
    }

    public entry fun withdraw_faucet_from_pool(_: &Admin, swap_pool: &mut SwapPool, amount: u64, ctx: &mut TxContext) {
        assert!(swap_pool.faucet_coin.value() >= amount, EUSERINSUFFICIENTBALANCE);
        let out_b = swap_pool.faucet_coin.split(amount);
        let out_c = from_balance(out_b, ctx);
        public_transfer(out_c, ctx.sender());
    }

}
