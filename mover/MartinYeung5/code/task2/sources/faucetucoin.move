module fungible_tokens::faucetucoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCETUCOIN has drop {}

    fun init(witness: FAUCETUCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCETUCOIN>(witness, 2, b"FAUCETUCOIN", b"FUPC", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCETUCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

}