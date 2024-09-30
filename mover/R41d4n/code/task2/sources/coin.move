module task2::r41d4n_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct R41D4N_COIN has drop {}

    fun init(witness: R41D4N_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<R41D4N_COIN>(
            witness,
            9,
            b"R41D4N_COIN",
            b"R41D4N_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169955532")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<R41D4N_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<R41D4N_COIN>, 
        coin: Coin<R41D4N_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}