#[allow(unused_use, duplicate_alias,lint(public_random))]
module my_game::my_game{
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random, new_generator};
    use faucet::mycoin::{MYCOIN};
    use 0x1::bcs::{};

    const BalanceValuesmall: u64 =  1000;

    //奖金池
    public struct Reward_pool has key,store{
        id: UID,
        balance: Balance<MYCOIN>,
    }
    //拥有者
    public struct Owner has key{
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let reward_poll = Reward_pool {id: object::new(ctx) ,balance: balance::zero(), };
        transfer::share_object(reward_poll);

        let owner = Owner { id: object::new(ctx) };
        transfer::transfer(owner,tx_context::sender(ctx));
    }
    //存款
    public entry fun Deposit(reward: &mut Reward_pool,coin: &mut Coin<MYCOIN>,amount: u64){

        //判断用户余额是否大于存款金额，如果小于直接回退
        assert!(coin::value(coin) >= amount,BalanceValuesmall);
        
        let split_balance  = balance::split(coin::balance_mut(coin), amount);
        balance::join(&mut reward.balance,split_balance);
    }
    //取款
    entry fun Withdraw(reward: &mut Reward_pool,amount: u64,_: &mut Owner,ctx: &mut TxContext){
        //判断奖金池余额是否大于要提取的金额
        assert!(reward.balance.value() >= amount,BalanceValuesmall);

        let recv_balance = coin::take(&mut reward.balance, amount, ctx);
        transfer::public_transfer(recv_balance, tx_context::sender(ctx));
    }
    //游戏逻辑
    public entry fun game(reward_poll: &mut Reward_pool,coin: &mut Coin<MYCOIN>,amount: u64,guess: bool,rand: &Random,ctx: &mut TxContext){
        //判断用户余额是否大于押注余额
        assert!(coin::value(coin) >= amount,BalanceValuesmall);

        let mut generator = new_generator(rand, ctx);
        let result = random::generate_u8_in_range(&mut generator, 0, 1);

        let flag: bool = result == 1;
        //如果猜测正确
        if (flag == guess) {
            let reward = coin::take(&mut reward_poll.balance, amount, ctx);
            coin::join(coin, reward);
        }
        else{
            Deposit(reward_poll, coin, amount);
        }
    }

}

