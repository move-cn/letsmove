module faucet_coin::aiqubit_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object;
    use sui::balance::{Self, Balance};
    use sui::url::{Url,Self};

    public struct AIQUBIT_FAUCET has drop {}

    public struct Wallet has key {
        id: UID,
        coin: Balance<AIQUBIT_FAUCET>
    }

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

        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

        let wallet = new_wallet(ctx, balance::zero());
        transfer::public_share_object(wallet)

        // transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

        
    }

    public fun new_wallet(ctx: &mut TxContext, coin: Balance<AIQUBIT_FAUCET>): Wallet {
        Wallet {
            id: object::new(ctx),
            coin: coin
        }
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AIQUBIT_FAUCET>, amount: u64, wallet: &mut Wallet, ctx: &mut TxContext
    ) {
        let c1 = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(c1));
    }

    public entry fun faucet(wallet: &mut Wallet, ctx: &mut TxContext) {
        let c2 = coin::take(&mut wallet.coin, 1000, ctx);
        transfer::public_transfer(c2, tx_context::sender(ctx));
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<AIQUBIT_FAUCET>, coin: Coin<AIQUBIT_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(AIQUBIT_FAUCET {}, ctx);
    }
}
