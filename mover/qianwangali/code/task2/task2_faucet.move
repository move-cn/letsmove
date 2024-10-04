module task_2::faucet_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCET_COIN has drop {}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<FAUCET_COIN>(
            witness,
            6,
            b"coin",
            b"FaucetCoin",
            b"this faucet-coin is for Task2",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }
    public entry fun mint(
        treasury: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, tx_context::sender(ctx), ctx);
    }
    public fun burn(
        treasury: &mut TreasuryCap<FAUCET_COIN>, 
        coin: Coin<FAUCET_COIN>
    ) {
        coin::burn(treasury, coin);
    }
}