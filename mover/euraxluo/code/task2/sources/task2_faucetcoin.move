/// Module: faucetcoin
module task2::faucetcoin {
    use sui::coin::{Self, TreasuryCap};
    use sui::url::{Self};
    public struct FAUCETCOIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"EuraxluoFAUCET", 
            b"EURAXLUOFAUCET", 
            b"euraxluo faucet coin ", 
            option::some(url::new_unsafe(std::ascii::string(b"https://th.bing.com/th/id/OIP.fujwuewP-TbCj4A9LcVZXwHaHa"))), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, 1000000000,tx_context::sender(ctx), ctx);
    }
}