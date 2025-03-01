module faucet_coin::taciturneyes2;

use sui::coin::{Self, TreasuryCap,mint_and_transfer};
use sui::url::{Self, Url};

public struct TACITURNEYES2 has drop {}

fun init(coin: TACITURNEYES2, ctx: &mut TxContext) {
    let url = option::some<Url>(
        url::new_unsafe_from_bytes(
            b"https://avatars.githubusercontent.com/u/77370454?v=4",
        ),
    );
    let (treasury, metadata) = coin::create_currency(
        coin,
        8,
        b"TACI",
        b"taciturneyes coin2",
        b"this is a taciturneyes coin",
        url,
        ctx,
    );
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury);
}

public entry fun mint<T>(
    treasury: &mut TreasuryCap<T>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
) {
    coin::mint_and_transfer(treasury, amount, recipient, ctx)
}

// Transaction Digest: F6an7ia3UgL8hJ3f2qbjfmoFUfJENxKLJizZEMsfKSQ9