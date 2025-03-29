module my_coin::my_coin {
    use sui::coin::{Self, TreasuryCap };
    use sui::url::{Url,Self};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 8, b"MY_COIN", b"MY_COIN", b"Move coin by MY_COIN", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/17332298")), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }
    
    
}