/// Module: sch678_faucet_coin
module sch678_faucet_coin::sch678_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct SCH678_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: SCH678_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<SCH678_FAUCET_COIN>(
            witness,
            9,
            b"SCH678_FAUCET_COIN",
            b"SCH678_FAUCET_COIN",
            b"my first faucet coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint_and_transfer(
        treasury_cap: &mut TreasuryCap<SCH678_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<SCH678_FAUCET_COIN>,
        coin: Coin<SCH678_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
