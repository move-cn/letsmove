module task2::luozzedc_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct LUOZZEDC_COIN has drop {}

    fun init(witness: LUOZZEDC_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LUOZZEDC_COIN>(
            witness,
            9,
            b"LUOZZEDC_COIN",
            b"LUOZZEDC",
            b"learning for letsmove, power by luozzedc",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/161659515")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LUOZZEDC_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LUOZZEDC_COIN>, 
        coin: Coin<LUOZZEDC_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}