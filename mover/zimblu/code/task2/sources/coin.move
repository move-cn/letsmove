module task2::zimbluCoin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct ZIMBLUCOIN has drop {}

    fun init(witness: ZIMBLUCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<ZIMBLUCOIN>(
            witness,
            9,
            b"ZIMBLUCOIN",
            b"ZIMBLUCOIN",
            b"coin create by zimblu",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/94040354?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ZIMBLUCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<ZIMBLUCOIN>, 
        coin: Coin<ZIMBLUCOIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}