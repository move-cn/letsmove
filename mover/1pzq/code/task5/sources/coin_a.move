module swap::coin_a {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct COIN_A has drop {}

    fun init(witness: COIN_A, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COIN_A>(
            witness,
            3,
            b"COIN_A",
            b"CA",
            b"coin_A",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_A>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_A>, coin: Coin<COIN_A>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(COIN_A {}, ctx);
    }
}