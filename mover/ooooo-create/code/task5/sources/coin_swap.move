module coin_swap::coin_swap {

    use sui::object;
    use sui::object::UID;
    use hello_coins::faucetcoin::FAUCETCOIN;
    use hello_coins::mycoin::MYCOIN;
    use sui::balance::{Self,Balance};
    use sui::coin::{Self,Coin};
    use sui::transfer;
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::{Self,TxContext};

    public struct AdminCap has key {id: UID }

    public struct Bank has key,store {
        id: UID,
        my_coin: Balance<MYCOIN>,
        faucet_coin: Balance<FAUCETCOIN>
    }

    fun init(ctx: &mut TxContext){
        let bank = Bank {
            id: object::new(ctx),
            my_coin: balance::zero<MYCOIN>(),
            faucet_coin: balance::zero<FAUCETCOIN>()
        };

        share_object(bank);

        let admincap = AdminCap{id: object::new(ctx)};

        transfer::transfer(admincap,tx_context::sender(ctx));

    }

    public entry fun deposit_mycoin(bank:&mut Bank, mycoin:Coin<MYCOIN>, _:&mut TxContext){
        let coin_balance = coin::into_balance(mycoin);
        balance::join(&mut bank.my_coin,coin_balance);
    }
    public entry fun deposit_faucet(bank:&mut Bank, faucetcoin:Coin<FAUCETCOIN>, _:&mut TxContext){
        let coin_balance = coin::into_balance(faucetcoin);
        balance::join(&mut bank.faucet_coin,coin_balance);
    }

    public entry fun withdraw_mycoin(_:&AdminCap,bank:&mut Bank,amount:u64,ctx:&mut TxContext){
        let coin_balance = balance::split(&mut bank.my_coin,amount);
        let out_coin = coin::from_balance(coin_balance,ctx);
        public_transfer(out_coin,tx_context::sender(ctx));

    }

    public entry fun withdraw_fauect(_:&AdminCap,bank:&mut Bank,amount:u64,ctx:&mut TxContext){
        let coin_balance = balance::split(&mut bank.faucet_coin,amount);
        let out_coin = coin::from_balance(coin_balance,ctx);
        public_transfer(out_coin,tx_context::sender(ctx));

    }

    public entry fun swap_mycoin_to_faucet(bank:&mut Bank,mycoin: Coin<MYCOIN>,ctx:&mut TxContext){
        let coin_value = coin::value(&mycoin);
        balance::join(&mut bank.my_coin,coin::into_balance(mycoin));

        let fauect_value = coin_value * 10;

        let fauect_balence = balance::split(&mut bank.faucet_coin,fauect_value);

        let fauect_coin = coin::from_balance(fauect_balence,ctx);
        public_transfer(fauect_coin,tx_context::sender(ctx));
    }

    public entry fun mycoin(bank:&mut Bank,faucetcoin: Coin<FAUCETCOIN>,ctx:&mut TxContext){
        let faucet_value = coin::value(&faucetcoin);
        balance::join(&mut bank.faucet_coin,coin::into_balance(faucetcoin));

        let coin_value = faucet_value * (10000/100000);

        let coin_balence = balance::split(&mut bank.my_coin,coin_value);

        let mycoin = coin::from_balance(coin_balence,ctx);
        public_transfer(mycoin,tx_context::sender(ctx));
    }
}

