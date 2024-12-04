/// Module: mycoin
module drgnchan_coin::drgnchan_coin {
    use sui::coin::{Self,TreasuryCap};
    use sui::url::{Self};
    public struct DRGNCHAN_COIN has drop {}

    fun init(witness: DRGNCHAN_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"DRGNCHAN_COIN", 
            b"drgnchan_COIN", 
            b"drgnchan coin",
            option::some(url::new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/40224023?v=4"))),
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<DRGNCHAN_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
