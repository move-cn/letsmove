module use std::option::some;

use sui::coin;
use sui::url;

move_coin::wjdq_faucet {

    public struct WJDQ_FAUCET has drop {}


    fun init(witness: WJDQ_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,
            18,
            b"wjdq faucet",
            b"wjdqFaucet",
            b"this is wjdq faucet",
            some(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/5901419")),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }
}
