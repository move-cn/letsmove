module jmagicc_coin::jmagicc_coin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct JMAGICC_COIN has drop {}


    fun init(witness: JMAGICC_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,                // decimals
            b"JMAGICC",           // symbol
            b"Jmagicc Coin",       // name
            b"Jmagicc Coin", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/58356228")), // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }


    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<JMAGICC_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }


    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<JMAGICC_COIN>, target: coin::Coin<JMAGICC_COIN>) {
        coin::burn(treasury_cap, target);
    }
}
