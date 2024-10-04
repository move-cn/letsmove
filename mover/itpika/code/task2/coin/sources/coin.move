module coin::itpika {
    use sui::coin::{Self};
    use sui::url::{Url,Self};
    // use sui::balance::{Self, Balance};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct ITPIKA has drop {}
    // const TOTAL_SUPPLY_MIST: u64 = 10_000_000_000_000_000_000;

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: ITPIKA, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"itpika", b"itpika coin", b"", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/29301013")), ctx);
        
        // let supply = coin::treasury_into_supply(treasury.clone());
        // let total_sui = balance::increase_supply(&mut supply, TOTAL_SUPPLY_MIST);
        // balance::increase_supply(&mut supply, TOTAL_SUPPLY_MIST);
        // balance::destroy_supply(supply);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut coin::TreasuryCap<ITPIKA>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }


}
