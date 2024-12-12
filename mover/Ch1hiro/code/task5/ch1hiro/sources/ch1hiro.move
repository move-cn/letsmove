module ch1hiro::ch1hiro {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;
    use mycoin::mycoin::MYCOIN;
    use mycoin::faucetcoin::FAUCETCOIN;

    // 创建银行
    public struct Bank has key {
        id: UID,
        hiro: Balance<MYCOIN>,
        fct: Balance<FAUCETCOIN>
    }

    // 创建管理员权限
    public struct AdminCap has key {
        id: UID,
    }

    // 实例化对象
    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            hiro: balance::zero<MYCOIN>(),
            fct: balance::zero<FAUCETCOIN>(),
        };

        transfer::share_object(bank);

        let admincap = AdminCap {
            id: object::new(ctx),
        };

        transfer::transfer(admincap, sender(ctx));
    }

    // 将 hiro 转换为 balance 存入银行
    public entry fun deposit_hiro(bank: &mut Bank, hiro: Coin<MYCOIN>) {
        let hiro_balance = into_balance(hiro);
        balance::join(&mut bank.hiro, hiro_balance);
    }

    // 将 fct 转换为 balance 存入银行
    public entry fun deposit_fct(bank: &mut Bank, fct: Coin<FAUCETCOIN>) {
        let fct_balance = into_balance(fct);
        balance::join(&mut bank.fct, fct_balance);
    }

    // 将 hiro 转为 coin 并取出
    public entry fun withdrawal_hiro(bank: &mut Bank, amt: u64, ctx: &mut TxContext) {
        let hiro_balance = balance::split(&mut bank.hiro, amt);
        let hiro_coin = from_balance(hiro_balance, ctx);
        public_transfer(hiro_coin, sender(ctx));
    }

    // 1 hiro == 10 fct
    public entry fun swap_hiro_fct(bank: &mut Bank, hiro: Coin<MYCOIN>, ctx: &mut TxContext) {
        let amt = coin::value(&hiro);
        balance::join(&mut bank.hiro, into_balance(hiro));
        let amt_fct = amt * 100 / 10;
        let fct_balance = balance::split(&mut bank.fct, amt_fct);
        let fct_coin = from_balance(fct_balance, ctx);
        public_transfer(fct_coin, sender(ctx));
    }

    public entry fun swap_fct_hiro(bank: &mut Bank, fct: Coin<FAUCETCOIN>, ctx: &mut TxContext) {
        let amt = coin::value(&fct);
        balance::join(&mut bank.fct, into_balance(fct));
        let amt_hiro = amt * 10 / 100;
        let hiro_balance = balance::split(&mut bank.hiro, amt_hiro);
        let hiro_coin = from_balance(hiro_balance, ctx);
        public_transfer(hiro_coin, sender(ctx));
    }
}

