/// Module: faucet_coin
module move_coin::faucet_coin {
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};

    public struct FAUCET_COIN has drop{

    }

    fun init (witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (
            treasurycap, coin_meta
        ) = coin::create_currency(witness, 6, b"faucet_token", b"faucet_token", b"", option::none(), ctx);
        transfer::public_freeze_object(coin_meta);
        transfer::public_share_object(treasurycap)
    }

    #[test_only]
    public  fun test_init (ctx: &mut TxContext) {
        init(FAUCET_COIN{}, ctx)
    }


    public  entry fun mint (treasury_cap: &mut TreasuryCap<FAUCET_COIN>,  amount: u64, receipt: address, ctx: &mut  TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, receipt);
    }

    public  entry fun burn (treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>): u64 {
        coin::burn(treasury_cap, coin)
    }

}