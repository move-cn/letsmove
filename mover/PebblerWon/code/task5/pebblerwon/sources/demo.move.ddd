module swap::swap {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::object;
    use sui::object::UID;
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::tx_context::{TxContext, sender};
    use coin_owner::usd::USD;
    use coin_owner::rmb::RMB;


    public struct AdminCap has key {
        id: UID,
    }

    public struct Bank has key {
        id: UID,
        rmb: Balance<RMB>,
        usd: Balance<USD>
    }


    fun init(ctx: &mut TxContext) {

        let bank = Bank {
            id: object::new(ctx),
            rmb: balance::zero<>(),
            usd: balance::zero<>()
        };

        share_object(bank);

        let admin_cap = AdminCap { id: object::new(ctx) };

        transfer(admin_cap, sender(ctx));
    }



    public entry fun deposit_rmb(bank:&mut Bank,rmb:Coin<RMB>,_:&mut TxContext){
        let rmb_balance = coin::into_balance(rmb);
        bank.rmb.join(rmb_balance);
    }

    public entry fun deposit_usd(bank:&mut Bank,usd:Coin<USD>,_:&mut TxContext){
        let usd_balance = coin::into_balance(usd);
        bank.usd.join(usd_balance);
    }

    public entry fun withdraw_rmb(_:&AdminCap, bank:&mut Bank,amt:u64,ctx:&mut TxContext){
        let  rmb_balance = bank.rmb.split(amt);
        let rmb = coin::from_balance(rmb_balance,ctx);
        public_transfer(rmb,sender(ctx));
    }


    /// 1 usd = 1 rmb
    public entry fun swap_rmb_usd(bank: &mut Bank, rmb: Coin<RMB>, ctx: &mut TxContext) {
        let amt = rmb.value();

        bank.rmb.join(coin::into_balance(rmb));


        let amt_usd = amt * 10000 / 73000 ;


        let usd_balance = bank.usd.split(amt_usd);


        let usd = coin::from_balance(usd_balance, ctx);

        public_transfer(usd, sender(ctx));
    }

    public entry fun swap_usd_rmb(bank: &mut Bank, usd: Coin<USD>, ctx: &mut TxContext) {
        let amt = usd.value();

        bank.usd.join(coin::into_balance(usd));


        let amt_rmb = amt * 73000 / 10000;


        let rmb_balance = bank.rmb.split(amt_rmb);

        let rmb = coin::from_balance(rmb_balance, ctx);

        public_transfer(rmb, sender(ctx));
    }

}