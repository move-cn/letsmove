/// Module: vv1133_faucet
module vv1133_faucet::vv1133_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::vv1133_coin::VV1133_FAUCET>`
    /// Make sure that the name of the type matches the module's name.
    public struct VV1133_FAUCET has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: VV1133_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"VV1133COIN2", b"VV2", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public fun mint (treasury_cap: &mut TreasuryCap<VV1133_FAUCET>, 
                     amount: u64, 
                     recipient: address, 
                     ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
