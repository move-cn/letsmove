module operaxxxcoin::operaxxxcoin;

use sui::coin;

public struct OPERAXXXCOIN has drop {}

fun init (witness: OPERAXXXCOIN, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = coin::create_currency(
        // witness
        witness,
        // 代币精度
        6,
        // symbol 符号
        b"OPERAXXXCOIN",
        // name 名称
        b"OPERAXXXCOIN",
        // description 描述
        b"my first sui coin",
        // icon url
        option::none(),
        ctx
    );
    
    transfer::public_freeze_object(coin_metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
}