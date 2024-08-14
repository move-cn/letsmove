module task2::faucet_coin {
    use std::option::none;
    use sui::coin;
    use sui::coin::{Coin, mint_and_transfer};
    use sui::transfer::{public_freeze_object, public_share_object};

    //一次性见证
    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(otw: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            2,
            b"FCNY",
            b"FAUCET_COIN",
            b"The second coin of FAUCET",
            none(),
            ctx,
        );
        public_freeze_object(metadata); //冻结币对象的元数据
        public_share_object(treasury_cap);//共享treasury_cap所有权
    }

    //铸币
    public fun mint(
        treasury_cap: &mut coin::TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext) {
        mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    //销毁
    public fun burn(treasury_cap: &mut coin::TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(FAUCET_COIN {}, ctx)
    }
}
