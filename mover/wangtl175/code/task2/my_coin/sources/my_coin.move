/// Module: my_coin
module my_coin::my_coin {
    use sui::coin;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"My Coin",
            b"My Coin",
            b"My Coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<MY_COIN>,
        amount: u64,
        recipent: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipent, ctx);
    }
}
