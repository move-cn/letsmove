/// Module: sch678_coin
module sch678_coin::sch678_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct SCH678_COIN has drop {}

    fun init(witness: SCH678_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<SCH678_COIN>(
            witness,
            9,
            b"SCH678_COIN",
            b"sch678",
            b"my first coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint_and_transfer(
        treasury_cap: &mut TreasuryCap<SCH678_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun transfer(
        coin:&mut Coin<SCH678_COIN>,
        amount: u64,
        receipt: address,
        ctx: &mut TxContext
    ) {
        let new_coin = coin::split(coin,amount,ctx);
        transfer::public_transfer(new_coin, receipt);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<SCH678_COIN>,
        coin: Coin<SCH678_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }

}
