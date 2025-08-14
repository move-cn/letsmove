module mycoin::wyzzheCoin {
    use std::option;
    // coin function:
    // sui:coin:create_currency
    // sui:coin:mint_and_transfer
    // sui:coin:burn
    // coin struct:
    // sui:coin:{Self, TreasuryCap}
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // one-time-witness source
    // datatype:WYZZHECOIN
    public struct WYZZHECOIN has drop {}

    // template
    fun init(witness: WYZZHECOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            // parameters
            witness, // T=WYZZHECOIN
            6,  // decimals
            b"WYZZHECOIN",  // symbol
            b"WYZ", // name
            b"Power by wyz",  // description
            option::none(),  // icon_url
            ctx
        );
        // can not be changed
        transfer::public_freeze_object(metadata);
        // treasury transfer to creater_adderss
        // treasury belong to creater_adderss
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    // mint
    public fun mint(
        treasury_cap: &mut TreasuryCap<WYZZHECOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // burn
    public fun burn(treasury_cap: &mut TreasuryCap<WYZZHECOIN>, coin: Coin<WYZZHECOIN>) {
        coin::burn(treasury_cap, coin);
    }
}