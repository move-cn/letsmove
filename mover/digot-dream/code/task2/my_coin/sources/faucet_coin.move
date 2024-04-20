module my_coin::faucet_coin {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCET_COIN has drop {}

    public struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            2, 
            b"$$", 
            b"digot-dream_faucet", 
            b"power by digot-dream", 
            option::none(), 
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);

        emit(MintEvent{
            amount,
            recipient
        })
    }
}