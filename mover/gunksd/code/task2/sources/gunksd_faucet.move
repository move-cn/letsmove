module task2::gunksd_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct GUNKSD_FAUCET has drop {}

    fun init(witness: GUNKSD_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"GUNKSD_FAUCET", b"gunksd_faucet", b"gunksd faucet", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<GUNKSD_FAUCET>,
        recipient: address,
        ctx: &mut TxContext,
    ) 
    {
        coin::mint_and_transfer(treasury_cap, 1000000, recipient, ctx);
    }
    public fun burn(treasury_cap: &mut TreasuryCap<GUNKSD_FAUCET>, coin: Coin<GUNKSD_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}