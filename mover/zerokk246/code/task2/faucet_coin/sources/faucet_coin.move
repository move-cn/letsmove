module faucet_coin::faucetcoin {
    use sui::coin;

    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"FAUCETCOIN", 
            b"FAUCETCOIN", 
            b"", 
            option::none(), 
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun request_coin(
        cap: &mut coin::TreasuryCap<FAUCETCOIN>,
        ctx: &mut tx_context::TxContext
    ) {
        coin::mint_and_transfer(cap, 1000, ctx.sender(), ctx);
    }

    #[test_only]
    public fun test_init_coin(ctx: &mut TxContext) {
        init(FAUCETCOIN {}, ctx);
    }
}

