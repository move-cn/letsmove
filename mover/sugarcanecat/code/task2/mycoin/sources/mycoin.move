/// Module: mycoin
module mycoin::mycoin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"sugarcanecat",
            b"sugarcanecatCoin",
            b"sugarcanecat coin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);

        transfer::public_transfer(treasury, ctx.sender());
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MYCOIN {}, ctx)
    }
}

