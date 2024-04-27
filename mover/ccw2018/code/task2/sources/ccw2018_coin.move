module task2::ccw2018_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct CCW2018_COIN has drop {}
    #[allow(unused_use)]
    fun init(witness: CCW2018_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"ccw2018_coin", b"ccw2018 coin name", b"ccw2018 coin description", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CCW2018_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<CCW2018_COIN>, coin: Coin<CCW2018_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
