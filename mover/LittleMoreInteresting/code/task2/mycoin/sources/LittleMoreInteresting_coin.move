module mycoin::LittleMoreInterestingCOIN {
    use sui::coin::{Self, TreasuryCap, Coin};

    public struct LITTLEMOREINTERESTINGCOIN has drop {}

    fun init(witness: LITTLEMOREINTERESTINGCOIN, ctx: &mut TxContext) {

        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"LCOIN",
            b"LittleMoreInterestingCOIN",
            b"LittleMoreInterestingCOIN Task 2",
            option::none(),
            ctx
        );

        transfer::public_transfer(treasury, ctx.sender());

        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LITTLEMOREINTERESTINGCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}