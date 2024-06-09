module task2::reitype0_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct REITYPE0_COIN has drop {}

    fun init(witness: REITYPE0_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<REITYPE0_COIN>(
            witness,
            9,
            b"REITYPE0_COIN",
            b"REITYPE0",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/161667098")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<REITYPE0_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<REITYPE0_COIN>, 
        coin: Coin<REITYPE0_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}