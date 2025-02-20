module task2::faucet_coin;

use sui::coin;

public struct FAUCET_COIN has drop {}

fun init(otw: FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = coin::create_currency(
        otw,
        9,
        b"xiaxianlinFaucet",
        b"xiaxianlinFaucet",
        b"this is my faucet coin",
        option::none(),
        ctx,
    );
    transfer::public_freeze_object(coin_metadata);
    transfer::public_share_object(treasury_cap);
}
