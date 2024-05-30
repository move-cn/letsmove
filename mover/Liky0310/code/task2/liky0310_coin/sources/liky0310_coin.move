module liky0310_coin::liky0310_coin {
        use std::option;
        use sui::coin::{Self, Coin, TreasuryCap};
        use sui::transfer;
        use sui::tx_context::{Self, TxContext};

        public struct LIKY0310_COIN has drop {}

        fun init(witness: LIKY0310_COIN, ctx: &mut TxContext) {
            let (treasury, metadata) = coin::create_currency(witness, 6, b"LIKY0310_COIN", b"LC", b"", option::none(), ctx);
            transfer::public_freeze_object(metadata);
            transfer::public_transfer(treasury, tx_context::sender(ctx))
        }

        public fun mint(
        treasury_cap: &mut TreasuryCap<LIKY0310_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}