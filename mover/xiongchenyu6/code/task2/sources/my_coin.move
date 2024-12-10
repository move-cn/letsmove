/*
/// Module: task2
*/
module task2::autolife_robotics {
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct AUTOLIFE_ROBOTICS has drop {}

    fun init(witness: AUTOLIFE_ROBOTICS, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"AUTOLFIE",
            b"autolife robotics",
            b"First ai robot coin on sui net by autolife robotics",
            option::some<url::Url>(url::new_unsafe_from_bytes(b"https://www.autolife.ai/icon.svg")), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<AUTOLIFE_ROBOTICS>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}