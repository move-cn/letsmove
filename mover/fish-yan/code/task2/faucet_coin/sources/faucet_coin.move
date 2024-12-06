/*
/// Module: faucet_coin
module faucet_coin::faucet_coin;
*/
module faucet_coin::faucetcoin {

    use sui::coin;
    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {

        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness, 
            9,
            b"FishFaucet",
            b"Fish Faucet Coin",
            b"Fish faucet coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(coin_metadata);
        transfer::public_share_object(treasury_cap);
    }

}
