/// Module: faucet_coin
module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::url::{Url,Self};

    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"Wbqqqq", b"Wbqqqq", b"Move coin by Wbqqqq", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/17332298")), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);

    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
