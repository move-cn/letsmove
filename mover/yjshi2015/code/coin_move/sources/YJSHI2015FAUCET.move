module YJSHI2015::YJSHI2015FAUCET {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::event;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct YJSHI2015FAUCET has drop {}

    public struct MintEvent has copy, drop {
        recipient: address,
        amount: u64,
    }

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: YJSHI2015FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"YJSHI2015FAUCET", b"YJSHI2015FAUCET", b"yjshi2015's faucet coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        // transfer::public_transfer(treasury, tx_context::sender(ctx))

        transfer::public_share_object(treasury)
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<YJSHI2015FAUCET>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
        event::emit(MintEvent{
            recipient,
            amount,
        })
    }
}