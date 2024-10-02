module swap::coin_b {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct COIN_B has drop {}

    fun init(witness: COIN_B, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COIN_B>(
            witness,
            3,
            b"COIN_B",
            b"CB",
            b"coin_b",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_B>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_B>, coin: Coin<COIN_B>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(COIN_B {}, ctx);
    }
}