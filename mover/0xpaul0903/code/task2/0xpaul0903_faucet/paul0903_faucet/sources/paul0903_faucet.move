module paul0903_faucet::paul0903_faucet{  

    use sui::tx_context::{TxContext};
    use sui::transfer;
    use sui::coin::{Self, Coin, TreasuryCap, CoinMetadata};
    use std::option::{none};
    use std::ascii;
    use std::string;

    public struct PAUL0903_FAUCET has drop{}

    #[allow(lint(share_owned))]
    fun init (otw: PAUL0903_FAUCET, ctx: &mut TxContext){
        let (treasuryCap, coinMetadata) = coin::create_currency(
            otw, // witness
            10, // decimals
            b"PAUL FAUCET", // symbol
            b"Paul's Faucet", // name
            b"My First Faucet Coin.", // description
            none(), // icon url
            ctx, // ctx
            );
        transfer::public_share_object(treasuryCap); // set "share object" to let everyone mint this coin
        transfer::public_freeze_object(coinMetadata); 
    }

    // mint paul0903_faucet coin
    public entry fun mint<T>(
        cap: &mut TreasuryCap<T>, 
        value: u64,
        receiver: address,
        ctx: &mut TxContext)
    {
        let mint_coin = coin::mint<T>(
            cap,
            value,
            ctx,
        );
        transfer::public_transfer(mint_coin, receiver);
    }

    // burn paul0903_faucet coin
    public entry fun burn<T>(
        cap: &mut TreasuryCap<T>, 
        input_coin: Coin<T>,
    ){
        coin::burn<T>(cap, input_coin);
    }
}