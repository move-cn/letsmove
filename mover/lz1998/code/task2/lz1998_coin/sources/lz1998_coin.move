
/// Module: lz1998_coin
module lz1998_coin::lz1998_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct LZ1998_COIN has drop {}
    fun init(witness: LZ1998_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"lz1998 COIN",           // symbol
            b"lz1998 COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LZ1998_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<LZ1998_COIN>, coin: Coin<LZ1998_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

