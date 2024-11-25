module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap, Coin};

    public struct FAUCET_COIN has drop {}

    const FAUCET_AMOUNT: u64 = 10;

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"faucet_coin",
            b"faucet_coin",
            b"zhaojune1's faucet_coin",
            option::none(),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender());
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, FAUCET_AMOUNT, ctx);
        transfer::public_transfer(coin, recipient);
    }
}
