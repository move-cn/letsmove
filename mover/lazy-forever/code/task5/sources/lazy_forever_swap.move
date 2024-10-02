/// Module: lazy_forever_swap
module lazy_forever_swap::lazy_forever_swap {
    use sui::balance::{Self, Balance};
    use sui::coin::{Self,Coin};
    use sui::transfer::{public_transfer, share_object, transfer};
    use sui::tx_context::sender;
    use lazy_forever_coin::lazy_forever_faucet::LAZY_FOREVER_FAUCET;
    use lazy_forever_coin::lazy_forever_coin::LAZY_FOREVER_COIN;

    public struct AdminCap has key{
        id :UID
    }

    public struct Bank has key {
        id : UID,
        coin_a : Balance<LAZY_FOREVER_COIN>,
        coin_b : Balance<LAZY_FOREVER_FAUCET>,
    }

    fun init(ctx: &mut TxContext){
        let bank = Bank{
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
        };

        share_object(bank);

        let admin_cap = AdminCap {id : object::new(ctx)};

        transfer(admin_cap, sender(ctx));
    }

    public entry fun deposit_coin_a(bank: &mut Bank, coin_a: Coin<LAZY_FOREVER_COIN>, _ctx: &mut TxContext){
        let coin_a_balance = coin::into_balance(coin_a);
        balance::join(&mut bank.coin_a, coin_a_balance);
    }
    public entry fun deposit_coin_b(bank: &mut Bank, coin_b: Coin<LAZY_FOREVER_FAUCET>, _ctx: &mut TxContext){
        let coin_b_balance = coin::into_balance(coin_b);
        balance::join(&mut bank.coin_b, coin_b_balance);
    }
    public entry fun withdraw_coin_a(_:&AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext){
        let coin_a_balance = balance::split(&mut bank.coin_a, amount);
        let coin_a = coin::from_balance(coin_a_balance,ctx);
        public_transfer(coin_a, sender(ctx));
    }
    public entry fun withdraw_coin_b(_:&AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext){
        let coin_b_balance = balance::split(&mut bank.coin_b, amount);
        let coin_b = coin::from_balance(coin_b_balance,ctx);
        public_transfer(coin_b, sender(ctx));
    }
    public entry fun a_swap_b(bank: &mut Bank, coin_a: Coin<LAZY_FOREVER_COIN>, ctx: &mut TxContext){
        let amount = coin::value(&coin_a);
        balance::join(&mut bank.coin_a, coin::into_balance(coin_a));
        let amount_after = amount * 2;
        let coin_b_balance = balance::split(&mut bank.coin_b, amount_after);
        public_transfer(coin::from_balance(coin_b_balance,ctx), sender(ctx));
    }
    public entry fun b_swap_a(bank: &mut Bank, coin_b: Coin<LAZY_FOREVER_FAUCET>, ctx: &mut TxContext){
        let amount = coin::value(&coin_b);
        balance::join(&mut bank.coin_b, coin::into_balance(coin_b));
        let amount_after = amount * 100000 / 200000;
        let coin_a_balance = balance::split(&mut bank.coin_a, amount_after);
        public_transfer(coin::from_balance(coin_a_balance,ctx), sender(ctx));
    }
}

