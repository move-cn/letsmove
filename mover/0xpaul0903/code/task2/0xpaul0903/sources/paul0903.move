module paul0903::paul0903{  

    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use sui::coin::{Self, Coin, TreasuryCap, CoinMetadata};
    use std::option::{none};
    use std::ascii;
    use std::string;

    public struct PAUL0903 has drop{}

    #[allow(lint(share_owned))]
    fun init (otw: PAUL0903, ctx: &mut TxContext){
        let (treasuryCap, coinMetadata) = coin::create_currency(
            otw, // witness
            10, // decimals
            b"PAUL", // symbol
            b"Paul's Coin", // name
            b"My First Coin.", // description
            none(), // icon url
            ctx, // ctx
            );
        transfer::public_transfer(treasuryCap, sender(ctx)); // set owner to deployer address
        transfer::public_share_object(coinMetadata); // set "share object" to let admin modity in the future
    }

    // mint paul0903 coin
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

    // burn paul0903 coin
    public entry fun burn<T>(
        cap: &mut TreasuryCap<T>, 
        input_coin: Coin<T>,
    ){
        coin::burn<T>(cap, input_coin);
    }

    // modify metadata- symbol
    public entry fun modify_symbol<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_symbol: ascii::String,
    ){
        coin::update_symbol(cap, metadata, new_symbol);
    }

    // modify metadata- name
    public entry fun modify_name<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_name: string::String,
    ){
        coin::update_name(cap, metadata, new_name);
    }

    // modify metadata- decription
    public entry fun modify_description<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_symbol: string::String,
    ){
        coin::update_description(cap, metadata, new_symbol);
    }


    // modify metadata- icon url
    public entry fun modify_icon_url<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_url: ascii::String,
    ){
        coin::update_icon_url(cap, metadata, new_url);
    }
}