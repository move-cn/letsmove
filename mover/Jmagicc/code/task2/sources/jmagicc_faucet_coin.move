module jmagicc_faucet_coin::jmagicc_faucet_coin {
    use sui::coin::{Self};
    use sui::url::{Url,Self};

    public struct JMAGICC_FAUCET_COIN has drop {}


    fun init(witness: JMAGICC_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,                // decimals
            b"JMAGICC FAUCET",           // symbol
            b"Jmagicc Faucet Coin",       // name
            b"Jmagicc Faucet Coin", // description
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/58356228")), // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);

        transfer::public_share_object(treasury_cap)
    }


    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<JMAGICC_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }


    public entry fun burn(treasury_cap: &mut coin::TreasuryCap<JMAGICC_FAUCET_COIN>, target: coin::Coin<JMAGICC_FAUCET_COIN>) {
        coin::burn(treasury_cap, target);
    }
}


