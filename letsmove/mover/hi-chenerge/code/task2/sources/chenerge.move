module task2::chenerge {
    use sui::coin;
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::coin::{TreasuryCap, Coin};
    use sui::transfer;

    const TOTAL_SUPPLY: u64 = 100_000_000_000;
    const EExceedSupply: u64 = 99;

    public struct CHENERGE has drop {}

    fun init(witness: CHENERGE, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            6,
            b"CHENERGE",
            b"CHENERGE",
            b"",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CHENERGE>,
        amount: u64,
        to: address,
        ctx: &mut TxContext
    ) {
        let supply = coin::total_supply(treasury_cap);

        assert!((supply + amount) <= TOTAL_SUPPLY, EExceedSupply);

        coin::mint_and_transfer(treasury_cap, amount, to, ctx);
    }

    public entry fun transfer(coin: Coin<CHENERGE>, to: address) {
        transfer::public_transfer(coin, to);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<CHENERGE>,
        coin: Coin<CHENERGE>
    ) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(CHENERGE {}, ctx)
    }
}
