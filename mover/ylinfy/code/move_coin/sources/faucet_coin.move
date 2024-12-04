module move_coin::ylinfy_faucet_coin {
    use sui::coin::{Self, TreasuryCap, Coin};

    public struct YLINFY_FAUCET_COIN has drop {}

    fun init(witness: YLINFY_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"YFC",
            b"Y-Faucet Coin",
            b"ylinfy's faucet coin",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    entry fun mint(
        treasury_cap: &mut TreasuryCap<YLINFY_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    entry fun burn(
        treasury_cap: &mut TreasuryCap<YLINFY_FAUCET_COIN>,
        coin: Coin<YLINFY_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}