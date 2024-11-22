
/// Module: brainsk
module brainsk::brainsk{
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::transfer::{Self, transfer, share_object, public_transfer};
    use mycoin::mycoin::MYCOIN;
    use faucetcoin::faucetcoin::FAUCETCOIN;
    use sui::tx_context::sender;

    public struct BrainskSwapBank has key {
        id: UID,
        faucetcoin: Balance<FAUCETCOIN>,
        mycoin: Balance<MYCOIN>,
        mc_prop: u64,
        fc_prop: u64
    }

    public struct AdaminCap has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let bank = BrainskSwapBank {
            id: object::new(ctx),
            faucetcoin: balance::zero<FAUCETCOIN>(),
            mycoin: balance::zero<MYCOIN>(),
            mc_prop: 1000,
            fc_prop: 7300
        };
        share_object(bank);
        let adamin_cap = AdaminCap {
            id: object::new(ctx)
        };
        transfer(adamin_cap, sender(ctx));
    }

    public entry fun deposit_mycoin(bank: &mut BrainskSwapBank, mycoin: Coin<MYCOIN>, _ctx: &mut TxContext) {
        let balance = coin::into_balance(mycoin);
        bank.mycoin.join(balance);
    }

    public entry fun deposit_faucetcoin(bank: &mut BrainskSwapBank, faucetcoin: Coin<FAUCETCOIN>, _ctx: &mut TxContext) {
        let balance = coin::into_balance(faucetcoin);
        bank.faucetcoin.join(balance);
    }

    public entry fun withdraw_mycoin(_: &AdaminCap, bank: &mut BrainskSwapBank, amount: u64, ctx: &mut TxContext) {
        let amount = bank.mycoin.split(amount);
        let mycoin = coin::from_balance(amount, ctx);
        public_transfer(mycoin, sender(ctx));
    }

    public entry fun withdraw_faucetcoin(_: &AdaminCap, bank: &mut BrainskSwapBank, amount: u64, ctx: &mut TxContext) {
        let amount = bank.mycoin.split(amount);
        let mycoin = coin::from_balance(amount, ctx);
        public_transfer(mycoin, sender(ctx));
    }

    public entry fun faucte_swap_my(bank: &mut BrainskSwapBank, faucetcoin: Coin<FAUCETCOIN>, ctx: &mut TxContext) {
        let fc_balance = faucetcoin.into_balance();
        let fc_amt = fc_balance.value();
        let mc_amt = bank.mycoin.split(fc_amt * bank.mc_prop / bank.fc_prop);
        bank.faucetcoin.join(fc_balance);
        public_transfer(coin::from_balance(mc_amt, ctx), sender(ctx));
    }

    public entry fun my_swap_faucet(bank: &mut BrainskSwapBank, mycoin: Coin<MYCOIN>, ctx: &mut TxContext) {
        let mc_balance = mycoin.into_balance();
        let mc_amt = mc_balance.value();
        let fc_amt = bank.faucetcoin.split(mc_amt * bank.fc_prop / bank.mc_prop);
        bank.mycoin.join(mc_balance);
        public_transfer(coin::from_balance(fc_amt, ctx), sender(ctx));
    }
}

