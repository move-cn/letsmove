
module mycoin::mycoin {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MYCOIN has drop{}

    fun init (witness: MYCOIN, ctx: &mut TxContext) {
        let (cap, meta) = coin::create_currency<MYCOIN>(
            witness,
            8,
            b"ZHH4314 MYCOIN",
            b"ZHH4314",
            b"ZHH",
            option::none(),
            ctx);
        transfer::public_share_object(meta);
        // coin::mint_and_transfer<FAUCET>(&mut cap, 0xffffffff, tx_context::sender(ctx), ctx);
        transfer::public_share_object(cap);
    }
    public entry fun mint(cap: &mut coin::TreasuryCap<MYCOIN>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<MYCOIN>(cap, amount, recv, ctx);
    }
}


