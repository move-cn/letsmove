module hellogaod_coin::hellogaod_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct HELLOGAOD_COIN has drop {}

    fun init(
        witness: HELLOGAOD_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<HELLOGAOD_COIN>(
            witness,
            9,
            b"HELLOGAOD",
            b"HELLOGAOD_COIN",
            b"HelloGaod Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://q3.itc.cn/images01/20250220/bd7183642f8a4f6285c9defb7f6bd409.jpeg"
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
        treasury_cap: &mut TreasuryCap<HELLOGAOD_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<HELLOGAOD_COIN>,
        coin: Coin<HELLOGAOD_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
