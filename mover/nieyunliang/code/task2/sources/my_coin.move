module task2::nyl_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer::{public_freeze_object, public_transfer};

    public struct NYL_COIN has drop {}

    fun init(witness: NYL_COIN, ctx: &mut TxContext) {
        let (treasuryCap, metadata) = coin::create_currency(
            witness,
            9,
            b"NYL",
            b"nyl",
            b"my coin",
            option::none(),
            ctx
        );
        public_freeze_object(metadata);
        public_transfer(treasuryCap, ctx.sender());
    }

    public entry fun mint(cap: &mut TreasuryCap<NYL_COIN>, amout: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(cap, amout, ctx);
        public_transfer(coin, recipient);
    }
}