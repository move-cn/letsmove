/*
/// Module: mycoin
module mycoin::mycoin;
*/
#[allow(unused_use,duplicate_alias,unused_const)]
module mycoin::mycoin {
    use sui::coin;
    use sui::coin::create_currency;
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use sui::coin::{mint_and_transfer,TreasuryCap};
    public struct MYCOIN has drop {}

    fun init(mycoin: MYCOIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) =
            create_currency(
                mycoin,
            8,
            b"xydkdcoin",
            b"xydkdcoin",
            b"xydkdcoin",
            option::none(),
            ctx);

        transfer::public_freeze_object(coin_metadata);

        let my_address = sender(ctx);
        transfer::public_transfer(treasury_cap, my_address)
    }
    public entry fun mint(trap:&mut TreasuryCap<MYCOIN>,am:u64,recive:address,ctx:&mut TxContext){
       coin::mint_and_transfer(trap,am,recive,ctx);
    } 
}
