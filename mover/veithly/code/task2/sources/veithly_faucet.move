module task2::veithly_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of veithlyFaucet coin
    public struct VEITHLY_FAUCET has drop {}

    /// Module initializer is called once on module publish.
    fun init(witness: VEITHLY_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(witness, 6, b"VLF", b"veithlyFaucet", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    /// Mint new coins
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<VEITHLY_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}
