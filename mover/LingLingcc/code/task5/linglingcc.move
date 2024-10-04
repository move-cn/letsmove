module linglingcc::myswap {
    use sui::balance;
    use sui::coin;

    public struct Pool<phantom LingLingcc, phantom LingLingccFaucet> has store, key {
        id: UID,
        llc_coin: balance::Balance<LingLingcc>,
        llc_faucet_coin: balance::Balance<LingLingccFaucet>,
        owner: address
    }

    const ONLYOWNER: u64 = 1;

    public entry fun create<LingLingcc, LingLingccFaucet>(ctx: &mut TxContext){
        let pool = Pool<LingLingcc, LingLingccFaucet>{
            id: object::new(ctx),
            llc_coin: balance::zero<LingLingcc>(),
            llc_faucet_coin: balance::zero<LingLingccFaucet>(),
            owner: tx_context::sender(ctx)
        };
        transfer::public_share_object(pool);
    }

    public entry fun addLiquid<LingLingcc, LingLingccFaucet>(pool: &mut Pool<LingLingcc, LingLingccFaucet>, mut llc: coin::Coin<LingLingcc>, mut llfc: coin::Coin<LingLingccFaucet>, llc_amount: u64, llfc_amount: u64, ctx: &mut TxContext){
        assert!(pool.owner == tx_context::sender(ctx), ONLYOWNER);
        let llc_input = coin::split(&mut llc, llc_amount, ctx);
        coin::put(&mut pool.llc_coin, llc_input);
        let llfc_input = coin::split(&mut llfc, llfc_amount, ctx);
        coin::put(&mut pool.llc_faucet_coin, llfc_input);
        transfer::public_transfer(llc, tx_context::sender(ctx));
        transfer::public_transfer(llfc, tx_context::sender(ctx));
    }

    public entry fun swap_llfc_to_llc<LingLingcc, LingLingccFaucet>(pool: &mut Pool<LingLingcc, LingLingccFaucet>, mut llfc: coin::Coin<LingLingccFaucet>, llfc_amount:u64, ctx: &mut TxContext){
        let coin_input = coin::split(&mut llfc, llfc_amount, ctx);
        coin::put(&mut pool.llc_faucet_coin, coin_input);
        let to_coin = coin::take(&mut pool.llc_coin, llfc_amount, ctx);
        transfer::public_transfer(to_coin, tx_context::sender(ctx));
        transfer::public_transfer(llfc, tx_context::sender(ctx));
    }

    public entry fun swap_llc_to_llfc<LingLingcc, LingLingccFaucet>(pool: &mut Pool<LingLingcc, LingLingccFaucet>, mut llc: coin::Coin<LingLingcc>, llc_amount:u64, ctx: &mut TxContext){
        let coin_input = coin::split(&mut llc, llc_amount, ctx);
        coin::put(&mut pool.llc_coin, coin_input);
        let to_coin = coin::take(&mut pool.llc_faucet_coin, llc_amount, ctx);
        transfer::public_transfer(to_coin, tx_context::sender(ctx));
        transfer::public_transfer(llc, tx_context::sender(ctx));
    }
}

