module faucet_coin::mc;
use sui::coin::{create_currency, mint_and_transfer, TreasuryCap};
use sui::transfer::{public_freeze_object, public_transfer};

public struct MC has drop{}

fun init(mc: MC, ctx: &mut TxContext){
    let (treasury, coin_metadata) =
        create_currency(mc, 6, b"MC", b"MC", b"Crazy Thursday", option::none(), ctx);
    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender())
}

public entry fun mint(treasury: &mut TreasuryCap<MC>, amount: u64, recipient: address, ctx: &mut TxContext){
    mint_and_transfer(treasury, amount, recipient, ctx);
}

