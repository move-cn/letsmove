/*
/// Author: Janrone
/// Module: j_coin
module j_coin::j_coin;
*/

module j_coin::j_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct J_COIN has drop {}

    fun init(
        witness: J_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<J_COIN>(
            witness,
            9,
            b"J",
            b"J_COIN",
            b"Janreon's Move Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/1483883"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(
            treasury_cap,
            tx_context::sender(ctx)
        )
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<J_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<J_COIN>,
        coin: Coin<J_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
