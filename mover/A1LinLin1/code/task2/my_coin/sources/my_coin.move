/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::A1LinLin1_coin {
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct A1LINLIN1_COIN has drop {}

    fun init(witness: A1LINLIN1_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            6,
            b"A1LinLin1_coin",
            b"A1LinLin1_coin",
            b"I love A1LinLin1_coin. I love blockchains.",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<A1LINLIN1_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<A1LINLIN1_COIN>,
        coin: Coin<A1LINLIN1_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}