module two_coins::siphonelee_faucet {
    use sui::tx_context::sender;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::balance;
    use sui::table::{Table, Self};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::address;

    const ERequestTooMuch: u64 = 1;
    const ERequestTooOften: u64 = 2;

    public struct SIPHONELEE_FAUCET has drop {}

    public struct Faucet has key {
        id: UID,
        balance: balance::Balance<SIPHONELEE_FAUCET>,
        return_per_request: u64,
        cool_down_period: u64,
        request_history: Table<u256, u64>,
    }

    public struct RquestEvent has copy, drop {
        addr: address,
        time_span: u64,
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
            request_history: table::new(ctx),
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

    public entry fun request(faucet: &mut Faucet, amount: u64, clock: &Clock, ctx: &mut TxContext) {
        assert!(amount <= faucet.return_per_request, ERequestTooMuch);
        
        let addr = sender(ctx);
        let iaddr = address::to_u256(addr);
        let request_history = &mut faucet.request_history;

        let now = clock::timestamp_ms(clock);
        if (request_history.contains(iaddr)) {
            let last_time = request_history.borrow_mut(iaddr);

            let span = now - *last_time;
            assert!(span >= faucet.cool_down_period, ERequestTooOften);

            *last_time = now;  
            event::emit(RquestEvent { 
                    addr: addr,
                    time_span: span,
                });
        } else {
            request_history.add(iaddr, now);

            event::emit(RquestEvent { 
                    addr: addr,
                    time_span: 0,
                });
        };

        let coin = coin::take(&mut faucet.balance, amount, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(SIPHONELEE_FAUCET {}, ctx)
    }
}