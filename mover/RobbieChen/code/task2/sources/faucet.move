module task2::robbie_faucet_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    // use std::option;
    // use sui::tx_context::{Self, TxContext};
    // use sui::transfer::{Self, transfer};
    

    public struct ROBBIE_FAUCET_COIN has drop{

    }

    fun init(witness: ROBBIE_FAUCET_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<ROBBIE_FAUCET_COIN>(
            witness,
            6,
            b"RobbieFaucetCoin",
            b"ROBBIE_FAUCET_COIN",
            b"",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap:&mut TreasuryCap<ROBBIE_FAUCET_COIN>, amount:u64, recepient:address, ctx: &mut TxContext)
        {
        
        coin::mint_and_transfer(treasury_cap, amount, recepient, ctx);

    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ROBBIE_FAUCET_COIN>, 
        coin: Coin<ROBBIE_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}