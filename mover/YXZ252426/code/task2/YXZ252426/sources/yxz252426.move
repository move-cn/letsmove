/*
/// Module: yxz252426
module yxz252426::yxz252426;
*/
module yxz252426::yxz252426 {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct YXZ252426 has drop {}

    fun init(
        witness: YXZ252426,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<YXZ252426>(
            witness,
            9,
            b"YXZ",
            b"YXZ252426",
            b"YXZ Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/76983474"
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
        treasury_cap: &mut TreasuryCap<YXZ252426>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<YXZ252426>,
        coin: Coin<YXZ252426>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
