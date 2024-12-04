module task2_coins::geekzlk_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct GEEKZLK_COIN has drop {}

    fun init(witness: GEEKZLK_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<GEEKZLK_COIN>(
            witness,
            9,
            b"GEEKZLK_COIN",
            b"GEEKZLK_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169317524")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<GEEKZLK_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<GEEKZLK_COIN>, 
        coin: Coin<GEEKZLK_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}