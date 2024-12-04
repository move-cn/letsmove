module task2::luozzedc_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct LUOZZEDC_FAUCET_COIN has drop {}

    fun init(witness: LUOZZEDC_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LUOZZEDC_FAUCET_COIN>(
            witness,
            9,
            b"LUOZZEDC_FAUCET",
            b"LUOZZEDC_FAUCET",
            b"luozzedc's first faucet coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/161659515")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LUOZZEDC_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LUOZZEDC_FAUCET_COIN>, 
        coin: Coin<LUOZZEDC_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}