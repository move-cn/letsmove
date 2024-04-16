/// Module: faucet_coin
module faucet_coin::faucet_coin {
    use sui::coin::{Self,TreasuryCap};

    public struct FAUCET_COIN has drop {}

    fun init(witness:FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"FAUCET",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }

    public fun mint(treasury_cap:&mut TreasuryCap<FAUCET_COIN>,amount:u64,recipient:address,ctx:&mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
}

