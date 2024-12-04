module sony9997_faucet::sony9997_faucet{  

    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use sui::coin::{Self, Coin, TreasuryCap, CoinMetadata};
    use std::option::{none};
    use std::ascii;
    use std::string;

    public struct SONY9997_FAUCET has drop{}

    #[allow(lint(share_owned))]
    fun init (otw: SONY9997_FAUCET, ctx: &mut TxContext){
        let (treasuryCap, coinMetadata) = coin::create_currency(
            otw, // witness
            6, // decimals
            b"SONY9997_FAUCET", // symbol
            b"sony9997 Faucet", // name
            b"sony9997 Faucet", // description
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
        ctx: &mut TxContext){
        let mint_coin = coin::mint<T>(
            cap,
            value,
            ctx,
        );
        transfer::public_transfer(mint_coin, receiver);
    }

    public entry fun burn<T>(
        cap: &mut TreasuryCap<T>, 
        input_coin: Coin<T>,){
        coin::burn<T>(cap, input_coin);
    }
}
