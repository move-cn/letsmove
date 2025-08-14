module faucet_coin::cjw_faucet_coin {
    use sui::url::{Self, Url};
    use sui::coin::{Self, TreasuryCap};

    public struct CJW_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: CJW_FAUCET_COIN, ctx: &mut TxContext) {
        let ( treasury, metadata ) = coin::create_currency(
            witness,
            9,
            b"CJWFC",
            b"cjw-Faucet-Coin",
            b"This is a faucet coin for cuijiawei",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/44763220?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(
        treasury: &mut TreasuryCap<CJW_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}