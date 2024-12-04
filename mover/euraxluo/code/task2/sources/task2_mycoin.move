/// Module: mycoin
module task2::mycoin {
    use sui::coin::{Self,TreasuryCap};
    use sui::url::{Self};
    public struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"EuraxluoCoin", 
            b"EuraxluoCOIN", 
            b"Euraxluo coin",
            option::some(url::new_unsafe(std::ascii::string(b"https://th.bing.com/th/id/OIP.KIbQVW995sdomP7hAushQgHaHa"))),
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
