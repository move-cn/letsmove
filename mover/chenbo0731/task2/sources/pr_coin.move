module task2::pr_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Url,Self};

    public struct  PR_COIN has drop {}

    fun init(witness: PR_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<PR_COIN>(
            witness,
            6,
            b"PR",
            b"PR",
            b"learning for letsmove, power by chenbo0731",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://pub-d12507e471ea44b89eaa8d48d6397520.r2.dev/joker.jpg")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<PR_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<PR_COIN>, coin: Coin<PR_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(PR_COIN {}, ctx);
    }
}
