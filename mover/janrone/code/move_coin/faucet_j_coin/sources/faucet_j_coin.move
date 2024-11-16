/*
/// Module: faucet_j_coin
module faucet_j_coin::faucet_j_coin;
*/
module faucet_j_coin::faucet_j_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct FAUCET_J_COIN has drop {}

    fun init(
        witness: FAUCET_J_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCET_J_COIN>(
            witness,
            9,
            b"CRF",
            b"FAUCET_COIN",
            b"Janrone Faucet Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/1483883"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_J_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<FAUCET_J_COIN>,
        coin: Coin<FAUCET_J_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}
