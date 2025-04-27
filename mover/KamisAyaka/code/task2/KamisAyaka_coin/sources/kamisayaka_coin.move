/*
/// Module: kamisayaka_coin
module kamisayaka_coin::kamisayaka_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module kamisayaka_coin::kamisayaka_coin{

    use sui::coin::create_currency;
    use sui::url::{Url, new_unsafe_from_bytes}; // 新增导入

    public struct KAMISAYAKA_COIN has drop {}

    fun init(kamisayaka_coin:KAMISAYAKA_COIN, ctx: &mut TxContext){
        //     public fun create_currency<T: drop>(
        //     witness: T,
        //     decimals: u8,
        //     symbol: vector<u8>,
        //     name: vector<u8>,
        //     description: vector<u8>,
        //     icon_url: Option<Url>,
        //     ctx: &mut TxContext,
        // ): (TreasuryCap<T>, CoinMetadata<T>) {

        let url = new_unsafe_from_bytes(b"https://images.app.goo.gl/54GNKMSAurz1vbH77");
        let yes = std::option::some<Url>(url);
        let(treasury,coin_metadata) = 
        create_currency(kamisayaka_coin,8,b"KAMISAYAKA_COIN",b"kamisayaka_coin",b"my first move coin",yes,ctx);

        transfer::public_freeze_object(coin_metadata);

        transfer::public_transfer(treasury, ctx.sender());
    }
}