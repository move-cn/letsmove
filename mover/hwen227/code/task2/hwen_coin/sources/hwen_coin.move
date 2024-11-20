module hwen_coin::hwen_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct HWEN_COIN has drop {}

    fun init(
        witness: HWEN_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<HWEN_COIN>(
            witness,
            9,
            b"HWEN",
            b"HWEN_COIN",
            b"HWEN Coin",
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
        treasury_cap: &mut TreasuryCap<HWEN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<HWEN_COIN>,
        coin: Coin<HWEN_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
