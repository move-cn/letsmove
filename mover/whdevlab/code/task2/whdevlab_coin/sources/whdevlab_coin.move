
/// Module: whdevlab_coin
module whdevlab_coin::whdevlab_coin {
	use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct WHDEVLAB_COIN has drop {}

    fun init(witness: WHDEVLAB_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<WHDEVLAB_COIN>(
            witness,
            9,
            b"WHDEVLAB_COIN",
            b"WHDEVLAB_COIN",
            b"coin create by WHDEVLAB",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<WHDEVLAB_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<WHDEVLAB_COIN>, 
        coin: Coin<WHDEVLAB_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
