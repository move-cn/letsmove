module task5::coin_b {
    use sui::coin::{Self, TreasuryCap};

    public struct COIN_B has drop {}

    fun init(witness: COIN_B, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"coin_b",
            b"CB",
            b"my coin b",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    entry fun mint(treasury: &mut TreasuryCap<COIN_B>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}
