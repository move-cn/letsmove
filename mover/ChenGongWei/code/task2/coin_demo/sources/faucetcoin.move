module coin_demo::faucetcoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,6,b"FAUCETCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap:&mut TreasuryCap<FAUCETCOIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
}