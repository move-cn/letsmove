module sony9997_coin::sony9997_coin {
        use sui::coin::{Self, Coin, TreasuryCap};
        use sui::transfer;
        use sui::tx_context::{Self, TxContext};

        public struct SONY9997_COIN has drop {}

        fun init(witness: SONY9997_COIN, ctx: &mut TxContext) {
            let (treasury, metadata) = coin::create_currency(witness, 6, b"SONY9997_COIN", b"S9C", b"", option::none(), ctx);
            transfer::public_freeze_object(metadata);
            transfer::public_transfer(treasury, tx_context::sender(ctx))
        }

        public fun mint(
        treasury_cap: &mut TreasuryCap<SONY9997_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}