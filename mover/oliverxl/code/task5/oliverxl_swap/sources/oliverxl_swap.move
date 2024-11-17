/// Module: oliverxl_swap
module oliverxl_swap::oliverxl_swap {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance};
    use sui::object;
    use sui::transfer::{share_object, transfer, public_transfer, public_share_object};
    use sui::tx_context::sender;
    use move_coin::oliverxl_coin::OLIVERXL_COIN;
    use move_coin::oliverxl_faucet::OLIVERXL_FAUCET;

    const ENotEnougholiverxlCoin : u64 = 0;
    const ENotEnougholiverxlFaucet : u64 = 1;

    public struct Bank has key {
        id : UID,
        oliverxl_coin : Balance<OLIVERXL_COIN>,
        oliverxl_faucet : Balance<OLIVERXL_FAUCET>,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            oliverxl_coin: balance::zero<OLIVERXL_COIN>(),
            oliverxl_faucet: balance::zero<OLIVERXL_FAUCET>()
        };
        share_object(bank);

        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer(admin_cap, sender(ctx));
    }


    public fun swap_to_oliverxl_coin_(bank: &mut Bank,in:Coin<OLIVERXL_FAUCET>,ctx: &mut TxContext) : Coin<OLIVERXL_COIN>{
        let in_value = coin::value(&in);

        let out_amt = in_value * 1u64  / 8u64  ;

        let bank_oliverxl_coin_amt = balance::value(&bank.oliverxl_coin);

        //先判断银行里面是否有足够数量的OLIVERXL_COIN兑换
        assert!(out_amt < bank_oliverxl_coin_amt,ENotEnougholiverxlCoin);

        // 把OLIVERXL_FAUCET存在银行
        balance::join(&mut bank.oliverxl_faucet, coin::into_balance(in));
        let out_balance =   balance::split(&mut bank.oliverxl_coin,out_amt);
        let out = from_balance(out_balance,ctx);
        out
    }

    public entry fun swap_to_oliverxl_coin(bank: &mut Bank, in: Coin<OLIVERXL_FAUCET>, ctx: &mut TxContext) {
        let coin = swap_to_oliverxl_coin_(bank, in, ctx);
        public_transfer(coin, sender(ctx));
    }


    public fun swap_to_oliverxl_faucet_(bank: &mut Bank,in:Coin<OLIVERXL_COIN>, ctx: &mut TxContext):Coin<OLIVERXL_FAUCET>{
        let in_value = coin::value(&in);

        let out_amt = in_value * 8u64 ;
        let bank_oliverxl_faucet_amt = balance::value(&bank.oliverxl_faucet);

        //先判断银行里面是否有足够数量的OLIVERXL_FAUCET兑换
        assert!(out_amt < bank_oliverxl_faucet_amt,ENotEnougholiverxlFaucet);

        // 把OLIVERXL_COIN存在银行
        balance::join(&mut bank.oliverxl_coin, coin::into_balance(in));
        // 从银行把OLIVERXL_FAUCET取出来
        let out_balance =   balance::split(&mut bank.oliverxl_faucet,out_amt);
        let out = from_balance(out_balance,ctx);

        out
    }

    public entry fun swap_to_oliverxl_faucet(bank: &mut Bank, in: Coin<OLIVERXL_COIN>, ctx: &mut TxContext) {
        let coin = swap_to_oliverxl_faucet_(bank, in, ctx);
        public_transfer(coin, sender(ctx));
    }



    public entry fun add_oliverxl_coin(bank: &mut Bank, in: Coin<OLIVERXL_COIN>, ctx: &mut TxContext) {
        let in_balance = coin::into_balance(in);
        balance::join(&mut bank.oliverxl_coin, in_balance);
    }


    public entry fun remove_oliverxl_coin( _:&AdminCap, bank: &mut Bank,amt:u64, ctx: &mut TxContext) {
        let out_balance =   balance::split(&mut bank.oliverxl_coin,amt);
        let out = coin::from_balance(out_balance, ctx);
        public_transfer(out, sender(ctx));
    }

    public entry fun add_oliverxl_faucet(bank: &mut Bank, in: Coin<OLIVERXL_FAUCET>, ctx: &mut TxContext) {
        let in_balance = coin::into_balance(in);
        balance::join(&mut bank.oliverxl_faucet, in_balance);
    }

    public entry fun remove_oliverxl_faucet( _:&AdminCap, bank: &mut Bank,amt:u64, ctx: &mut TxContext) {
        let out_balance =   balance::split(&mut bank.oliverxl_faucet,amt);
        let out = coin::from_balance(out_balance, ctx);
        public_transfer(out, sender(ctx));
    }

}
