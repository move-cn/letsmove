module coin::my_coin {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MY_COIN has drop {}

    public struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(
            witness,
            2,
            b"MY_COIN",
            b"MC",
            b"learning for letsmove, power by alva-lin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    

        emit(MintEvent{
            amount,
            recipient
        })
    }

}