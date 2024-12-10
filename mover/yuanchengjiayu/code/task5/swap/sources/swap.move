module swap::swap;
    use movecoin::movecoin::{ MOVECOIN };
    use movefaucetcoin::movefaucetcoin::{ MOVEFAUCETCOIN };
    use sui::balance::{ Self, Balance };
    use sui::transfer::{ transfer, share_object, public_transfer };
    use sui::coin::{ Self, Coin };

    public struct AdminCap has key {
        id: UID
    }

    public struct Bank has key {
        id: UID,
        movecoin: Balance<MOVECOIN>,
        movefaucetcoin: Balance<MOVEFAUCETCOIN>,
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            movecoin: balance::zero<MOVECOIN>(),
            movefaucetcoin: balance::zero<MOVEFAUCETCOIN>(),
        };
        share_object(bank);

        let admin_cap = AdminCap {
            id: object::new(ctx),
        };
        transfer(admin_cap, ctx.sender());
    }

    public entry fun deposit_movecoin(bank: &mut Bank, movecoin: Coin<MOVECOIN>) {
        let movecoin_balance = coin::into_balance(movecoin);
        balance::join(&mut bank.movecoin, movecoin_balance);
    }

    public entry fun deposit_movefaucetcoin(bank: &mut Bank, movefaucetcoin: Coin<MOVEFAUCETCOIN>) {
        let movefaucetcoin_balance = coin::into_balance(movefaucetcoin);
        balance::join(&mut bank.movefaucetcoin, movefaucetcoin_balance);
    }

    public entry fun withdraw_movecoin(bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let movecoin_balance = balance::split(&mut bank.movecoin, amount);
        let movecoin = coin::from_balance(movecoin_balance, ctx);
        public_transfer(movecoin, ctx.sender());
    }

    public entry fun withdraw_movefaucetcoin(bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let movefaucetcoin_balance = balance::split(&mut bank.movefaucetcoin, amount);
        let movefaucetcoin = coin::from_balance(movefaucetcoin_balance, ctx);
        public_transfer(movefaucetcoin, ctx.sender());
    }

    public entry fun swap_movecoin_to_movefaucetcoin(bank: &mut Bank, movecoin: Coin<MOVECOIN>, ctx: &mut TxContext) {
        let amount = coin::value(&movecoin);
        balance::join(&mut bank.movecoin, coin::into_balance(movecoin));

        let amount_end = amount * 2;
        let movefaucetcoin_balance = balance::split(&mut bank.movefaucetcoin, amount_end);
        let movefaucetcoin = coin::from_balance(movefaucetcoin_balance, ctx);
        public_transfer(movefaucetcoin, ctx.sender());
    }

    public entry fun swap_movefaucetcoin_to_movecoin(bank: &mut Bank, movefaucetcoin: Coin<MOVEFAUCETCOIN>, ctx: &mut TxContext) {
        let amount = coin::value(&movefaucetcoin);
        balance::join(&mut bank.movefaucetcoin, coin::into_balance(movefaucetcoin));

        let amount_end = amount / 2;
        let movecoin_balance = balance::split(&mut bank.movecoin, amount_end);
        let movecoin = coin::from_balance(movecoin_balance, ctx);
        public_transfer(movecoin, ctx.sender());
    }