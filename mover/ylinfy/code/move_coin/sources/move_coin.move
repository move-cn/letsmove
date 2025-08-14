module move_coin::ylinfy {
    // use sui::tx_context::{Self, TxContext};
    // use sui::transfer;
    // use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};

    // OTW
    public struct YLINFY has drop {}

    fun init(witness: YLINFY, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"YLY",
            b"YLINFY",
            b"ylinfy's first meme coin on sui",
            option::none(),
            ctx,
        );
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);
    }

    entry fun mint(
        treasury_cap: &mut TreasuryCap<YLINFY>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    entry fun burn(treasury_cap: &mut TreasuryCap<YLINFY>, coin: Coin<YLINFY>) {
        coin::burn(treasury_cap, coin);
    }
}
