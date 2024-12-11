module flip_coin::flip_coin {
    use sui::balance::{Balance, zero};
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::transfer::{public_transfer, share_object};
    use faucet_coin::rmb::RMB; // 导入自定义代币
    use sui::random::{Random, new_generator, generate_bool};
    // use sui::sui::SUI;

    /// 定义游戏结构体
    public struct Game has key {
        id: UID,
        amt: Balance<RMB>,
        github_id: vector<u8>,
    }

    /// 定义管理员权限
    public struct AdminCap has key, store {
        id: UID,
    }

    /// 初始化游戏
    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            amt: zero<RMB>(), // 初始余额为 0
            github_id: b"guoying2026", // 添加 GitHub ID
        };
        // 游戏对象共享所有权，允许所有人访问
        share_object(game);

        // 初始化管理员权限
        let admin = AdminCap { id: object::new(ctx) };
        // 转移管理员权限给合约发布者
        public_transfer(admin, ctx.sender());
    }

    //只要有随机数，最好不要用public，防止别人攻击你的合约。_rand参数传入0x8
    entry fun play(game: &mut Game,_rand: &Random,in_: bool, in_coin:Coin<RMB>, ctx:&mut TxContext) {
        let amt_value = in_coin.value();
        let game_amt = game.amt.value();
        //用户输入的值必须小于池子里面的钱
        // 1sui 连续玩10次 true 输入的金额每次都是池子的钱 all in
        // 每次最多只能输入池子的10分之一
        assert!(game_amt >= amt_value * 10, 0x111);
        //正面 反面 -> bool  true   false
        //随机数来控制输赢
        let mut _gen = new_generator(_rand, ctx);
        let flip_value = generate_bool(&mut _gen);
        if(in_ == flip_value) { //代表你赢了
            //赢了加倍
            let out_balance = game.amt.split(amt_value);
            let out_coin = from_balance(out_balance, ctx);
            //把钱转移走了
            public_transfer(out_coin, ctx.sender());
            public_transfer(in_coin, ctx.sender());
        } else { //代表你输了
            //输了就没了，需要把coin对象转换成balance
            let int_amt_balance = into_balance(in_coin);
            //把自己的钱转到游戏池子里
            game.amt.join(int_amt_balance) ;
        }
    }

    public entry fun add_rmb(game: &mut Game, in:Coin<RMB>)
    {
        let in_amt_balance = into_balance(in);
        game.amt.join(in_amt_balance);
    }

    public entry fun remove_rmb(_:&AdminCap,game: &mut Game, amt: u64, ctx: &mut TxContext)
    {
        let out_balance = game.amt.split(amt);
        let out_coin = from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
    }
}
