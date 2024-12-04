module web3cl_swap::swap_task2coin {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance};
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use faucet_coin::faucet_coin::FAUCET_COIN;
    use my_coin::my_coin::MY_COIN;

    public struct Bank has key {
        id: object::UID,
        coin1: Balance<FAUCET_COIN>,
        coin2: Balance<MY_COIN>,
    }

    public struct AdminCap has key {
        id: object::UID,
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            coin1: balance::zero<FAUCET_COIN>(),
            coin2: balance::zero<MY_COIN>()
        };
        share_object(bank);

        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer(admin_cap, sender(ctx));
    }


    public fun swap_coin1_coin2_(bank: &mut Bank, in:Coin<FAUCET_COIN>,ctx: &mut TxContext):Coin<MY_COIN>{
        let in_value = coin::value(&in);
        // the exchange rate is coin1:coin2 = 3:200
        let out_amt = in_value * 200u64 / 3u64;

        balance::join(&mut bank.coin1, coin::into_balance(in));
        let out_balance =  balance::split(&mut bank.coin2, out_amt);
        let out = from_balance(out_balance, ctx);
        out
    }

    public entry fun swap_coin1_coin2(bank: &mut Bank, in: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
        let coin = swap_coin1_coin2_(bank, in, ctx);
        public_transfer(coin, sender(ctx));
    }


    public fun swap_coin2_coin1_(bank: &mut Bank,in:Coin<MY_COIN>, ctx: &mut TxContext):Coin<FAUCET_COIN>{
        let in_value = coin::value(&in);
        let out_amt = in_value * 3u64  / 200u64  ;
        
        balance::join(&mut bank.coin2, coin::into_balance(in));
        
        let out_balance =  balance::split(&mut bank.coin1, out_amt);
        let out = from_balance(out_balance,ctx);

        out
    }

    public entry fun swap_coin2_coin1(bank: &mut Bank, in: Coin<MY_COIN>, ctx: &mut TxContext) {
        let coin = swap_coin2_coin1_(bank, in, ctx);
        public_transfer(coin, sender(ctx));
    }



    public entry fun add_coin1(bank: &mut Bank, in: Coin<FAUCET_COIN>, _ctx: &mut TxContext) {
        let in_balance = coin::into_balance(in);
        balance::join(&mut bank.coin1, in_balance);
    }


    public entry fun remove_coin1( _:&AdminCap, bank: &mut Bank,amt:u64, ctx: &mut TxContext) {
          let out_balance = balance::split(&mut bank.coin1, amt);
          let out = coin::from_balance(out_balance, ctx);
          public_transfer(out, sender(ctx));
    }

    public entry fun add_coin2(bank: &mut Bank, in: Coin<MY_COIN>, _ctx: &mut TxContext) {
        let in_balance = coin::into_balance(in);
        balance::join(&mut bank.coin2, in_balance);
    }

    public entry fun remove_coin2( _:&AdminCap, bank: &mut Bank,amt:u64, ctx: &mut TxContext) {
        let out_balance =  balance::split(&mut bank.coin2, amt);
        let out = coin::from_balance(out_balance, ctx);
        public_transfer(out, sender(ctx));
    }

}