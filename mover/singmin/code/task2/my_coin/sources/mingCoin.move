
module my_coin::mingCoin;

use sui::coin::{self, TreasuryCap, Coin};
use std::option;
use std::option::{none, some};
use sui::transfer::{freeze_object, public_freeze_object, public_transfer};
use sui::url;


// let noImage= none<>();

// let url = url::new_unsafe_from_bytes(b"");
//
// let yesImage=some<url>(url);
// coin_metadata是代币信息

// public fun create_currency<T: drop>(
//     witness: T,
// decimals: u8,
// symbol: vector<u8>,
// name: vector<u8>,
// description: vector<u8>,
// icon_url: Option<Url>,
// ctx: &mut TxContext,
// ): (TreasuryCap<T>, CoinMetadata<T>) {
//     // Make sure there's only one instance of the type T
//     assert!(sui::types::is_one_time_witness(&witness), EBadWitness);
//
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

// 必须大写
public struct MINGCOIN has drop{}

fun init(mingcoin: MINGCOIN, ctx: &mut TxContext) {


    let(treasury,coin_metadata) =
        create_currency(mingcoin,8,b"MC",b"MINGCOIN",b"This is MingCoin",option::none(), ctx);

    public_freeze_object(coin_metadata);

    public_transfer(treasury,ctx.sender());


}
public fun mint(treasury_cap: &mut TreasuryCap<MINGCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}
public entry fun burn(treasury_cap: &mut TreasuryCap<MINGCOIN>, coin: Coin<MINGCOIN>) {
    coin::burn(treasury_cap, coin);
}
}