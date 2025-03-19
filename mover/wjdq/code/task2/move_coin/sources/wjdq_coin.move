module use std::option::some;

use sui::coin;
use sui::url;

move_coin::wjdq_coin {
    public struct WJDQ_COIN has drop {}


    fun init(witness: WJDQ_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,
            18,
            b"wjdq",
            b"wjdqCoin",
            b"this is wjdq coin",
            some(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/5901419")),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}
