module cmdscz_coin::cmdscz_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct CMDSCZ_COIN has drop {}

    fun init(
        witness: CMDSCZ_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<CMDSCZ_COIN>(
            witness,
            9,
            b"CMDSCZ",
            b"CMDSCZ_COIN",
            b"CMDSCZ Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/169383631"
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
        treasury_cap: &mut TreasuryCap<CMDSCZ_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<CMDSCZ_COIN>,
        coin: Coin<CMDSCZ_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
