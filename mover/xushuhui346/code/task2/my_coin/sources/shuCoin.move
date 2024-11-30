/*
/// Module: my_coin
module my_coin::shuCoin;
水龙头
*/
module my_coin::shuCoin;
use sui::coin::create_currency;
use std::option::{none,some};
use sui::transfer::{public_transfer,public_freeze_object,public_share_object};
use sui::url::Url;

public struct SHUCOIN has drop{

}
fun init(shuCoin:SHUCOIN,ctx:&mut TxContext){
    let no:Option<Url> = none<Url>();
    let ( treasury ,coinMetadata) = create_currency(
        shuCoin,
        8,
        b"SHUCOIN",
        b"SHUCOIN",
        b"this is shuCoin",
        no,
        ctx
    );
    public_freeze_object(coinMetadata);
    public_share_object(treasury)
}

// public fun create_currency<T: drop>(
//     witness: T,
//     decimals: u8,//精度为2   move代码100   实际是1
//     symbol: vector<u8>,
//     name: vector<u8>,
//     description: vector<u8>,
//     icon_url: Option<Url>,
//     ctx: &mut TxContext,
// ): (TreasuryCap<T>, CoinMetadata<T>) {
//     // Make sure there's only one instance of the type T
//     assert!(sui::types::is_one_time_witness(&witness), EBadWitness);

//     (
//         TreasuryCap {
//             id: object::new(ctx),
//             total_supply: balance::create_supply(witness),
//         },
//         CoinMetadata {
//             id: object::new(ctx),
//             decimals,
//             name: string::utf8(name),
//             symbol: ascii::string(symbol),
//             description: string::utf8(description),
//             icon_url,
//         },
//     )
// }