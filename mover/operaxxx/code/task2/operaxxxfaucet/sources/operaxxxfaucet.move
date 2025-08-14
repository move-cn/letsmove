module operaxxxfaucet::operaxxxfaucet;

use sui::coin;

public struct OPERAXXXFAUCET has drop{}

fun init (witness: OPERAXXXFAUCET, ctx: &mut TxContext) {

    let (treasury_cap, coin_metadata) = coin::create_currency(witness, 
    6,
    b"OPERAXXXFAUCET",
    b"OPERAXXXFAUCET",
    b"My first faucet",
    option::none(),
    ctx);

    transfer::public_freeze_object(coin_metadata);
    transfer::public_share_object(treasury_cap);
}