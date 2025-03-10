/*
/// Module: move_coin
module move_coin::move_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module move_coin::my_coin;
use sui::coin::TreasuryCap;

public struct MY_COIN has drop {}

    fun init(my_coin: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = sui::coin::create_currency(my_coin,10,b"MYCOIN",b"",b"this is custom coin!",option::none(),ctx);
        sui::transfer::public_freeze_object(metadata);
        sui::transfer::public_transfer(treasury,tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>,amount: u64,recipient: address,ctx: &mut TxContext) {
        let coin = sui::coin::mint(treasury_cap,amount,ctx);
        sui::transfer::public_transfer(coin,recipient);
    }
