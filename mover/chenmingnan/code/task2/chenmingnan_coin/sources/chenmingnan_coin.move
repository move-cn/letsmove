
/// Module: chenmingnan_coin
module chenmingnan_coin::chenmingnan_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct CHENMINGNAN_COIN has drop {}
    fun init(witness: CHENMINGNAN_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"chenmingnan COIN",           // symbol
            b"chenmingnan COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CHENMINGNAN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<CHENMINGNAN_COIN>, coin: Coin<CHENMINGNAN_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

