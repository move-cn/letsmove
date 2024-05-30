module task2::chenerge_faucet {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct CHENERGE_FAUCET has drop {}

    fun init(witness: CHENERGE_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 6, b"CHENERGE_FAUCET", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<CHENERGE_FAUCET>,
                          amount: u64,
                          ctx: &mut TxContext) {
        let to = tx_context::sender(ctx);
        coin::mint_and_transfer(treasury_cap, amount, to, ctx);
    }

    public entry fun mint_to(treasury_cap: &mut TreasuryCap<CHENERGE_FAUCET>,
                          amount: u64,
                          to: address,
                          ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, to, ctx);
    }


    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(CHENERGE_FAUCET {}, ctx)
    }
}
