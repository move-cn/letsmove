/*
/// Module: kamisayaka_faucet
module kamisayaka_faucet::kamisayaka_faucet;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module kamisayaka_faucet::kamisayaka_faucet{
    use sui::coin::create_currency;
     use sui::url::{Url, new_unsafe_from_bytes}; // 新增导入

    public struct KAMISAYAKA_FAUCET has drop {}

    fun init(kamisayaka_faucet:KAMISAYAKA_FAUCET, ctx: &mut TxContext){
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
        create_currency(kamisayaka_faucet,8,b"KAMISAYAKA_FAUCET",b"kamisayaka_faucet",b"my first move faucet coin",yes,ctx);

        transfer::public_freeze_object(coin_metadata);

        transfer::public_share_object(treasury);
    }
}