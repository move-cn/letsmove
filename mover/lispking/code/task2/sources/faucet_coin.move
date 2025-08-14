module task2::faucet_coin {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};

    struct FAUCET_COIN has drop {}

    fun init(waitness: FAUCET_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(waitness, 18, b"FAUCET_COIN", b"FC", b"", option::none(), ctx);
        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin : Coin<FAUCET_COIN>, _ctx: &mut TxContext) {
        coin::burn(treasury_cap, coin);
    }
}
