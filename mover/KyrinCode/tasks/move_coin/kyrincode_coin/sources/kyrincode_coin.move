module kyrincode_coin::kyrincode_coin {
	use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct KYRINCODE_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: KYRINCODE_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"KYC",           // symbol
            b"KyrinCode Coin",       // name
            b"", // description
            option::none(),   // icon url
            ctx
        );

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public fun mint(
    	treasury_cap: &mut TreasuryCap<KYRINCODE_COIN>,
    	amount: u64,
    	recipient: address,
    	ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
    	transfer::public_transfer(coin, recipient);
    }
}