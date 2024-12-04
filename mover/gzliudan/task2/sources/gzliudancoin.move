module task2::gzliudan_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct GZLIUDAN_COIN has drop {}

    fun init(witness: GZLIUDAN_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                  // decimals
            b"GZC",             // symbol
            b"gzliudan coin",   // name
            b"just for test",   // description
            option::none(),     // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury: &mut TreasuryCap<GZLIUDAN_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }

    public entry fun burn(treasury: &mut TreasuryCap<GZLIUDAN_COIN>, coin: Coin<GZLIUDAN_COIN>) {
        coin::burn(treasury, coin);
    }
}

