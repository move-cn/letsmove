/*
/// Module: fish_yan_faucet
module fish_yan_faucet::fish_yan_faucet;
*/
module fish_yan_faucet::fish_yan_faucet {

    use sui::coin;
    public struct FISH_YAN_FAUCET has drop {}

    fun init(witness: FISH_YAN_FAUCET, ctx: &mut TxContext) {

        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness, 
            9,
            b"Fish Yan Faucet",
            b"Fish Yan Faucet Coin",
            b"Fish Yan faucet coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(coin_metadata);
        transfer::public_share_object(treasury_cap);
    }

}