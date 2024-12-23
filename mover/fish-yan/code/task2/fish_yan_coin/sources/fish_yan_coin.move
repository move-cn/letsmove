/*
/// Module: fish_yan_coin
module fish_yan_coin::fish_yan_coin;
*/
module fish_yan_coin::fish_yan_coin {

    use sui::coin;

    public struct FISH_YAN_COIN has drop {}

    fun init(witness: FISH_YAN_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness, 
            9,
            b"Fish Yan Coin",
            b"Fish Yan Coin",
            b"Fish Yan coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(coin_metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }
}
