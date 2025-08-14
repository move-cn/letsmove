module mycoin::Pithos23Coin {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::event::emit;
    use sui::tx_context::{Self, TxContext};

    struct PITHOS23COIN has drop {}

    struct MintEvent has copy, drop {
        amount: u64,
        recipient: address
    }

    fun init(witness: PITHOS23COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,
            6, b"Pithos23Coin", b"Pithos23Coin", b"Pithos23 Coin des", option::none(), ctx);

        //初始资金：1000000
        coin::mint_and_transfer(&mut treasury, 1000000, tx_context::sender(ctx), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    // 铸币
    entry fun mint(treasury_cap: &mut TreasuryCap<PITHOS23COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
        emit(MintEvent {
            amount,
            recipient
        });
    }
}