/// Module: 05swap
module swap::myswap {
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;

    public struct AdminCap has key {
        id: UID
    }

    public struct Wallet<phantom A> has key, store {
        id: UID,
        coin_a: Balance<A>,
        coin_b: Balance<SUI>
    }

    fun init(ctx: &mut TxContext) {
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, tx_context::sender(ctx))
    }

    public fun initialize<A>(_ :&AdminCap, ctx: &mut TxContext) {
        let wallet = Wallet<A> {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
        };

        transfer::public_share_object(wallet)
    }

    public fun addFaucet<A>(wallet :&mut Wallet<A>, coin1: Coin<A>, _ctx: &mut TxContext){
        balance::join(&mut wallet.coin_a, coin::into_balance(coin1));
    }

    
    public entry fun swapFaucet<A>(wallet :&mut Wallet<A>, coin2: Coin<SUI>, ctx: &mut TxContext) {
        let v = coin::value(&coin2);
        let coin1 = coin::take(&mut wallet.coin_a, v, ctx);
        transfer::public_transfer(coin1, tx_context::sender(ctx));
        balance::join(&mut wallet.coin_b, coin::into_balance(coin2));
    }

    #[allow(lint(self_transfer))]
    public fun withdraw<A>(_ :&AdminCap, wallet :&mut Wallet<A>, ctx: &mut TxContext){
        let balance2 = balance::value(&wallet.coin_b);
        let coin2 = coin::take(&mut wallet.coin_b, balance2, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx))
    }
}

