module task5::faucet_coin {

    use std::string;
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct FAUCET_COIN has drop {}

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

    // === Testing ===

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext){
        let witness = FAUCET_COIN {};
        init(witness, ctx);
    }
}