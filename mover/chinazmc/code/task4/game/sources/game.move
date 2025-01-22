/*
/// Module: game
module game::game;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions



module game::game {
    use std::string::{String, utf8};
    use faucet_coin::faucet_coin::FAUCET_COIN;
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::random;
    use sui::random::Random;

    // 错误码
    const EPLAYERNOTENOUGH:u64 = 101; // 玩家额度不够
const EGAMEPOOLNOTENOUGH:u64 = 102; // 游戏池额度不够
const EINPUTNOTRIGHT: u64 = 103; // 玩家输入信息不正确
const EDEPOSITNOTENOUGH:u64 = 104; // 存款额度不够

    public struct GamePool  has key {
        id:UID,
        name: String, // 资金池名称
        balance: Balance<FAUCET_COIN>,
    }
    //需要一个对象用于控制资金池的取款权限，该对象将在模块部署时将权限转移给部署者，并在取款函数中作为参数，这样只有部署者才能调用取款函数
    public struct AdminCap has key {
        id:UID,
    }
    fun init(ctx: &mut TxContext){
        let game = GamePool{
          id: object::new(ctx),
            name: utf8(b"chinazmc 资金池"),//必须包含自己的github id元素
            balance: balance::zero()
        };
        //共享资金池，所有玩家都可以看到
        transfer::share_object(game);
        let admin_cap = AdminCap {id: object::new(ctx)};
        // 转移资金池的控制权限给合约发布者，只有合约发布者才能取钱
        // 此处transfer和public_transfer有区别，注意结构体ability
        transfer::transfer(admin_cap,tx_context::sender(ctx))
    }

    //游戏池存钱
    public entry fun deposit(game_pool: &mut GamePool, input_coin: Coin<FAUCET_COIN>,coin_amount: u64,ctx: &mut TxContext){
        //判断存钱账户额度是否足够
        let coin_value = input_coin.value();
        assert!(coin_value >= coin_amount, EDEPOSITNOTENOUGH);
        //拆出要存储的代币额度，储存到游戏池
        let mut input_balance = coin::into_balance(input_coin);
        let split_balance = input_balance.split(coin_amount);
        game_pool.balance.join(split_balance);
        //将剩余代币返回给存钱账户
        let refund_coin = coin::from_balance(input_balance,ctx);
        transfer::public_transfer(refund_coin,tx_context::sender(ctx));
    }
    //合约发布者(有 AdminCap权限)取钱
    public entry fun withdrow(_:&AdminCap,game_pool:&mut GamePool,coin_amount: u64,ctx: &mut TxContext) {
        //判断游戏池里的balance是否足够
        let game_balance_value = game_pool.balance.value();
        assert!(game_balance_value >= coin_amount, EGAMEPOOLNOTENOUGH);
        //取钱：把balance转移成coin，然后把coin转移给合约发布者
        let withdrow_coin = coin::take(&mut game_pool.balance,coin_amount,ctx);
        transfer::public_transfer(withdrow_coin,tx_context::sender(ctx));
    }
    //玩游戏,参数：游戏池，玩家猜字，质押代币，质押代币额度，随机数，TxContext
    entry fun play(game_pool:&mut GamePool,input_guess:u64,input_coin:&mut Coin<FAUCET_COIN>,coin_amount:u64,r:&Random,ctx: &mut TxContext){
        //获取传入代币的额度
        let coin_value = input_coin.value();
        //判断玩家有没有足够的代币额度
        assert!(coin_value>= coin_amount,EPLAYERNOTENOUGH);
        //获取游戏池中代币额度
        let game_pool_value = game_pool.balance.value();
        assert!(game_pool_value>= coin_amount,EGAMEPOOLNOTENOUGH);
    //     判断输入参数是否正确
        assert!(input_guess == 1 || input_guess==2,EINPUTNOTRIGHT);
        //开始玩游戏
        //创建一个随机数生成器
        let mut random_generator = random::new_generator(r,ctx);
        let random_bool = random::generate_bool(&mut random_generator);
        if ((input_guess == 1 && random_bool)||(input_guess == 2 && !random_bool)){ //猜中
            //先从游戏池中拆出balance，再转换成coin，再转移给玩家
            let reward_balance = game_pool.balance.split(coin_amount);
            let reward_coin = coin::from_balance(reward_balance,ctx);
            transfer::public_transfer(reward_coin,tx_context::sender(ctx));
        }else {
            //猜错
            //玩家拆出coin，转成balance，再转移给游戏池
            let player_coin = input_coin.split(coin_amount,ctx);
            let player_balance = coin::into_balance(player_coin);
            game_pool.balance.join(player_balance);
        }
    }

}
