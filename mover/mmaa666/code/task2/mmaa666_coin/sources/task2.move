/*
/// Module: task2
module task2::task2;
*/
module task2::mmaa666_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct MMAA666_COIN has drop {}

    fun init(
        witness: MMAA666_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<MMAA666_COIN>(
            witness,
            9,
            b"MMAA666",
            b"MMAA666_COIN",
            b"mmaa666 Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"wu"
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
        treasury_cap: &mut TreasuryCap<MMAA666_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MMAA666_COIN>,
        coin: Coin<MMAA666_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}