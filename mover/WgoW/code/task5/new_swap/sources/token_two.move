module new_swap::coin_two {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct COIN_TWO has drop {}

    fun init(witness: COIN_TWO, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COIN_TWO>(
            witness,
            3,
            b"COIN_B",
            b"CB",
            b"learning for swap",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_TWO>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_TWO>, coin: Coin<COIN_TWO>) {
        coin::burn(treasury_cap, coin);
    }
}
