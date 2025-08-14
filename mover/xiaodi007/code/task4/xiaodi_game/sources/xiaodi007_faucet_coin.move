/*
/// Module: xiaodi007_faucet_coin
module xiaodi007_faucet_coin::xiaodi007_faucet_coin {

}
*/

module xiaodi_game::xiaodi007_faucet_coin {
    use sui::coin::{Self, TreasuryCap};

    public struct XIAODI007_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: XIAODI007_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"XIAODI007_FAUCET_COIN", b"", b"", option::none(), ctx);
        transfer::public_share_object(metadata);
        transfer::public_share_object(treasury)
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<XIAODI007_FAUCET_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}