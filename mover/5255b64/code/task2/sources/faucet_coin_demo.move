/// Module: task2
module task2::faucet_coin_demo {
    // use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    // use sui::transfer;
    // use sui::tx_context::{Self, TxContext};

    public struct FAUCET_COIN_DEMO has drop {}

    fun init(witness: FAUCET_COIN_DEMO, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCET_COIN_DEMO>(
            witness, 
            2, 
            b"5255b64F", 
            b"5255b64's faucet coin", 
            b"5255b64's faucet coin", 
            option::none(), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        // transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
        transfer::public_share_object(treasury_cap)
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN_DEMO>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN_DEMO>, coin: Coin<FAUCET_COIN_DEMO>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(FAUCET_COIN_DEMO {}, ctx)
    }
}
