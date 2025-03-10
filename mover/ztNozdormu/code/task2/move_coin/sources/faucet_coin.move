module move_coin::faucet_coin;
use sui::coin::TreasuryCap;

public struct FAUCET_COIN has drop {}

fun init(faucet_coin: FAUCET_COIN,ctx: &mut TxContext) {
    let (treasury, metadata) = sui::coin::create_currency(faucet_coin,10,b"tis",b"faucet_coin",b"this is custom faucet_coin!",option::none(),ctx);
    sui::transfer::public_freeze_object(metadata);
    // public_share_object 对象所有权共享，任何人可以自由mint
    sui::transfer::public_share_object(treasury);
}

public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCET_COIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
    let coin = sui::coin::mint(treasury_cap,amount,ctx);
    sui::transfer::public_transfer(coin,recipient);
}

