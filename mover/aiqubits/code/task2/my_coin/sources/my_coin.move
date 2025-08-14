module my_coin::aiqubit_coin  {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self,Url}; 

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct AIQUBIT_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: AIQUBIT_COIN, ctx: &mut TxContext) {
     //   let win = MYCOIN{};

        let (treasury, metadata) = coin::create_currency<AIQUBIT_COIN>(
            witness,
            9,                // decimals
            b"AIQC",           // symbol
            b"AIQUBIT_COIN",       // name
            b"Don't ask why", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/35585232?v=4")),   // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(
        treasury: &mut TreasuryCap<AIQUBIT_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
    
    public fun burn(
        treasury: &mut TreasuryCap<AIQUBIT_COIN>, 
        coin: Coin<AIQUBIT_COIN>
    ) {
        coin::burn(treasury, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(AIQUBIT_COIN {}, ctx);
    }

}