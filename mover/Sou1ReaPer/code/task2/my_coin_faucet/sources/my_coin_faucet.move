module my_coin_faucet::my_coin_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url;
    use std::ascii::string;

    public struct MY_COIN_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: MY_COIN_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN_FAUCET>(
            witness,
            6,
            b"SRF",
            b"Sou1ReaPerFaucet",
            b"created by Sou1ReaPer, faucet coin",
            option::some(url::new_unsafe(string(b"https://krseoul.imgtbl.com/i/2024/08/07/66b2ffe52d644.png"))),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MY_COIN_FAUCET>, coin: Coin<MY_COIN_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MY_COIN_FAUCET {}, ctx);
    }
}
