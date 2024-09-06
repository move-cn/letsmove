module task5::coin_a {
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};

    public struct COIN_A has drop{}

    fun init(witness :COIN_A, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MUA",
            b"COIN_A",
            b"MuyeC s Coin_A",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }
    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_A>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_A>, coin: Coin<COIN_A>) {
        coin::burn(treasury_cap, coin);
    }
}