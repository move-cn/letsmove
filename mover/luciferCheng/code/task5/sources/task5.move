
/// Module: task5
module task5::myswap {
    use task2::mycoin::{MYCOIN};
    use task2::faucet_coin::{FAUCET_COIN};
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};

    const EInsufficientBalance: u64 = 11;

    public struct AdminCap has key {
        id: UID
    }

    public struct Wallet has key {
        id: UID,
        coin1: Balance<MYCOIN>,
        coin2: Balance<FAUCET_COIN>
    }

    fun init(ctx: &mut TxContext) {
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, tx_context::sender(ctx))
    }

    public fun initialize(_ :&AdminCap, coin1: Coin<MYCOIN>, coin2: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
        let mut wallet = Wallet {
            id: object::new(ctx),
            coin1: balance::zero(),
            coin2: balance::zero(),
        };

        balance::join(&mut wallet.coin1, coin::into_balance(coin1));
        balance::join(&mut wallet.coin2, coin::into_balance(coin2));

        transfer::share_object(wallet)
    }


    public entry fun add(coin1: Coin<MYCOIN>, coin2: Coin<FAUCET_COIN>,wallet: &mut Wallet){
        let balance1 = coin::into_balance(coin1);
        balance::join(&mut wallet.coin1, balance1);
        let balance2 = coin::into_balance(coin2);
        balance::join(&mut wallet.coin2, balance2);
    }

    public entry fun swapForB(coin: Coin<MYCOIN>, wallet: &mut Wallet, ctx: &mut TxContext) {
        let v1 = coin::value(&coin);
        assert!(v1 > 0, EInsufficientBalance);
        assert!(balance::value(&wallet.coin2) > v1, EInsufficientBalance);

        let coin2 = coin::take(&mut wallet.coin2, v1, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx));
        let balance = coin::into_balance(coin);
        balance::join(&mut wallet.coin1, balance);
    }

    public entry fun swapForA(coin: Coin<FAUCET_COIN>, wallet: &mut Wallet, ctx: &mut TxContext) {
        let v = coin::value(&coin);
        assert!(v > 0, EInsufficientBalance);
        assert!(balance::value(&wallet.coin1) > v, EInsufficientBalance);

        let coin2 = coin::take(&mut wallet.coin1, v, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx));
        let balance = coin::into_balance(coin);
        balance::join(&mut wallet.coin2, balance);
    }

    #[allow(lint(self_transfer))]
    public fun withdraw(_ :&AdminCap, wallet: &mut Wallet, ctx: &mut TxContext){
        let balance1 = balance::value(&wallet.coin1);
        let coin1 = coin::take(&mut wallet.coin1, balance1, ctx);
        transfer::public_transfer(coin1, tx_context::sender(ctx));

        let balance2 = balance::value(&wallet.coin2);
        let coin2 = coin::take(&mut wallet.coin2, balance2, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx))
    }
}

