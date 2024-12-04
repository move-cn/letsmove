/// Module: mycoin
module mycoin::mycoin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MYCOIN has drop {}

    fun init(otw: MYCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MYCOIN>(otw, 2, b"MYCOIN", b"MyCoin", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>) {
        coin::burn(treasury_cap, coin);
    }
}
