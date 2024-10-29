/*
/// Module: listencoin
module listencoin::listencoin {

}
*/

module listencoin::listencoin {

    use sui::coin::create_currency;
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::transfer;

    public struct LISTENCOIN has drop {}

    const SendAddress: address = @0x01;

    fun init(listencoin: LISTENCOIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) =
            create_currency(
                listencoin,
            8,
            b"listen",
            b"listen and get coin",
            b"listen and get coin",
            option::none(),
            ctx);

        transfer::public_freeze_object(coin_metadata);

        let my_address = sender(ctx);
        transfer::public_transfer(treasury_cap, my_address)
    }
}
