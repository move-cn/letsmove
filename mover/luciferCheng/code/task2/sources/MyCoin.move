
/// Module: task2
module task2::mycoin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct MYCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,                // decimals
            b"CHENG",           // symbol
            b"cheng's coin",       // name
            b"cheng's coin", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/166961117")), // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    /// Manager can mint new coins
    public fun mint(
        treasury_cap: &mut coin::TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public fun burn(treasury_cap: &mut coin::TreasuryCap<MYCOIN>, target: coin::Coin<MYCOIN>) {
        coin::burn(treasury_cap, target);
    }
}