module task2::kang_coin {

    use sui::coin::{Self, Coin, TreasuryCap};

    public struct KANG_COIN has drop {}

    fun init(witness: KANG_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"KANGCOIN",
            b"My Coin",
            b"It's my coin baby!",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint_and_transfer(
        treasury_cap: &mut TreasuryCap<KANG_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<KANG_COIN>, coin: Coin<KANG_COIN>) {
        coin::burn(treasury_cap, coin);
    }

}
