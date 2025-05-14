module coin::btc_cyh_test;
use sui::coin;
use sui::transfer::public_freeze_object;
use sui::coin::TreasuryCap;
use sui::transfer::public_share_object;
public struct BTC_CYH_TEST has drop{

}


fun init(witness:BTC_CYH_TEST, ctx: &mut TxContext){
    let (treasury, coin_metadata) = 
    coin::create_currency(witness,6,b"BTC_CYH_TEST",b"BTC_CYH_TEST",b"this is BTC_CYH_TEST",option::none(),ctx);
    public_freeze_object(coin_metadata);

    public_share_object(treasury);
}



public entry fun mint(treasury_cap: &mut TreasuryCap<BTC_CYH_TEST>, amount: u64, recipient: address, ctx: &mut TxContext){
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
}