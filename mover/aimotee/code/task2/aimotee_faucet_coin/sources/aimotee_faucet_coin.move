module aimotee_faucet_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"Ai", b"Aimotee_faucet", b"a coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
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
0x2::coin::TreasuryCap<0xab2b02345d11f7ee492a0c20eb943c497d76e7461c13299a6ed5ddd37b55d4eb::my_coin::MY_COIN>