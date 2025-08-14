module task2::joy1102_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct JOY1102_COIN has drop {}

    fun init(witness: JOY1102_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<JOY1102_COIN>(
            witness,
            9,
            b"JOY1102_COIN",
            b"joy1102",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/81794441")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JOY1102_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<JOY1102_COIN>, 
        coin: Coin<JOY1102_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}