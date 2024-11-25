/*
/// Module: mmaa666_faucet_coin
module mmaa666_faucet_coin::mmaa666_faucet_coin;
*/
module mmaa666_faucet_coin::mmaa666_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct MMAA666_FAUCET_COIN has drop {}

    fun init(
        witness: MMAA666_FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<MMAA666_FAUCET_COIN>(
            witness,
            9,
            b"CRF",
            b"MMAA666_FAUCET_COIN",
            b"mmaa666 faucet coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"wu"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MMAA666_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MMAA666_FAUCET_COIN>,
        coin: Coin<MMAA666_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}