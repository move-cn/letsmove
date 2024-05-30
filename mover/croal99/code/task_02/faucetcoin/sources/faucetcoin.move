/// Module: faucetcoin
module faucetcoin::faucet_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::url::new_unsafe;

    public struct FAUCET_COIN has drop {}

    #[lint_allow(self_transfer)]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,                // decimals
            b"SuiFaucetRMB",           // symbol
            b"Sui Faucet RMB",       // name
            b"My faucet coin", // description
            option::some(url_obj),   // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"faucet mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
