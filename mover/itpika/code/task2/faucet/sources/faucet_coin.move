module faucet::itpika_faucet {
    use sui::coin::{Self};
    use sui::url::{Url,Self};
    // use sui::balance::{Self, Balance};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct ITPIKA_FAUCET has drop {}
    // const TOTAL_SUPPLY_MIST: u64 = 10_000_000_000_000_000_000;

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: ITPIKA_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"itpika_faucet", b"itpika faucet coin", b"", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/29301013")), ctx);
        
        transfer::public_share_object(treasury);
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(treasury_cap: &mut coin::TreasuryCap<ITPIKA_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }


}
