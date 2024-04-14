module simple_swap::coin_b {
    use sui::coin::{Self, TreasuryCap};

    public struct COIN_B has drop {}

    fun init(otw: COIN_B, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"coin_b",
            b"CB",
            b"coin_b to study simple swap",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<COIN_B>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}