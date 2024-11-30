/// Module: hwen_swap
module hwen_swap::hwen_swap{
    use hwen_faucet_coin::hwen_faucet_coin::HWEN_FAUCET_COIN;
    use hwen_coin::hwen_coin::HWEN_COIN;
    use sui::coin::{Self, Coin};
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::balance::{Self, Balance};

    const EXCHANGE_RATE: u64 = 2 ;

    public struct AdminCap has key {
        id: UID
    }

    public struct MySwap has key {
        id: UID,        
        hwen_coin:Balance<HWEN_COIN>,

        faucet_coin:Balance<HWEN_FAUCET_COIN>
    }

    /// 初始化函数，创建并分享一个新的 MySwap 对象和 AdminCap 对象
    fun init(ctx:&mut TxContext){
        let admin_cap = AdminCap{id: object::new(ctx)};
        let swap = MySwap{
            id: object::new(ctx), 
            hwen_coin: balance::zero<HWEN_COIN>(), 
            faucet_coin: balance::zero<HWEN_FAUCET_COIN>()
            };

        share_object(swap);
        transfer(admin_cap, ctx.sender());
    }

    /// 存入 HWEN_COIN 到 MySwap 中
    entry fun deposit_hwen_coin(
        swap: &mut MySwap,
        hwen: Coin<HWEN_COIN>)
    {
        let hwen_balance = coin::into_balance(hwen);
        swap.hwen_coin.join(hwen_balance);
        //balance::join(&mut swap.hwen_coin, hwen_balance);
    }

    /// 存入 HWEN_FAUCET_COIN 到 MySwap 中
    public entry fun deposit_faucet_coin(
        swap: &mut MySwap,
        faucet: Coin<HWEN_FAUCET_COIN>)
    {
        let faucet_balance = coin::into_balance(faucet);
        balance::join(&mut swap.faucet_coin, faucet_balance);
    }

    /// 从 MySwap 中提取指定数量的 HWEN_COIN
    public entry fun withdraw_hwen_coin(
        _unused: &AdminCap,
        swap: &mut MySwap,
        amount: u64,
        ctx : &mut TxContext)
    {
        let hwen_balance = balance::split(&mut swap.hwen_coin, amount);
        let hwen_coin = coin::from_balance(hwen_balance, ctx);
        public_transfer(hwen_coin, ctx.sender())
    }

    /// 从 MySwap 中提取指定数量的 HWEN_FAUCET_COIN
    entry fun withdraw_faucet_coin(
        _unused: &AdminCap,
        swap: &mut MySwap,
        amount: u64,
        ctx : &mut TxContext)
    {
        let faucet_balance = balance::split(&mut swap.faucet_coin, amount);
        let faucet_coin = coin::from_balance(faucet_balance, ctx);
        public_transfer(faucet_coin, ctx.sender())
    }

    /// 将 HWEN_COIN 交换为 HWEN_FAUCET_COIN
    entry fun swap_hwen_to_faucet(
        swap: &mut MySwap,
        input: Coin<HWEN_COIN>,
        ctx : &mut TxContext
    ){

        let hwen_amount = coin::value(&input);
        let hwen_balance = coin::into_balance(input);
        balance::join(&mut swap.hwen_coin, hwen_balance);

        let faucet_amount = hwen_amount * EXCHANGE_RATE;

        let faucet_balance = balance::split(&mut swap.faucet_coin,faucet_amount);
        let faucet_coin = coin::from_balance(faucet_balance,ctx);
        public_transfer(faucet_coin,ctx.sender())
    }

    /// 将 HWEN_FAUCET_COIN 交换为 HWEN_COIN
    entry fun swap_faucet_to_hwen(
        swap: &mut MySwap,
        input: Coin<HWEN_FAUCET_COIN>,
        ctx : &mut TxContext)
    {
        let faucet_amount = coin::value(&input);
        let faucet_balance = coin::into_balance(input);
        balance::join(&mut swap.faucet_coin, faucet_balance,);

        let hwen_amount = faucet_amount / EXCHANGE_RATE;

        let hwen_balance = balance::split(&mut swap.hwen_coin, hwen_amount);
        let hwen_coin = coin::from_balance(hwen_balance, ctx);
        public_transfer(hwen_coin, ctx.sender())
    }

}