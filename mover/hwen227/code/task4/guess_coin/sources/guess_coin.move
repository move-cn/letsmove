
/// Module: guess_coin
module guess_coin::guess_coin{
    use sui::coin::{Self, Coin};
    use hwen_faucet_coin::hwen_faucet_coin::HWEN_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};

    const EVaultInsufficientBalance:u64 = 1;
    const EUserInsufficientBalance:u64 = 1;


    public struct Vault has key{
        id: UID, 
        balance: Balance<HWEN_FAUCET_COIN>,
    }

    public struct AdminCap has key{
        id: UID
    }

    fun init(ctx: &mut TxContext){
        let adminCap = AdminCap{ id:object::new(ctx)}; //生成唯一标识符UID
        let vault = Vault {id:object::new(ctx),balance:balance::zero<HWEN_FAUCET_COIN>()}; //唯一的UID，初始金额为0

        //金库权限共享，所有人可见可操作
        transfer::share_object(vault);
        transfer::transfer(adminCap,ctx.sender());
    }

    //向游戏金库内存入一定金额
    public entry fun Deposit(
        vault: &mut Vault,
        amount : u64,
        faucet: &mut Coin<HWEN_FAUCET_COIN>
    ){
        assert!(coin::value(faucet)>=amount,EUserInsufficientBalance);
        let deposit_amount = balance::split(coin::balance_mut(faucet),amount);
        balance::join(&mut vault.balance, deposit_amount); //Balance合并
    }


    //管理员提现
    public entry fun AdminWithdraw(
        _unused_admin:&AdminCap,
        vault: &mut Vault,
        amount:u64,
        ctx: &mut TxContext
    ){
        assert!(vault.balance.value() >= amount,EVaultInsufficientBalance); //金库余额检查
        let withdraw_amount = balance::split(&mut vault.balance, amount); //拆分金库余额
        let coins = coin::from_balance(withdraw_amount,ctx); //Wrap a balance into a Coin
        
        //or 
        //let coins = coin::take(&mut game.balance, amount, ctx);

        transfer::public_transfer(coins,ctx.sender()); //转账给发送者
    }

    entry fun GamePlay(
        random_num: &Random,
        vault: &mut Vault,
        guess: bool,
        cash : &mut Coin<HWEN_FAUCET_COIN>,
        ctx : &mut TxContext
    ){
        let player_amount = coin::value(cash);
        
        assert!(balance::value(&vault.balance) >= player_amount,EVaultInsufficientBalance);
        
        let mut  number_generator = random::new_generator(random_num,ctx);
        let result = random::generate_bool(&mut number_generator);

        if(result == guess){
            let gived_balance = balance::split(&mut vault.balance,player_amount);
            let reward = coin::from_balance(gived_balance,ctx);
            coin::join(cash,reward);
        }

        else{
            Self::Deposit(vault,coin::value(cash),cash);
        }

    }


}

