module my_coin::taciturneyes;

use sui::coin::{Self, TreasuryCap,mint_and_transfer};
use sui::url::{Self, Url};

public struct TACITURNEYES has drop {}

fun init(coin: TACITURNEYES, ctx: &mut TxContext) {
    let url = option::some<Url>(
        url::new_unsafe_from_bytes(
            b"https://avatars.githubusercontent.com/u/77370454?v=4",
        ),
    );
    let (treasury, metadata) = coin::create_currency(
        coin,
        8,
        b"TACI",
        b"taciturneyes coin",
        b"this is a taciturneyes coin",
        url,
        ctx,
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, ctx.sender());
}

public entry fun mint<T>(
    treasury: &mut TreasuryCap<T>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
) {
    coin::mint_and_transfer(treasury, amount, recipient, ctx)
}

// Transaction Digest: DZ6zriqEzytASo8SpYxjo764QqhzmXx46NJdzeMGe8LJ