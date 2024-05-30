module yty2024::yty2024_swap {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::object;
    use sui::object::UID;
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::tx_context::{TxContext, sender};
    use task2::yty2024_coin::YTY2024_COIN;
    use task2::yty2024_faucet_coin::YTY2024_FAUCET_COIN;


    public struct AdminCap has key {
        id: UID,
    }

    public struct Bank has key {
        id: UID,
        coin1: Balance<YTY2024_COIN>,
        coin2: Balance<YTY2024_FAUCET_COIN>
    }


    fun init(ctx: &mut TxContext) {

        let bank = Bank {
            id: object::new(ctx),
            coin1: balance::zero(),
            coin2: balance::zero()
        };

        share_object(bank);

        let admin_cap = AdminCap { id: object::new(ctx) };

        transfer(admin_cap, sender(ctx));
    }



    public entry fun deposit_coin1(bank:&mut Bank,coin1:Coin<YTY2024_COIN>,_:&mut TxContext){
        let coin1_balance = coin::into_balance(coin1);
        balance::join(&mut bank.coin1,coin1_balance);
    }

    public entry fun deposit_coin2(bank:&mut Bank,coin2:Coin<YTY2024_FAUCET_COIN>,_:&mut TxContext){
        let coin2_balance = coin::into_balance(coin2);
        balance::join(&mut bank.coin2,coin2_balance);
    }

    public entry fun withdraw_coin1(_:&AdminCap, bank:&mut Bank,amt:u64,ctx:&mut TxContext){
        let  coin1_balance = balance::split(&mut bank.coin1,amt);
        let coin1 = coin::from_balance(coin1_balance,ctx);
        public_transfer(coin1,sender(ctx));
    }


    /// 1 coin2 = 1 coin1
    public entry fun swap_coin1_coin2(bank: &mut Bank, coin1: Coin<YTY2024_COIN>, ctx: &mut TxContext) {
        let amt = coin::value(&coin1);

        balance::join(&mut bank.coin1, coin::into_balance(coin1));


        let coin2_balance = balance::split(&mut bank.coin2, amt);


        let coin2 = coin::from_balance(coin2_balance, ctx);

        public_transfer(coin2, sender(ctx));
    }

    public entry fun swap_coin2_coin1(bank: &mut Bank, coin2: Coin<YTY2024_FAUCET_COIN>, ctx: &mut TxContext) {
        let amt = coin::value(&coin2);

        balance::join(&mut bank.coin2, coin::into_balance(coin2));


        let coin1_balance = balance::split(&mut bank.coin1, amt);

        let coin1 = coin::from_balance(coin1_balance, ctx);

        public_transfer(coin1, sender(ctx));
    }

}