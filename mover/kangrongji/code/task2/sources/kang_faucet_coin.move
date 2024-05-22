module task2::kang_faucet_coin {

    use sui::coin::{Self, Coin, TreasuryCap};

    public struct KANG_FAUCET_COIN has drop {}

    fun init(witness: KANG_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"KANGFAUCET",
            b"Faucet Coin",
            b"It's the faucet coin.",
            option::none(),
            ctx
        );
        transfer::public_share_object(treasury_cap);
        transfer::public_freeze_object(metadata);
    }

    public fun mint_and_transfer(
        treasury_cap: &mut TreasuryCap<KANG_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<KANG_FAUCET_COIN>,
        coin: Coin<KANG_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

}
