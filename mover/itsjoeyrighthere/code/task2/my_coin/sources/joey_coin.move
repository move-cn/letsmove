/// Module: my_coin
module my_coin::joeycoin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct JOEYCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: JOEYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,                // decimals
            b"JOEY",           // symbol
            b"Joey Coin",       // name
            b"itsjoeyrighthere", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/48686956")), // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    /// Manager can mint new coins
    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<JOEYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<JOEYCOIN>, target: coin::Coin<JOEYCOIN>) {
        coin::burn(treasury_cap, target);
    }
}
