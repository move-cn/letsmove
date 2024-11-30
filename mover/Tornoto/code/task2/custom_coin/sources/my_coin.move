/// Module: custom_coin
module custom_coin::MY_COIN;
use sui::coin;
use sui::coin::TreasuryCap;

public struct MY_COIN has drop {}

fun init(witness: MY_COIN, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = coin::create_currency(
        witness,
        6,
        b"Fc",
        b"fish_coin",
        b"you fish, your fish",
        option::none(),
        ctx
    );
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    transfer::public_freeze_object(coin_metadata);
}

public
fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>,
         amount: u64,
         recipient: address,
         ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
}
