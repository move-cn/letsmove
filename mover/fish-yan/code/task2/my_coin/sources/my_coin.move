/*
/// Module: my_coin
module my_coin::my_coin;
*/
module my_coin::fishcoin {

    use sui::coin;

    public struct FISHCOIN has drop {}

    fun init(witness: FISHCOIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness, 
            9,
            b"Fish",
            b"Fish Coin",
            b"Fish coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(coin_metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }
}
