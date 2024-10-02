
/// Module: fyh2001_coin
module fyh2001_coin::fyh2001_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct FYH2001_COIN has drop {}
    fun init(witness: FYH2001_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"fyh2001 COIN",           // symbol
            b"fyh2001 COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FYH2001_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<FYH2001_COIN>, coin: Coin<FYH2001_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
