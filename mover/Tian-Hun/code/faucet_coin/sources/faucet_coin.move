/// Module: faucet_coin
module faucet_coin::tianhun_faucet_coin {
    use sui::url::{Self, Url};
    use sui::coin::{Self, TreasuryCap};

    public struct TIANHUN_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: TIANHUN_FAUCET_COIN, ctx: &mut TxContext) {
        let ( treasury, metadata ) = coin::create_currency(
            witness,
            9,
            b"THFC",
            b"Tian-HunFaucetCoin",
            b"This is a faucet coin for Tian-Hun",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/22492312?v=4")),
            ctx
        );

        transfer::public_share_object(treasury);
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(
        treasury: &mut TreasuryCap<TIANHUN_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}
