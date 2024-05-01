
/// Module: task2
module task2::liushuyu6666_coin {
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::url::{Url, Self};

    public struct LIUSHUYU6666_COIN has drop {}

    fun init(witness: LIUSHUYU6666_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"LSYCOIN",
            b"LIUSHUYU6666_COIN",
            b"currency from liushuyu6666",
            option::some<Url>(
                url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/58156532?v=4")
            ), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<LIUSHUYU6666_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<LIUSHUYU6666_COIN>, coin: Coin<LIUSHUYU6666_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

