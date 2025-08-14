/// Module: toma3610_coin
module toma3610_coin::toma3610_coin {

    use sui::coin::{Self, Coin, TreasuryCap};

    public struct TOMA3610_COIN has drop {}

    fun init(witness: TOMA3610_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6, // decimals
            b"toma3610 COIN", // symbol
            b"toma3610 COIN", // name
            b"Amazing Coin", // description
            option:: none(), // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<TOMA3610_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<TOMA3610_COIN>, coin: Coin<TOMA3610_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

