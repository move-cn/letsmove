module task2::o0x97_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct O0X97_COIN has drop {}

    fun init(witness: O0X97_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<O0X97_COIN>(
            witness,
            9,
            b"O0X97_COIN",
            b"O0X97_COIN",
            b"coin create by o0x97",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169955655")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<O0X97_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<O0X97_COIN>, 
        coin: Coin<O0X97_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}