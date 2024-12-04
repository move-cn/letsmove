module task2::my_coin {
    use sui::coin;
    use sui::url::new_unsafe_from_bytes;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"MYCOIN",
            b"MY COIN",
            b"One Test Coin",
            option::some(new_unsafe_from_bytes(b"https://4odpd2o2yyiplzw6rnulbrtbrirtkl73dfkxmueoldpyrhrrni2a.arweave.net/44bx6drGEPXm3otosMZhiiM1L_sZVXZQjljfiJ4xajQ")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }
}
