module hungyan_coin::hungyan_coin {
    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};

    public struct HUNGYAN_COIN has drop{}

    fun init(witness: HUNGYAN_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 5, b"USD", b"hungyan coin", b"Test coin for move study", option::none(),  ctx);
        // send treasury to the sender who calls this method
        transfer::public_transfer(treasury, ctx.sender());
        // keep treasury 
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HUNGYAN_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<HUNGYAN_COIN>, coin: Coin<HUNGYAN_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(HUNGYAN_COIN {}, ctx)
    }
}
