module task5::xdd_object_swap {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::object;
    use sui::object::UID;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::TxContext;
    use xdd_object::xdd_object::XDD_OBJECT;
    use xdd_object_faucet::xdd_object_faucet::XDD_OBJECT_FAUCET;

    const BankXddObjectLow:u64 = 0x10001;
    const BankXddObjectFaucetLow:u64 = 0x10002;

    //管理员权限
    public struct AdminCap has key{
        id: UID
    }

    //交易所
    public struct Bank has key{
        id: UID,
        xdd_object: Balance<XDD_OBJECT>,
        xdd_object_faucet: Balance<XDD_OBJECT_FAUCET>
    }



    //初始化方法
    fun init(ctx: &mut TxContext) {
        //创建管理员权限，并将管理员权限给自己
        let adminCap = AdminCap{id: object::new(ctx)};
        transfer(adminCap, ctx.sender());

        //创建交易所， 将交易所权限共享
        let bank = Bank{
            id: object::new(ctx),
            xdd_object: balance::zero<XDD_OBJECT>(),
            xdd_object_faucet: balance::zero<XDD_OBJECT_FAUCET>()
        };
        share_object(bank);
    }

    //管理员存入金额
    public entry fun save_xdd_object_balance(_: &AdminCap, bank: &mut Bank, amount: Coin<XDD_OBJECT>, _ctx: &mut TxContext) {
        bank.xdd_object.join(coin::into_balance(amount));
    }

    public entry fun save_xdd_object_faucet_balance(_: &AdminCap, bank: &mut Bank, amount: Coin<XDD_OBJECT_FAUCET>, _ctx: &mut TxContext) {
        bank.xdd_object_faucet.join(coin::into_balance(amount));
    }

    //管理员取出金额
    public entry fun get_xdd_object_balance(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let balance = bank.xdd_object.split(amount);
        let out = coin::from_balance(balance, ctx);
        public_transfer(out, ctx.sender());
    }

    public entry fun get_xdd_object_faucet_balance(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let balance = bank.xdd_object_faucet.split(amount);
        let out = coin::from_balance(balance, ctx);
        public_transfer(out, ctx.sender());
    }

    //用XDD_OBJECT 兑换 XDD_OBJECT_FAUCET 比例 1:2
    public entry fun xdd_object_to_faucet(bank: &mut Bank, amount: Coin<XDD_OBJECT>, ctx: &mut TxContext) {
        let amountVal = amount.value()*2;
        assert!(bank.xdd_object_faucet.value() >= amountVal, BankXddObjectFaucetLow);

        //将XDD_OBJECT存到余额
        bank.xdd_object.join(coin::into_balance(amount));

        //取出XDD_OBJECT_FAUCET
        let out_balance = bank.xdd_object_faucet.split(amountVal);
        let out_coin = coin::from_balance(out_balance, ctx);

        //将取出来的钱转给用户
        public_transfer(out_coin, ctx.sender())

    }



    //用XDD_OBJECT_FAUCET 兑换 XDD_OBJECT 比例 2:1
    public entry fun faucet_to_xdd_object(bank: &mut Bank, amount: Coin<XDD_OBJECT_FAUCET>, ctx: &mut TxContext) {
        let amountVal = amount.value()/2;
        assert!(bank.xdd_object.value() >= amountVal, BankXddObjectFaucetLow);

        //将XDD_OBJECT存到余额
        bank.xdd_object_faucet.join(coin::into_balance(amount));

        //取出XDD_OBJECT_FAUCET
        let out_balance = bank.xdd_object.split(amountVal);
        let out_coin = coin::from_balance(out_balance, ctx);

        //将取出来的钱转给用户
        public_transfer(out_coin, ctx.sender())
    }

}
