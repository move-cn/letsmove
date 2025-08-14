module coin_demo::betheldev_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context;

    public struct BETHELDEV_COIN has drop {}

    fun init(witness: BETHELDEV_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(witness,6,b"BETHELDEV_COIN", b"",b"", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<BETHELDEV_COIN>, amount: u64, recepient: address , ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recepient, ctx);
    }
}
