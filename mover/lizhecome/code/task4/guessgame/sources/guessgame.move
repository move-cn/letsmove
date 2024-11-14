/*
/// Module: guessgame
module guessgame::guessgame;
*/
module guessgame::guessgame{
    use sui::balance::{Self,Balance};
    use sui::coin::{Self,Coin};
    use faucetcoin::lizhecome_faucet_coin::LIZHECOME_FAUCET_COIN;
    use sui::random::{Self,Random};
    use sui::transfer::{share_object};

    const EOverBalance:u64 = 0;
    const EOnlyOneFAUCET:u64 = 1;
    const EVaultIsEmpty:u64 = 2;

    // 定义游戏金库，包含一个唯一标识和金库余额
    // 可见性为公有，并且具有key特性，因为要上链，让所有参与者可以访问
    public struct Vault has key {
        id:UID,
        balance:Balance<LIZHECOME_FAUCET_COIN>,
    }

    // 定义管理员权限标识
    // 拥有管理员权限的地址可以对游戏进行管理操作
    public struct AdminCap has key{
        id:UID
    }

    // 初始化函数
    // 初始化管理员权限及游戏金库，并把管理员权限传输给调用者
    fun init(ctx: &mut TxContext){
        let admincap = AdminCap { id:object::new(ctx) };
        let vault = Vault { id:object::new(ctx), balance:balance::zero<LIZHECOME_FAUCET_COIN>() };

        // 将游戏金库共享权限，所有人可见，可以操作
        share_object(vault);
        //将管理员权限传给调用方
        transfer::transfer(admincap, ctx.sender());
    }

    // 存款函数，游戏运营前，先由管理员提前存入一些金额
    public entry fun deposit(_:&AdminCap,vault:&mut Vault,faucet:Coin<LIZHECOME_FAUCET_COIN>,_:&mut TxContext){
        let deposit_amount = coin::into_balance(faucet);
        balance::join(& mut vault.balance, deposit_amount);
    }

    // 提款函数，管理员可以随时从游戏金库提款
    public entry fun withdraw(_:&AdminCap,vault:&mut Vault,amount:u64,ctx:&mut TxContext){
        assert!(amount<=balance::value(&vault.balance),EOverBalance);
        let withdraw_amount = balance::split(&mut vault.balance, amount);
        transfer::public_transfer(coin::from_balance(withdraw_amount, ctx),ctx.sender());
    }

    // 玩游戏函数
    entry fun gameplay(r:&Random,vault:&mut Vault,inputcoin:Coin<LIZHECOME_FAUCET_COIN>,guess:bool,ctx:&mut TxContext){
        assert!(balance::value(&vault.balance)>=1000000,EVaultIsEmpty);

        let balance_dewrap = coin::into_balance(inputcoin);
        assert!(balance::value(&balance_dewrap)==1000000,EOnlyOneFAUCET);
        balance::join(&mut vault.balance, balance_dewrap);

        let mut generator = random::new_generator(r, ctx);
        let random_result = random::generate_bool(&mut generator);
        if (guess==random_result){
            let win_back = balance::split(&mut vault.balance, 2000000);
            transfer::public_transfer(coin::from_balance(win_back, ctx), ctx.sender());
        }

    }
}