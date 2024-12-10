/// Module: zhbbll_swap
module zhbbll_swap::zhbbll_swap{
    use zhbbll_coin::zhbbll_coin::ZHBBLL_COIN;
    use zhbbll_faucet_coin::zhbbll_faucet_coin::ZHBBLL_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::coin::{Self, Coin};

    public struct AdminCap has key{
        id: UID,
    }

    public struct Bank has key{
        id: UID,
        zhbbll_coin: Balance<ZHBBLL_COIN>,
        zhbbll_faucet_coin: Balance<ZHBBLL_FAUCET_COIN>,
    }
    fun init(ctx: &mut TxContext){
        let bank = Bank{
            id: object::new(ctx),
            zhbbll_coin: balance::zero<ZHBBLL_COIN>(),
            zhbbll_faucet_coin: balance::zero<ZHBBLL_FAUCET_COIN>(),
        };
        share_object(bank);
        let admin_cap = AdminCap{
            id: object::new(ctx),
        };
        transfer(admin_cap, ctx.sender());
    }
    public entry fun deposit_zhbbll_coin(
        _: &AdminCap, 
        bank: &mut Bank, 
        zhbbll_coin: Coin<ZHBBLL_COIN>,
        _: &mut TxContext
    ){
        let coin_balance = coin::into_balance(zhbbll_coin);
        balance::join(&mut bank.zhbbll_coin, coin_balance);
    }
    public entry fun deposit_zhbbll_faucet_coin(
        _: &AdminCap,
        bank: &mut Bank,
        zhbbll_faucet_coin: Coin<ZHBBLL_FAUCET_COIN>,
        _: &mut TxContext
    ){
        let coin_balance = coin::into_balance(zhbbll_faucet_coin);
        balance::join(&mut bank.zhbbll_faucet_coin, coin_balance);
    }
    public entry fun withdraw_zhbbll_coin(
        _: &AdminCap,
        bank: &mut Bank,
        amount: u64,
        ctx: &mut TxContext,
    ){
        let coin_balance = balance::split(&mut bank.zhbbll_coin, amount);
        let coin = coin::from_balance(coin_balance, ctx);
        public_transfer(coin, ctx.sender());
    }
    public entry fun withdraw_zhbbll_faucet_coin(
        _: &AdminCap,
        bank: &mut Bank,
        amount: u64,
        ctx: &mut TxContext,
    ){
        let coin_balance = balance::split(&mut bank.zhbbll_faucet_coin, amount);
        let coin = coin::from_balance(coin_balance, ctx);
        public_transfer(coin, ctx.sender());
    }

    public entry fun swap_zhbbll_coin_to_zhbbll_faucet_coin(
        bank: &mut Bank,
        zhbbll_coin: Coin<ZHBBLL_COIN>,
        ctx: &mut TxContext,
    ){
        let amount = coin::value(&zhbbll_coin);
        balance::join(&mut bank.zhbbll_coin, coin::into_balance(zhbbll_coin));

        let amount_faucet = amount * 2;
        let coin_faucet = balance::split(&mut bank.zhbbll_faucet_coin, amount_faucet);
        public_transfer(coin::from_balance(coin_faucet, ctx), ctx.sender());
    }
    public entry fun swap_zhbbll_faucet_coin_to_zhbbll_coin(
        bank: &mut Bank,
        zhbbll_faucet_coin: Coin<ZHBBLL_FAUCET_COIN>,
        ctx: &mut TxContext,
    ){
        let amount = coin::value(&zhbbll_faucet_coin);
        balance::join(&mut bank.zhbbll_faucet_coin, coin::into_balance(zhbbll_faucet_coin));

        let amount_coin = amount / 2;
        let coin = balance::split(&mut bank.zhbbll_coin, amount_coin);
        public_transfer(coin::from_balance(coin, ctx), ctx.sender());
    }



}
