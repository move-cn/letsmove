module guoying2026::swap{
    use faucet_coin::rmb::RMB;
    use my_coin::gy::GY;
    use sui::balance::{ Balance, zero};
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::transfer::{share_object, transfer, public_transfer};

    public struct Bank has key {
        id: UID,
        gy: Balance<GY>,
        rmb: Balance<RMB>,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(_ctx: &mut TxContext){
        let bank = Bank {
            id: object::new(_ctx),
            gy: zero(),
            rmb: zero(),
        };
        share_object(bank);
        let _admin_cap = AdminCap {
            id: object::new(_ctx),
        };

        transfer(_admin_cap, _ctx.sender())
    }

    //怎么存钱
    public fun add_gy(bank:&mut Bank, _in: Coin<GY>, _ctx: &mut TxContext) {
        bank.gy.join(into_balance(_in));
    }
    public fun add_rmb(bank: &mut Bank, _in: Coin<RMB>, _ctx: &mut TxContext) {
        bank.rmb.join(into_balance(_in));
    }

    //怎么交换
    public fun gy_to_rmb(bank: &mut Bank, _in: Coin<GY>, _ctx: &mut TxContext){
        let _gy_amount = _in.value();
        let _rmb_amount = _gy_amount * 2000 / 1000;

        bank.gy.join(into_balance(_in));

        let _rmb_new= bank.rmb.split(_rmb_amount);

        public_transfer(from_balance(_rmb_new,_ctx), _ctx.sender());
    }

    public fun rmb_to_gy(bank: &mut Bank, _in: Coin<RMB>, _ctx: &mut TxContext){
        let _rmb_amount = _in.value();
        let _gy_amount = _rmb_amount * 1000 / 2000;

        bank.rmb.join(into_balance(_in));

        let _gy_new = bank.gy.split(_gy_amount);

        public_transfer(from_balance(_gy_new, _ctx), _ctx.sender());
    }

    //怎么取钱
    public fun remove_rmb(_:&AdminCap,bank: &mut Bank, amt: u64, _ctx: &mut TxContext) {
        let _out = bank.rmb.split(amt);
        public_transfer(from_balance(_out, _ctx), _ctx.sender());
    }

    public fun remove_gy(_:&AdminCap,bank: &mut Bank, amt: u64, _ctx: &mut TxContext) {
        let _out = bank.gy.split(amt);
        public_transfer(from_balance(_out, _ctx), _ctx.sender());
    }
}