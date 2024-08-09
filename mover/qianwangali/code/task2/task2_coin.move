module task_2::coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct COIN has drop {}

    fun init(witness: COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,
        6,
        b"Coin",
        b"MyCoin",
        b"this coin for Task2",
        option::none(),
        ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
        treasury: &mut TreasuryCap<COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ){
        let coin = coin::mint(treasury,amount,ctx);
        transfer::public_transfer(coin,recipient)
    }

    public fun burn(
        treasury: &mut TreasuryCap<COIN>,
        coin: Coin<COIN>,
    ){
        coin::burn(treasury,coin);
    }
}