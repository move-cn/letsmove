module al17er_faucet::al17er_faucet{
    use sui::tx_context::{sender};
    use sui::coin::{Self, Coin, TreasuryCap};
    use std::option::{none};

    public struct AL17ER_FAUCET has drop{}
    #[allow(lint(share_owned))]
    fun init (otw: AL17ER_FAUCET,ctx: &mut TxContext){
        let (treasuryCap, coinMetadata) = coin::create_currency(
            otw, 
            6, 
            b"AE_FAUCET", 
            b"Al17er Faucet", 
            b"Al17er Faucet", 
            none(), 
            ctx, 
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
