module coin::btc_cyh;
use sui::coin;
use sui::transfer::public_freeze_object;
use sui::transfer::public_transfer;
use sui::coin::TreasuryCap;
public struct BTC_CYH has drop{

}


fun init(witness:BTC_CYH, ctx: &mut TxContext){
    let (treasury, coin_metadata) = 
    coin::create_currency(witness,6,b"BTC_CYH",b"BTC_CYH",b"this is BTC_CYH",option::none(),ctx);
    public_freeze_object(coin_metadata);

    public_transfer(treasury, ctx.sender());
}



public entry fun mint(treasury_cap: &mut TreasuryCap<BTC_CYH>, amount: u64, recipient: address, ctx: &mut TxContext){
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
}