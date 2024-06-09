/// Module: task2
module task2::TuYv {
    use sui::coin::{Self,Coin,TreasuryCap};
    use std::option::{none};

    //定义一个有drop能力的结构体,使其符合witness模式
    //todo 这里有个很神奇的地方 结构体必须全大写 而且和module一致
    public struct TUYV has drop{}

    fun init(witness: TUYV, ctx: &mut TxContext ) {
        let(treasuryCap, coinMetadata) = coin::create_currency<TUYV>(
            witness,
            2,
            b"TY",
            b"TuYv Coin",
            b"god bless you",
            none(),
            ctx
        );
        //freeze_object是不可变的共享对象,这样币的元信息就是可见但不可变的了
        transfer::public_freeze_object(coinMetadata);
        transfer::public_transfer(treasuryCap, tx_context::sender(ctx));
    }

    /**
    * 传入代币的treasuryCap,mint的金额, 接收的地址
    */
    public fun mint(treasury_cap: &mut TreasuryCap<TUYV>,
                    amount: u64,
                    recipient: address,
                    ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<TUYV>, coin: Coin<TUYV>) {
        coin::burn(treasury_cap, coin);
    }
}
