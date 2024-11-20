
module my_coin::faucet_coin;

use sui::coin::create_currency;
use std::option;
use sui::transfer::{public_transfer, public_freeze_object};

public struct FAUCET_COIN has drop{}


fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = create_currency(witness, 6, b"FAUCET_COIN", b"faucet_coin", b"", option::none(), ctx);

    public_freeze_object(metadata);
    public_share_object(treasury);
}

