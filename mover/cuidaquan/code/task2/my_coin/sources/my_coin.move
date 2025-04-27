module my_coin::my_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"CUIDAQUAN_COIN", b"cuidaquan_coin", b"my_coin", option::none(), ctx );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender());
    }

    public fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, ctx.sender(), ctx);
    }

}