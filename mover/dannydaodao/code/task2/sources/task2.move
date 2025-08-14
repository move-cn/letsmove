module task2::my_coin {
    use std::option::none;
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};
    use sui::transfer::{public_freeze_object, public_transfer};
    #[test_only]
    use sui::types;

    //一次性见证 1仅具有 drop 能力。2没有字段。3不是泛型类型。4以模块命名，字母全部大写。
    public struct MY_COIN has drop {}


    fun init(otw: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(
            otw, //one time witness
            6,
            b"DCOIN",
            b"DANNY_COIN",
            b"this is my first coin",
            none(),
            ctx
        );
        //冻结
        public_freeze_object(metadata);
        //转移所有权
        public_transfer(treasury_cap, ctx.sender());
    }

    // 铸造
    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    //销毁
    public fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        let otw = t2::my_coin::MY_COIN {};
        assert!(types::is_one_time_witness(&otw), 0);
        init(otw, ctx);
    }
}
