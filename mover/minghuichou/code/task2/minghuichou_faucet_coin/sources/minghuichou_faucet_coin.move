/*
/// Module: minghuichou_faucet_coin
module minghuichou_faucet_coin::minghuichou_faucet_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module minghuichou_faucet_coin::minghuichou_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct MINGHUICHOU_FAUCET_COIN has drop {}

    fun init(
        witness: MINGHUICHOU_FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<MINGHUICHOU_FAUCET_COIN>(
            witness,
            9,
            b"CRF",
            b"MINGHUICHOU_FAUCET_COIN",
            b"minghuichou Faucet Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/129301868?s=400&v=4"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MINGHUICHOU_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MINGHUICHOU_FAUCET_COIN>,
        coin: Coin<MINGHUICHOU_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}


