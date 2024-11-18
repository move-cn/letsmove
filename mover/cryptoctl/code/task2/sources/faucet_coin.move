module task2::faucet_coin {

    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::url;

    public struct FAUCET_COIN has drop {}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"FAUCET",
            b"my second coin",
            b"My second faucet coin on sui net by cryptoctl",
            option::some<url::Url>(url::new_unsafe_from_bytes(b"")), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    #[allow(lint(self_transfer))]
    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        let sender = tx_context::sender(ctx);

        transfer::public_transfer(coin, sender)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
