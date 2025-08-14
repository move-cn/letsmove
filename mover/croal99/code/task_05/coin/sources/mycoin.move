#[allow(duplicate_alias)]
/// Module: coin
module coin::my_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct MY_COIN has drop {}

    #[lint_allow(self_transfer)]
    fun init(
        witness: MY_COIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init MY_COIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8, // decimals
            b"MyCoin", // symbol
            b"My Coin", // name
            b"My coin", // description
            option::some(url_obj), // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        coin: Coin<MY_COIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }

    // === Tests ===
    #[test_only]
    public fun test_for_init(
        ctx: &mut TxContext
    ) {
        init(MY_COIN {}, ctx);
    }

}
