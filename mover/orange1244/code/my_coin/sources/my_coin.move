/// Module: my_coin
module my_coin::my_coin {

    use sui::coin;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency( witness, 6, b"MY COIN", b"MY COIN", b"MY COIN", option::none(), ctx);

        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_freeze_object(coin_metadata);
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<MY_COIN>, coin: coin::Coin<MY_COIN>) {
        coin::burn(treasury, coin);
    }
}