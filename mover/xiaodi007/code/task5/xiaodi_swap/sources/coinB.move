module xiaodi_swap::coinB {
    use sui::coin::{Self, TreasuryCap};

    public struct COINB has drop {}

    fun init(witness: COINB, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COINB>(
            witness,
            2,
            b"COINB",
            b"NB",
            b"best coin in the world",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<COINB>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}