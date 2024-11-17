/*
/// Module: task2
*/
module task2::my_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MYCOIN",
            b"my first coin",
            b"My first coin on sui net by cryptoctl",
            option::some<url::Url>(url::new_unsafe_from_bytes(b"https://cdn.prod.website-files.com/6425f546844727ce5fb9e5ab/65690e5e73e9e2a416e3502f_sui-mark.svg")), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}