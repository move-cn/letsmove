/// Module: mycoin
module wasd845_coin::wasd845_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct WASD845_COIN has drop {}

    fun init(witness: WASD845_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<WASD845_COIN>(
            witness,
            2,
            b"WASD845_COIN",
            b"WASD845_COIN",
            b"learning letsmove, power by wasd845",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<WASD845_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<WASD845_COIN>, coin: Coin<WASD845_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(WASD845_COIN {}, ctx);
    }
}

