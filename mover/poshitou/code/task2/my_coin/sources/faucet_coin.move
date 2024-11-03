module my_coin::faucet_coin {

    use sui::coin;
    use sui::transfer;

    public struct FAUCET_COIN has drop {}


    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,
            b"faucet_coin",
            b"",
            b"",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(coin_metadata);

        transfer::public_share_object(treasury_cap);

    }
}
