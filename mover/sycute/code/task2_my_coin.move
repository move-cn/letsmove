module task_two::my_coin {
    use std::option;
    use sui::coin::{Self,  TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MY_COIN has drop {}

    // events
    struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"MY_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
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