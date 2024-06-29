module task2::taenggu308_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct TAENGGU308_COIN has drop {}

    fun init(witness: TAENGGU308_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<TAENGGU308_COIN>(
            witness,
            9,
            b"TAENGGU308_COIN",
            b"TAENGGU308_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169317937")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<TAENGGU308_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<TAENGGU308_COIN>, 
        coin: Coin<TAENGGU308_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}