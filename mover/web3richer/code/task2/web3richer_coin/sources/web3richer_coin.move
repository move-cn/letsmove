module web3richer_coin::web3richer_coin {

    use sui::coin;
    use sui::coin::TreasuryCap;

    public struct WEB3RICHER_COIN has drop{}

    fun init(witness: WEB3RICHER_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(
            witness,
            8,
            b"WRC",
            b"Web3Richer Coin",
            b"the coin for web3richer",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender());
    }

    public entry fun mint(treasury: &mut TreasuryCap<WEB3RICHER_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }


    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(WEB3RICHER_COIN {}, ctx)
    }

}