module coin_faucet::linktimes_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct LINKTIMES_COIN has drop {}

    fun init(witness: LINKTIMES_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LINKTIMES_COIN>(
            witness,
            9,
            b"LINKTIMES_COIN",
            b"LINKTIMES_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169920582?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LINKTIMES_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LINKTIMES_COIN>, 
        coin: Coin<LINKTIMES_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}