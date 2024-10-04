/// Module: dcwon
module dcwon::dcwon {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::transfer::{Self, transfer, share_object, public_transfer};
    use mycoin::mycoin::MYCOIN;
    use faucetcoin::faucetcoin::FAUCETCOIN;
    use sui::tx_context::sender;

    public struct Bank has key {
        id: UID,
        mycoin: Balance<MYCOIN>,
        faucetcoin: Balance<FAUCETCOIN>,
        mc_prop: u64,
        fc_prop: u64
    }

    public struct AdaminCap has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            mycoin: balance::zero<MYCOIN>(),
            faucetcoin: balance::zero<FAUCETCOIN>(),
            mc_prop: 1000,   // mc : fc = mc_prop : fc_prop
            fc_prop: 7300
        };
        share_object(bank);
        let adamin_cap = AdaminCap {
            id: object::new(ctx)
        };
        transfer(adamin_cap, sender(ctx));
    }

    public fun deposit_mycoin(bank: &mut Bank, mycoin: Coin<MYCOIN>, _ctx: &mut TxContext) {
        let balance = coin::into_balance(mycoin);
        bank.mycoin.join(balance);
    }

    public fun deposit_faucetcoin(bank: &mut Bank, faucetcoin: Coin<FAUCETCOIN>, _ctx: &mut TxContext) {
        let balance = coin::into_balance(faucetcoin);
        bank.faucetcoin.join(balance);
    }

    public fun withdraw_mycoin(_: &AdaminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let amount = bank.mycoin.split(amount);
        let mycoin = coin::from_balance(amount, ctx);
        public_transfer(mycoin, sender(ctx));
    }

    public fun withdraw_faucetcoin(_: &AdaminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let amount = bank.mycoin.split(amount);
        let mycoin = coin::from_balance(amount, ctx);
        public_transfer(mycoin, sender(ctx));
    }

    public fun swap_mycoin(bank: &mut Bank, faucetcoin: Coin<FAUCETCOIN>, ctx: &mut TxContext) {
        let fc_balance = faucetcoin.into_balance();
        let fc_amt = fc_balance.value();
        let mc_amt = bank.mycoin.split(fc_amt * bank.mc_prop / bank.fc_prop);
        bank.faucetcoin.join(fc_balance);
        public_transfer(coin::from_balance(mc_amt, ctx), sender(ctx));
    }

    public fun swap_faucetcoin(bank: &mut Bank, mycoin: Coin<MYCOIN>, ctx: &mut TxContext) {
        let mc_balance = mycoin.into_balance();
        let mc_amt = mc_balance.value();
        let fc_amt = bank.faucetcoin.split(mc_amt * bank.fc_prop / bank.mc_prop);
        bank.mycoin.join(mc_balance);
        public_transfer(coin::from_balance(fc_amt, ctx), sender(ctx));
    }

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(ctx);
    }
}

