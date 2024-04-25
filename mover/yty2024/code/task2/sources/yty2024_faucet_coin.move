module task2::yty2024_faucet_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct YTY2024_FAUCET_COIN has drop {}

    fun init(witness: YTY2024_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,6,b"yty2024_faucet_coin",b"yty2024_faucet_coin name",b"yty2024_faucet_coin description",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap:&mut TreasuryCap<YTY2024_FAUCET_COIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
}