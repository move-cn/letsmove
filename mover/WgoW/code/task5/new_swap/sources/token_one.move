module new_swap::coin_one {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct COIN_ONE has drop {}

    fun init(witness: COIN_ONE, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COIN_ONE>(
            witness,
            3,
            b"COIN_ONE",
            b"ONE",
            b"learning for swap",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_ONE>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_ONE>, coin: Coin<COIN_ONE>) {
        coin::burn(treasury_cap, coin);
    }
}
