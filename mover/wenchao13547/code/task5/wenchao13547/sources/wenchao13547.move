module wenchao13547::wenchao13547 {
    // 引入Sui系统中与余额、货币和交易相关的模块
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;
    use my_coin::uu::UU; // 自定义货币 UU
    use faucet_coin::rr::RR; // 自定义货币 RR

    // 定义银行结构，包含两个余额字段，分别用于存储两种货币
    public struct Bank has key {
        id: UID,                  // 唯一标识符，用于标识银行对象
        hiro: Balance<UU>,    // MYCOIN货币的余额
        fct: Balance<RR>, // FAUCETCOIN货币的余额
    }

    // 定义管理员权限结构，包含唯一标识符
    public struct AdminCap has key {
        id: UID, // 唯一标识符，用于标识管理员权限对象
    }

    // 初始化函数，用于实例化Bank和AdminCap对象
    fun init(ctx: &mut TxContext) {
        // 创建银行对象，初始余额均为0
        let bank = Bank {
            id: object::new(ctx),                     // 创建新的银行对象ID
            hiro: balance::zero<UU>(),           // 初始化MYCOIN余额为0
            fct: balance::zero<RR>(),        // 初始化FAUCETCOIN余额为0
        };

        // 将银行对象设置为共享对象，允许多人访问
        transfer::share_object(bank);

        // 创建管理员权限对象
        let admincap = AdminCap {
            id: object::new(ctx), // 创建新的管理员权限对象ID
        };

        // 将管理员权限对象转移给当前交易发起者
        transfer::transfer(admincap, sender(ctx));
    }

    // 将 MYCOIN 货币转为余额并存入银行
    public entry fun deposit_hiro(bank: &mut Bank, hiro: Coin<UU>) {
        let hiro_balance = into_balance(hiro);          // 将MYCOIN货币转为余额
        balance::join(&mut bank.hiro, hiro_balance);    // 将余额加入银行的MYCOIN余额中
    }
    // 0x046911d077b4abb0cacf33a97460f39686dcf7d427f459976d5430d11afa5e6d
    // 将 FAUCETCOIN 货币转为余额并存入银行
    public entry fun deposit_fct(bank: &mut Bank, fct: Coin<RR>) {
        let fct_balance = into_balance(fct);            // 将FAUCETCOIN货币转为余额
        balance::join(&mut bank.fct, fct_balance);      // 将余额加入银行的FAUCETCOIN余额中
    }

    // 从银行中提取指定金额的 MYCOIN 并将其转为Coin
    public entry fun withdrawal_hiro(bank: &mut Bank, amt: u64, ctx: &mut TxContext) {
        let hiro_balance = balance::split(&mut bank.hiro, amt); // 从银行的MYCOIN余额中分离出指定金额
        let hiro_coin = from_balance(hiro_balance, ctx);        // 将余额转为货币形式
        public_transfer(hiro_coin, sender(ctx));               // 转移货币给当前交易发起者
    }

    // 使用 MYCOIN 兑换 FAUCETCOIN，兑换比例为 1:10
    public entry fun swap_hiro_fct(bank: &mut Bank, hiro: Coin<UU>, ctx: &mut TxContext) {
        let amt = coin::value(&hiro);                          // 获取MYCOIN货币的金额
        balance::join(&mut bank.hiro, into_balance(hiro));     // 将MYCOIN存入银行
        let amt_fct = amt * 100 / 10;                          // 计算需要兑换的FAUCETCOIN金额
        let fct_balance = balance::split(&mut bank.fct, amt_fct); // 从银行的FAUCETCOIN余额中分离兑换金额
        let fct_coin = from_balance(fct_balance, ctx);         // 将FAUCETCOIN余额转为货币形式
        public_transfer(fct_coin, sender(ctx));               // 转移FAUCETCOIN给交易发起者
    }

    // 使用 FAUCETCOIN 兑换 MYCOIN，兑换比例为 10:1
    public entry fun swap_fct_hiro(bank: &mut Bank, fct: Coin<RR>, ctx: &mut TxContext) {
        let amt = coin::value(&fct);                          // 获取FAUCETCOIN货币的金额
        balance::join(&mut bank.fct, into_balance(fct));      // 将FAUCETCOIN存入银行
        let amt_hiro = amt * 10 / 100;                        // 计算需要兑换的MYCOIN金额
        let hiro_balance = balance::split(&mut bank.hiro, amt_hiro); // 从银行的MYCOIN余额中分离兑换金额
        let hiro_coin = from_balance(hiro_balance, ctx);      // 将MYCOIN余额转为货币形式
        public_transfer(hiro_coin, sender(ctx));             // 转移MYCOIN给交易发起者
    }
}
