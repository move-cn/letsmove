/// Module: 02coin
module 02coin::faucet_coin {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};

    struct FAUCET_COIN has drop {}

    fun init(waitness: FAUCET_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(waitness,6,b"FAUCET", b"FAUCET", b"", option::none(), ctx);

        transfer::public_freeze_object(meta);
        transfer::share_object(treasury_cap, tx_context::sender(ctx));
    }

    
    public entry fun faucet(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));

        emit(MintEvent{
            amount,
            recipient
        })
    }
}

