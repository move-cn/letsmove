/*
/// Module: firefly_swap
module firefly_swap::firefly_swap;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module firefly_swap::firefly_swap{
    use sui::balance::{Self,Balance};
    use kamisayaka_coin::kamisayaka_coin::KAMISAYAKA_COIN;
    use kamisayaka_faucet::kamisayaka_faucet::KAMISAYAKA_FAUCET;
    use sui::coin::{Self,Coin};
    use sui::transfer::{transfer,share_object,public_transfer};

    public struct Bank has key{
        id:UID,
        my_coin:Balance<KAMISAYAKA_COIN>,
        faucet:Balance<KAMISAYAKA_FAUCET>,
    }

    public struct AdminCap has key{
        id:UID,
    }

    fun init(ctx: &mut TxContext){
        let bank = Bank{
            id:object::new(ctx),
            my_coin:balance::zero(),
            faucet:balance::zero(),
        };
        share_object(bank);

        let admin_cap = AdminCap{
            id:object::new(ctx),
        };

        transfer(admin_cap, ctx.sender());
    }

// deposit coin
    public entry fun deposit_coin(
        bank: &mut Bank, 
        in_Coin:&mut Coin<KAMISAYAKA_COIN>,
        amount:u64,
        _: &mut TxContext
    ){
        assert!(coin::value(in_Coin) >= amount, 0);
        let deposit_balance = balance::split(coin::balance_mut(in_Coin),amount);
        balance::join(&mut bank.my_coin,deposit_balance);
    }

    public entry fun deposit_faucet(
        bank: &mut Bank, 
        in_Coin:&mut Coin<KAMISAYAKA_FAUCET>,
        amount:u64,
        _: &mut TxContext
    ){
        assert!(coin::value(in_Coin) >= amount, 0);
        let deposit_balance = balance::split(coin::balance_mut(in_Coin),amount);
        balance::join(&mut bank.faucet,deposit_balance);
    }

// swap function
    public entry fun my_coin_to_faucet(
        bank: &mut Bank,
        in_Coin: Coin<KAMISAYAKA_COIN>,
        ctx: &mut TxContext
    ){
            let my_coin_amount = coin::value(&in_Coin);
            let faucet_amount = my_coin_amount * 7;

            assert!(balance::value(&bank.faucet) >= faucet_amount);

            let in_balance = coin::into_balance(in_Coin); // 将整个Coin转为Balance
            balance::join(&mut bank.my_coin, in_balance); // 存入银行

            // 分割并发送faucet
            let faucet_balance = balance::split(&mut bank.faucet, faucet_amount);
            let faucet_coin = coin::from_balance(faucet_balance, ctx);
            public_transfer(faucet_coin, ctx.sender());
    }

    public entry fun faucet_to_my_coin(
        bank: &mut Bank,
        in_Coin: Coin<KAMISAYAKA_FAUCET>,
        ctx: &mut TxContext
     ){
            let faucet_amount = coin::value(&in_Coin);
            let my_coin_amount = faucet_amount / 7;

            assert!(balance::value(&bank.my_coin) >= my_coin_amount);

            let in_balance = coin::into_balance(in_Coin); // 将整个Coin转为Balance
            balance::join(&mut bank.faucet, in_balance); // 存入银行

            // 分割并发送coin
            let my_coin_balance = balance::split(&mut bank.my_coin, my_coin_amount);
            let my_coin_coin = coin::from_balance(my_coin_balance, ctx);
            public_transfer(my_coin_coin, ctx.sender());
     }

     public entry fun withdraw_coin(
        _: &AdminCap,
        bank: &mut Bank,
        amount:u64,
        ctx: &mut TxContext
    ){
        assert!(balance::value(&bank.my_coin) >= amount, 0);
        let withdraw_balance = balance::split(&mut bank.my_coin,amount);
        public_transfer(coin::from_balance(withdraw_balance,ctx),ctx.sender());
    }

    public entry fun withdraw_faucet(
        _: &AdminCap,
        bank: &mut Bank,
        amount:u64,
        ctx: &mut TxContext
    ){
        assert!(balance::value(&bank.faucet) >= amount, 0);
        let withdraw_balance = balance::split(&mut bank.faucet,amount);
        public_transfer(coin::from_balance(withdraw_balance,ctx),ctx.sender());
    }
}