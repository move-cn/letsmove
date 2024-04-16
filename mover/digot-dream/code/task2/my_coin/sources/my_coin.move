
/// Module: my_coin
module my_coin::my_coin {

    use sui::coin::{Self, Coin, TreasuryCap};
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    ///Visibility annotations are required on struct declarations from the Move 2024 edition onwards.
    public struct MY_COIN has drop {}


    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(
            witness, 
            2, 
            b"$$", 
            b"digot-dream_coin", 
            b"power by digot-dream", 
            option::none(), 
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        coin::burn(treasury_cap, coin);
    }


}

