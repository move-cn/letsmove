module wulabalabo_coin::W_Faucet_Coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{TxContext};
    use sui::url::{Url,Self};

    struct W_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness:W_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<W_FAUCET_COIN>(
            witness,
            3,
            b"WFC",
            b"WFC",
            b"Move-cn Faucet Task Coin by Wulabalbo",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://blush-left-firefly-321.mypinata.cloud/ipfs/QmbLCxFoe9E55vgB9m4HFYeq1rxYa3wm5RDKY3tKSPwXc4")),
            ctx
        );        

        transfer::public_freeze_object(metadata);        
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<W_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<W_FAUCET_COIN>, coin: Coin<W_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(W_FAUCET_COIN {}, ctx);
    }
}
