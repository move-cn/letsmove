module faucet_coin::aiqubit_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object;
    use sui::balance::{Self, Balance};
    use sui::url::{Url,Self};

    public struct AIQUBIT_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: AIQUBIT_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<AIQUBIT_FAUCET>(
            witness,
            6,
            b"AIQF",
            b"AIQUBIT_FAUCET",
            b"Don't ask why",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/35585232?v=4")),
            ctx
        );

        transfer::public_freeze_object(metadata);

        transfer::public_share_object(treasury_cap)        
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AIQUBIT_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<AIQUBIT_FAUCET>, coin: Coin<AIQUBIT_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(AIQUBIT_FAUCET {}, ctx);
    }
}
