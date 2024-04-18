module two_coins::siphonelee_faucet {
    use sui::tx_context::sender;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::balance;
    
    const ERequestTooMuch: u64 = 1;

    public struct SIPHONELEE_FAUCET has drop {}

    public struct Faucet has key {
        id: UID,
        balance: balance::Balance<SIPHONELEE_FAUCET>,
        return_per_request: u64,
        cool_down_period: u64,
    }

    fun init(_witness: SIPHONELEE_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(_witness, 6, b" SIPHONELEE-FAUCET", 
                                                        b"SIPHONE-FAUCET", b"the faucet of siphonelee", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, sender(ctx));

        let faucet = Faucet {
            id: object::new(ctx),
            balance: balance::zero(),
            return_per_request: 0,
            cool_down_period: 0,
        };
        transfer::share_object(faucet);
    }

    public entry fun change_settings(_: &mut TreasuryCap<SIPHONELEE_FAUCET>, faucet: &mut Faucet, 
                                        return_per_request: u64, cool_down_period: u64) {
        faucet.return_per_request = return_per_request;
        faucet.cool_down_period = cool_down_period;
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<SIPHONELEE_FAUCET>, faucet: &mut Faucet, amount: u64, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut faucet.balance, coin::into_balance(coin));
    }

    public entry fun request(faucet: &mut Faucet, amount: u64, ctx: &mut TxContext) {
        assert!(amount <= faucet.return_per_request, ERequestTooMuch);

        let coin = coin::take(&mut faucet.balance, amount, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(SIPHONELEE_FAUCET {}, ctx)
    }
}