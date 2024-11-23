/*
/// Module: yxz252426_faucet
module yxz252426_faucet::yxz252426_faucet;
*/
module yxz252426_faucet::yxz252426_faucet {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct YXZ252426_FAUCET has drop {}

    fun init(
        witness: YXZ252426_FAUCET,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<YXZ252426_FAUCET>(
            witness,
            9,
            b"YXZ",
            b"YXZ252426_FAUCET",
            b"YXZ252426 Faucet Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/76983474"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YXZ252426_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<YXZ252426_FAUCET>,
        coin: Coin<YXZ252426_FAUCET>
    ) {
        coin::burn(treasury_cap, coin);

    }
}


