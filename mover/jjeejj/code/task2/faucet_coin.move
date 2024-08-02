/// Module: faucet_coin
module faucet_coin::faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::balance;

    public struct FAUCET_COIN has drop {}

    public struct MySupply has key, store {
        id: UID,
        supply: balance::Supply<FAUCET_COIN>
    }


    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"iyi", b"iyi token", b"desc", option::none(), ctx);

        sui::transfer::public_share_object(metadata);

        let supply = coin::treasury_into_supply(treasury);
        transfer::public_transfer(MySupply {
            id: object::new(ctx),
            supply
        }, ctx.sender());
    }

    public entry fun mint(supply: &mut MySupply, value: u64, ctx: &mut TxContext) {
        let balance = balance::increase_supply(&mut supply.supply, value);
        let coin = coin::from_balance(balance, ctx);
        transfer::public_transfer(coin, ctx.sender());
    }

    public fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut tx_context::TxContext) {
        init(FAUCET_COIN{}, ctx);
    }
}

