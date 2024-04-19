module task5::coin_a {
    use sui::coin::{Self, TreasuryCap};

    public struct COIN_A has drop {}

    fun init(witness: COIN_A, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"coin_a",
            b"CA",
            b"my coin a",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    entry fun mint(treasury: &mut TreasuryCap<COIN_A>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}
