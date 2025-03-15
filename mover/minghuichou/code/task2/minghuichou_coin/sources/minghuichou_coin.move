/*
/// Module: minghuichou_coin
module minghuichou_coin::minghuichou_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module minghuichou_coin::minghuichou_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct MINGHUICHOU_COIN has drop {}

    fun init(
        witness: MINGHUICHOU_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<MINGHUICHOU_COIN>(
            witness,
            9,
            b"MINGHUICHOU",
            b"MINGHUICHOU_COIN",
            b"MINGHUICHOU Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/129301868?s=400&v=4"
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
        treasury_cap: &mut TreasuryCap<MINGHUICHOU_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MINGHUICHOU_COIN>,
        coin: Coin<MINGHUICHOU_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
