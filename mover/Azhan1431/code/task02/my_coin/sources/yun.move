// file: my_coin.move
module my_coin::yun {
    use sui::coin::{Self, Coin, TreasuryCap};

     public struct YUN has drop {}

    fun init(witness: YUN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YUN>(
            witness,
            2,
            b"Azhan",
            b"YUN",
            b"this is a test coin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<YUN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<YUN>, coin: Coin<YUN>) {
        coin::burn(treasury_cap, coin);
    }

}
