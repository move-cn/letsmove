module task2::my_coin;

use sui::coin;

public struct MY_COIN has drop {}

fun init(otw: MY_COIN, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = coin::create_currency(
        otw,
        9,
        b"xiaxianlin",
        b"xiaxianlin",
        b"this is my  coin",
        option::none(),
        ctx,
    );
    transfer::public_freeze_object(coin_metadata);
    transfer::public_transfer(treasury_cap, ctx.sender());
}
