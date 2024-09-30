module task5::coin_b {
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};

    public struct COIN_B has drop{}

    fun init(witness :COIN_B, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MUB",
            b"COIN_B",
            b"MuyeC s Coin_B",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }
    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_B>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_B>, coin: Coin<COIN_B>) {
        coin::burn(treasury_cap, coin);
    }
}