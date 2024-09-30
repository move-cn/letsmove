/// Module: swap0xhutou
module swap0xhutou::swap0xhutou {
    use faucet::faucet::FAUCET;
    use mycoin::mycoin::MYCOIN;
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::tx_context::sender;
    use sui::transfer::{public_transfer, share_object};

    const EOverBalance: u64 = 0;

    public struct SwapPool has key {
        id: UID,
        faucetbalance: Balance<FAUCET>,
        mycoinbalance: Balance<MYCOIN>,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let admincap = AdminCap {id: object::new(ctx)};
        let pool = SwapPool {id: object::new(ctx), faucetbalance: balance::zero<FAUCET>(), mycoinbalance: balance::zero<MYCOIN>()};

        share_object(pool);

        transfer::transfer(admincap, sender(ctx));
    }

    public entry fun deposit_faucet(_: &AdminCap, pool: &mut SwapPool, faucet: Coin<FAUCET>, _: &mut TxContext){
        let deposit_amount = coin::into_balance(faucet);
        balance::join(&mut pool.faucetbalance, deposit_amount);
    }

    public entry fun deposit_mycoin(_: &AdminCap, pool: &mut SwapPool, mycoin: Coin<MYCOIN>, _: &mut TxContext){
        let deposit_amount = coin::into_balance(mycoin);
        balance::join(&mut pool.mycoinbalance, deposit_amount);
    }

    public entry fun withdral_faucet(_: &AdminCap, pool: &mut SwapPool, amount: u64, ctx: &mut TxContext){
        assert!(amount <= balance::value(&pool.faucetbalance), EOverBalance );
        let withdral_amount = balance::split(&mut pool.faucetbalance, amount);
        public_transfer(coin::from_balance(withdral_amount, ctx), sender(ctx));
    }

    public entry fun withdral_mycoin(_: &AdminCap, pool: &mut SwapPool, amount: u64, ctx: &mut TxContext){
        assert!(amount <= balance::value(&pool.mycoinbalance), EOverBalance );
        let withdral_amount = balance::split(&mut pool.mycoinbalance, amount);
        public_transfer(coin::from_balance(withdral_amount, ctx), sender(ctx));
    }

    public entry fun swap_faucet_mycoin(pool: &mut SwapPool, faucet: Coin<FAUCET>, ctx: &mut TxContext) {
        // swap rate, 1:1
        let swap_balance_amount = coin::into_balance(faucet);
        let swap_amount = balance::value(&swap_balance_amount);
        assert!(swap_amount <= balance::value(&pool.mycoinbalance), EOverBalance );

        balance::join(&mut pool.faucetbalance, swap_balance_amount);

        let swap_balance_out = balance::split(&mut pool.mycoinbalance, swap_amount);
        public_transfer(coin::from_balance(swap_balance_out, ctx), sender(ctx));
    }

    public entry fun swap_mycoin_faucet(pool: &mut SwapPool, mycoin: Coin<MYCOIN>, ctx: &mut TxContext) {
        // swap rate, 1:1
        let swap_balance_in = coin::into_balance(mycoin);
        let swap_amount = balance::value(&swap_balance_in);
        assert!(swap_amount <= balance::value(&pool.faucetbalance), EOverBalance );

        balance::join(&mut pool.mycoinbalance, swap_balance_in);

        let swap_balance_out = balance::split(&mut pool.faucetbalance, swap_amount);
        public_transfer(coin::from_balance(swap_balance_out, ctx), sender(ctx));
    }


}

