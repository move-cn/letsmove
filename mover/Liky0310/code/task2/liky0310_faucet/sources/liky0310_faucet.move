module liky0310_faucet::liky0310_faucet{  

    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use sui::coin::{Self, Coin, TreasuryCap, CoinMetadata};
    use std::option::{none};
    use std::ascii;
    use std::string;

    public struct LIKY0310_FAUCET has drop{}

    #[allow(lint(share_owned))]
    fun init (otw: LIKY0310_FAUCET, ctx: &mut TxContext){
        let (treasuryCap, coinMetadata) = coin::create_currency(
            otw, // witness
            6, // decimals
            b"LIKY0310_FAUCET", // symbol
            b"LIKY0310 Faucet", // name
            b"LIKY0310 Faucet", // description
            none(), // icon url
            ctx, // ctx
            );
        transfer::public_transfer(treasuryCap, sender(ctx));
        transfer::public_share_object(coinMetadata);
    }

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

    public entry fun burn<T>(
        cap: &mut TreasuryCap<T>, 
        input_coin: Coin<T>,
    ){
        coin::burn<T>(cap, input_coin);
    }
}