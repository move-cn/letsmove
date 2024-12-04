module task2::robbie_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    // use std::option;
    // use sui::tx_context::{Self, TxContext};
    // use sui::transfer::{Self, transfer};
    

    public struct ROBBIE_COIN has drop{

    }

    fun init(witness: ROBBIE_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<ROBBIE_COIN>(
            witness,
            6,
            b"RobbieCoin",
            b"ROBBIE_COIN",
            b"",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap:&mut TreasuryCap<ROBBIE_COIN>, amount:u64, recepient:address, ctx: &mut TxContext)
        {
        
        coin::mint_and_transfer(treasury_cap, amount, recepient, ctx);

    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ROBBIE_COIN>, 
        coin: Coin<ROBBIE_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}