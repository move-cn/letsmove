module custom_coin::faucet_coin;
use custom_coin::MY_COIN::MY_COIN;
use sui::coin::TreasuryCap;

// MY_COIN 的 decimal 是 6，每次给 1 个
const FAUCET_AMOUNT: u64 = 1_000_000;

public struct Faucet has key {
    id: UID,
    treasury_cap: TreasuryCap<MY_COIN>,
}

public entry
fun create_faucet(treasury_cap: TreasuryCap<MY_COIN>, ctx: &mut TxContext) {
    let faucet = Faucet {
        id: object::new(ctx),
        treasury_cap,
    };
    transfer::share_object(faucet);
}

public entry
fun request_coin(faucet: &mut Faucet, recipient: address, ctx: &mut TxContext) {
    custom_coin::MY_COIN::mint(&mut faucet.treasury_cap, FAUCET_AMOUNT, recipient, ctx);
}