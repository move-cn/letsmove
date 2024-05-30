module task2::faucet_coin {

    use std::option;
    use std::string;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{TxContext};
    use sui::url;

    struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, meta_data) = coin::create_currency<FAUCET_COIN>(
            witness,
            6,
            b"Heemale Faucet",
            b"Heemale Faucet Coin",
            b"相信的心是我们的魔法",
            option::some(
                url::new_unsafe(
                    string::to_ascii(
                        string::utf8(
                            b"https://avatars.githubusercontent.com/u/57651639?s=400&u=25e8d8a5c8eed5d1408617994c5d8ea8ec0ac5c2&v=4"
                        )
                    )
                )
            ),
            ctx
        );

        transfer::public_share_object(treasury);
        transfer::public_freeze_object(meta_data);
    }

    entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}