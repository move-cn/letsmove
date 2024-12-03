module suiceber_coin::suiceber_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct SUICEBER_COIN has drop {}

    fun init(
        witness: SUICEBER_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<SUICEBER_COIN>(
            witness,
            9,
            b"SUICEBER",
            b"SUICEBER_COIN",
            b"Suiceber Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/182899206?v=4&size=64"
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
        treasury_cap: &mut TreasuryCap<SUICEBER_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<SUICEBER_COIN>,
        coin: Coin<SUICEBER_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}