module faucet_coin::faucet_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::object;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCET_COIN has drop {}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<FAUCET_COIN>(
            witness,
            2, 
            b"Faucet_coin", 
            b"lzh", 
            b"", 
            option::none(), 
            ctx);
        transfer::public_freeze_object(metadata); 
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

}