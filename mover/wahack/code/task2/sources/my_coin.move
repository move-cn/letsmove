/// Module: move_coin
module move_coin::my_coin {
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};

    public struct MY_COIN has drop{

    }

    fun init (witness: MY_COIN, ctx: &mut TxContext) {
        let (
            treasurycap, coin_meta
        ) = coin::create_currency(witness, 6, b"my_token", b"my_token", b"", option::none(), ctx);
        transfer::public_freeze_object(coin_meta);
        transfer::public_transfer(treasurycap, tx_context::sender(ctx))
    }

    #[test_only]
    public  fun test_init (ctx: &mut TxContext) {
        init(MY_COIN{}, ctx)
    }


    public  entry fun mint (treasury_cap: &mut TreasuryCap<MY_COIN>,  amount: u64, receipt: address, ctx: &mut  TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, receipt);
    }

    public  entry fun burn (treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>): u64 {
        coin::burn(treasury_cap, coin)
    }

}