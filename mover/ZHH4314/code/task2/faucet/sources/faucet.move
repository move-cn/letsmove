
module faucet::faucet {

    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCET has drop{}

    fun init (witness: FAUCET, ctx: &mut TxContext) {
        let (cap, meta) = coin::create_currency<FAUCET>(
            witness,
            8,
            b"ZHH4314 Faucet",
            b"ZHH4314",
            b"ZHH",
            option::none(),
            ctx);
        transfer::public_share_object(meta);
        // coin::mint_and_transfer<FAUCET>(&mut cap, 0xffffffff, tx_context::sender(ctx), ctx);
        transfer::public_share_object(cap);
    }
    public entry fun faucet(cap: &mut coin::TreasuryCap<FAUCET>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<FAUCET>(cap, amount, recv, ctx);
    }
}

