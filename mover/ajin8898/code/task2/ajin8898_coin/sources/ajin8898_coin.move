/// Module: ajin8898_coin
module ajin8898_coin::ajin8898_coin {

    use sui::coin::{Self, Coin, TreasuryCap};

    public struct AJIN8898_COIN has drop {}

    fun init(witness: AJIN8898_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6, // decimals
            b"ajin8898 COIN", // symbol
            b"ajin8898 COIN", // name
            b"Amazing Coin", // description
            option:: none(), // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AJIN8898_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<AJIN8898_COIN>, coin: Coin<AJIN8898_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

