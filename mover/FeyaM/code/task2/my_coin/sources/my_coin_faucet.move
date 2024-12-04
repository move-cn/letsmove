module my_coin::feya_coin_faucet {
    use sui::coin::{Self, TreasuryCap};

    public struct FEYA_COIN_FAUCET has drop {}

    fun init(witness: FEYA_COIN_FAUCET, ctx: &mut TxContext) {

        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            9,
            b"FYCF",
            b"FeyaM Coin Faucet",
            b"Feya's first faucet coin.",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(coin_metadata);

        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FEYA_COIN_FAUCET>,
        value: u64,
        to: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, value, to, ctx);
    }
}