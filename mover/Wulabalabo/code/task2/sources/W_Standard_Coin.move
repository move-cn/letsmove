module wulabalabo_coin::W_Standard_Coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Url,Self};

    struct W_STANDARD_COIN has drop {}

    fun init(witness:W_STANDARD_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<W_STANDARD_COIN>(
            witness,
            3,
            b"WSC",
            b"WSC",
            b"Move-cn Standard Task Coin by Wulabalbo",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://blush-left-firefly-321.mypinata.cloud/ipfs/QmUiH9Sh5LqCYdaz4N9CS9nLNH8hk64i6UeAV9ntsXRAXF")),
            ctx
        );        

        transfer::public_freeze_object(metadata);        
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<W_STANDARD_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<W_STANDARD_COIN>, coin: Coin<W_STANDARD_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(W_STANDARD_COIN {}, ctx);
    }
}
