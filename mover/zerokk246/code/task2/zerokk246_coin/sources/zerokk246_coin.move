module zerokk246_coion::zerokkcoin {
    use sui::coin;

    public struct ZEROKKCOIN has drop {}

    fun init(witness: ZEROKKCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"ZEROKK", 
            b"ZEROKK", 
            b"zerokk coin", 
            option::none(), 
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }

    public entry fun mint(
        cap: &mut coin::TreasuryCap<ZEROKKCOIN>,
        value: u64,
        recipient: address,
        ctx: &mut tx_context::TxContext
    ) {
        coin::mint_and_transfer(cap, value, recipient, ctx);
    }

    public entry fun burn(
        cap: &mut coin::TreasuryCap<ZEROKKCOIN>,
        c: coin::Coin<ZEROKKCOIN>
    ): u64 {
        coin::burn(cap, c)
    }

    #[test_only]
    public fun test_init_coin(ctx: &mut TxContext) {
        init(ZEROKKCOIN {}, ctx);
    }
}