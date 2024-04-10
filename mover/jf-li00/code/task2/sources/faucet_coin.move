module my_coin::faucet_coin {
    use sui::coin::Self;

    public struct FAUCET_COIN has drop{
    }

    
    fun init(otw:FAUCET_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(

            otw,
            8,
            b"FC",
            b"FaucetCoin",
            b"Faucet Coin",
            option::none(),
            ctx
        );

        // publicly share the `TreasuryCap` , so everyone can mint and burn
        transfer::public_share_object(treasury_cap );

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }
    
    
}
