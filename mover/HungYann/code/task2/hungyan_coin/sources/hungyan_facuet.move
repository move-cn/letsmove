module hungyan_coin::hungyan_facuet {
    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};

    public struct HUNGYAN_FACUET has drop{}

    #[allow(lint(share_owned))]
    fun init(witness: HUNGYAN_FACUET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 5, b"USD", b"hungyan facuet", b"Test facuet coin for move study", option::none(),  ctx);
        // send treasury to the sender who calls this method
        transfer::public_transfer(treasury, ctx.sender());
        transfer::public_share_object(metadata);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HUNGYAN_FACUET>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<HUNGYAN_FACUET>, coin: Coin<HUNGYAN_FACUET>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(HUNGYAN_COIN {}, ctx)
    }
}