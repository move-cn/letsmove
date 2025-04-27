module my_coin::kfc;
use sui::coin::{create_currency, mint_and_transfer, TreasuryCap};
use sui::transfer::{public_transfer, public_share_object};

public struct KFC has drop{}

fun init(kfc: KFC, ctx: &mut TxContext){
    let (treasury, coin_metadata) =
        create_currency(kfc, 6, b"KFC", b"KFC", b"Happy Monday", option::none(), ctx);
    public_share_object(coin_metadata);
    public_transfer(treasury, ctx.sender())
}

public entry fun mint(treasury: &mut TreasuryCap<KFC>, amount: u64, recipient: address, ctx: &mut TxContext){
    mint_and_transfer(treasury, amount, recipient, ctx);
}