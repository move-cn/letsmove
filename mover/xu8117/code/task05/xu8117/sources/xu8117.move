module xu8117::swap {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::object;
    use sui::transfer::{public_transfer, share_object, transfer};
    use sui::tx_context::sender;
    use mycoin::xu8117coin::XU8117COIN;
    use mycoin::xu8117faucetcoin::XU8117FAUCETCOIN;

    const EXU8117COINNotEnough: u64 = 1;
    const EXU8117FAUCETCOINNotEnough: u64 = 2;

    public struct AdminCap has key {
        id: UID
    }

    public struct Bank has key {
        id: UID,
        xu8117coin: Balance<XU8117COIN>,
        xu8117faucetcoin: Balance<XU8117FAUCETCOIN>
    }


    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap {
            id: object::new(ctx)
        };
        transfer(adminCap, sender(ctx));

        let bank = Bank {
            id: object::new(ctx),
            xu8117coin: balance::zero<XU8117COIN>(),
            xu8117faucetcoin: balance::zero<XU8117FAUCETCOIN>()
        };
        share_object(bank)
    }

    fun get_xu8117coin_amount(bank: &mut Bank): u64 {
        balance::value(&bank.xu8117coin)
    }

    fun get_xu8117faucetcoin_amount(bank: &mut Bank): u64 {
        balance::value(&bank.xu8117faucetcoin)
    }

    public fun deposit_xu8117coin(bank: &mut Bank, xu8117coin: Coin<XU8117COIN>, _: &mut TxContext) {
        let xu8117coin_balance = coin::into_balance(xu8117coin);
        balance::join(&mut bank.xu8117coin, xu8117coin_balance);
    }

    public fun withdraw_xu8117coin(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        assert!(get_xu8117coin_amount(bank) > amount, EXU8117COINNotEnough);
        let xu8117coin_balance = balance::split(&mut bank.xu8117coin, amount);
        let xu8117coin = coin::from_balance(xu8117coin_balance, ctx);
        public_transfer(xu8117coin, sender(ctx));
    }

    public fun deposit_xu8117faucetcoin(bank: &mut Bank, xu8117faucetcoin: Coin<XU8117FAUCETCOIN>, _: &mut TxContext) {
        let xu8117faucetcoin_balance = coin::into_balance(xu8117faucetcoin);
        balance::join(&mut bank.xu8117faucetcoin, xu8117faucetcoin_balance);
    }

    public fun withdraw_xu8117faucetcoin(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        assert!(get_xu8117faucetcoin_amount(bank) > amount, EXU8117FAUCETCOINNotEnough);
        let xu8117faucetcoin_balance = balance::split(&mut bank.xu8117faucetcoin, amount);
        let xu8117faucetcoin = coin::from_balance(xu8117faucetcoin_balance, ctx);
        public_transfer(xu8117faucetcoin, sender(ctx));
    }

    public fun swap_xu8117coin_to_xu8117faucetcoin(bank: &mut Bank, xu8117coin: Coin<XU8117COIN>, ctx: &mut TxContext) {
        let amount = coin::value(&xu8117coin);
        assert!(get_xu8117faucetcoin_amount(bank) > amount, EXU8117FAUCETCOINNotEnough);
        balance::join(&mut bank.xu8117coin, coin::into_balance(xu8117coin));

        let xu8117faucetcoin_balance = balance::split(&mut bank.xu8117faucetcoin, amount);
        let xu8117faucetcoin = coin::from_balance(xu8117faucetcoin_balance, ctx);
        public_transfer(xu8117faucetcoin, sender(ctx));
    }

    public fun swap_xu8117faucetcoin_to_xu8117coin(
        bank: &mut Bank,
        xu8117faucetcoin: Coin<XU8117FAUCETCOIN>,
        ctx: &mut TxContext
    ) {
        let amount = coin::value(&xu8117faucetcoin);
        assert!(get_xu8117coin_amount(bank) > amount, EXU8117COINNotEnough);
        balance::join(&mut bank.xu8117faucetcoin, coin::into_balance(xu8117faucetcoin));

        let xu8117coin_balance = balance::split(&mut bank.xu8117coin, amount);
        let xu8117coin = coin::from_balance(xu8117coin_balance, ctx);
        public_transfer(xu8117coin, sender(ctx));
    }
}
