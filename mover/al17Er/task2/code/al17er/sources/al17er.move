module al17er::al17er{
    use sui::tx_context::{sender};
    use sui::coin::{Self,Coin,TreasuryCap,CoinMetadata};
    use std::option::{none};
    use std::ascii;
    use std::string;
    
    public struct AL17ER has drop{}

    #[allow(lint(share_owned))]
    fun init (otw: AL17ER,ctx: &mut TxContext){
        let (treasuryCap,coinMetadata) = coin::create_currency(
            otw, 
            3,
            b"AE",
            b"Al17er's coin",
            b"maybe can give you good lucky!",
            none(),
            ctx,
        );
        transfer::public_transfer(treasuryCap,sender(ctx));
        transfer::public_share_object(coinMetadata);
    }
   
    public entry fun mint<T>(
        cap:&mut TreasuryCap<T>,
        value: u64,
        receiver: address,
        ctx: &mut TxContext
    )
    {
        let mint_coin = coin::mint<T>(
            cap,
            value,
            ctx,
        );
        transfer::public_transfer(mint_coin,receiver);
    }

    public entry fun burn<T>(
        cap:&mut TreasuryCap<T>,
        input_coin:Coin<T>,
    ){
        coin::burn<T>(cap,input_coin);
    }

    public entry fun modify_symbol<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_symbol: ascii::String,
    ){
        coin::update_symbol(cap, metadata, new_symbol);
    }

    public entry fun modify_name<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_name: string::String,
    ){
        coin::update_name(cap, metadata, new_name);
    }

    public entry fun modify_description<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_symbol: string::String,
    ){
        coin::update_description(cap, metadata, new_symbol);
    }

    public entry fun modify_icon_url<T>(
        cap: &TreasuryCap<T>,
        metadata: &mut CoinMetadata<T>,
        new_url: ascii::String,
    ){
        coin::update_icon_url(cap, metadata, new_url);
    }
}
