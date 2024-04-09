/// Module: 02coin
module coin2::mycoin {
    use sui::coin::{Self,TreasuryCap};

    public struct MYCOIN has drop {}

    fun init(waitness: MYCOIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(waitness,6,b"MY", b"MY", b"", option::none(), ctx);

        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}

