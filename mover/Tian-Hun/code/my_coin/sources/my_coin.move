
/// Module: my_coin
module my_coin::tianhun_coin {
    use sui::url::{Self, Url};
    use sui::coin::{Self, TreasuryCap};

    public struct TIANHUN_COIN has drop {}

    fun init(witness: TIANHUN_COIN, ctx: &mut TxContext) {
        let ( treasury, metadata ) = coin::create_currency(
            witness,
            9,
            b"THC",
            b"Tian-HunCoin",
            b"This is a coin for Tian-Hun",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/22492312?v=4")),
            ctx
        );

        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(
        treasury: &mut TreasuryCap<TIANHUN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}

