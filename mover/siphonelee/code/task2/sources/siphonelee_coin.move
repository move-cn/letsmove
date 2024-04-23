module two_coins::siphonelee_coin {
    use sui::tx_context::sender;
    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};

    public struct SIPHONELEE_COIN has drop {} 

    fun init(_witness: SIPHONELEE_COIN, ctx: &mut TxContext) {
        let (mut treasury_cap, metadata) = coin::create_currency(_witness, 6, b" SIPHONELEE-COIN", b"SIPHONE", b"the coin of siphonelee", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        // initial mint
        coin::mint_and_transfer(&mut treasury_cap, 1000000000000, sender(ctx), ctx);
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    public fun mint(treasury_cap: &mut TreasuryCap<SIPHONELEE_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<SIPHONELEE_COIN>, coin: Coin<SIPHONELEE_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(SIPHONELEE_COIN {}, ctx)
    }
}
