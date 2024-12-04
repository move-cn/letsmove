module faucet::antigone4224Faucet {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct ANTIGONE4224FAUCET has drop {}

    public struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: ANTIGONE4224FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"ANTIGONE4224FAUCET", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ANTIGONE4224FAUCET>,
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