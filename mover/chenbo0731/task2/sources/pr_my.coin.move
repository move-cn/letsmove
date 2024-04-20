module new_coin::pr_my.coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Url,Self};

    struct pr_my.coin has drop {}

    fun init(witness: pr_my.coin, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<pr_my_COIN>(
            witness,
            6,
            b"pr",
            b"pr",
            b"learning for letsmove, power by chenbo0731",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://pub-d12507e471ea44b89eaa8d48d6397520.r2.dev/joker.jpg")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<Jpr_my.coin>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<pr_my.coin>, coin: Coin<pr_my.coin>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(pr_my.coin {}, ctx);
    }
}
