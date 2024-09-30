module coin::howardlau2000_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct HOWARDLAU2000_COIN has drop {}

    fun init(witness: HOWARDLAU2000_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<HOWARDLAU2000_COIN>(
            witness,
            9,
            b"HOWARDLAU2000_COIN",
            b"howardlau2000",
            b"virtual coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167279232")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HOWARDLAU2000_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<HOWARDLAU2000_COIN>, 
        coin: Coin<HOWARDLAU2000_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}