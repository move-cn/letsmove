/*
/// Module: quantumae_coin
module quantumae_coin::quantumae_coin;
*/
module quantumae_coin::quantumae_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct QUANTUMAE_COIN has drop {}

    fun init(
        witness: QUANTUMAE_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<QUANTUMAE_COIN>(
            witness,
            9,
            b"QUANTUMAE",
            b"QUANTUMAE_COIN",
            b"Quantumae Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://github.com/Quantumae/all/blob/main/my_coin.png"
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
        treasury_cap: &mut TreasuryCap<QUANTUMAE_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<QUANTUMAE_COIN>,
        coin: Coin<QUANTUMAE_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
