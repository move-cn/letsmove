module VKLO1FAUCET::VKLO1FAUCET {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct VKLO1FAUCET has drop {}

    fun init(witness: VKLO1FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<VKLO1FAUCET>(
            witness,
            3,
            b"VKLO1FAUCET",
            b"CA",
            b"learning for VKLO1FAUCET",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<VKLO1FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<VKLO1FAUCET>, coin: Coin<VKLO1FAUCET>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(FAUCETCOIN {}, ctx);
    }
}
