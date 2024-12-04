module kyrincode_faucet_coin::kyrincode_faucet_coin {
	use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::event;

    public struct MintEvent has copy, drop {
        amount: u64,
        recipient: address,
    }

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct KYRINCODE_FAUCET_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: KYRINCODE_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"KYFC",           // symbol
            b"KyrinCode Faucet Coin",       // name
            b"", // description
            option::none(),   // icon url
            ctx
        );

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_share_object(treasury);
    }

    public entry fun mint(
    	treasury_cap: &mut TreasuryCap<KYRINCODE_FAUCET_COIN>,
		amount: u64,
		recipient: address,
		ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
        event::emit(MintEvent{ amount, recipient });
    }
}