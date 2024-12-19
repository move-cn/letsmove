module task02::my_faucet_coin {

    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::url;

    public struct MY_FAUCET_COIN has drop {}

    fun init(witness: MY_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MY_FAUCET",
            b"my faucet coin",
            b"My second faucet coin on SUI by destec",
            option::some<url::Url>(url::new_unsafe_from_bytes(b"https://docs-zh.sui-book.com/img/logo.svg")), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    #[allow(lint(self_transfer))]
    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        let sender = tx_context::sender(ctx);

        transfer::public_transfer(coin, sender)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MY_FAUCET_COIN>, coin: Coin<MY_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
