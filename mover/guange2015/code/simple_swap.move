module mycoin::simple_swap {

  use sui::balance::{Balance, Self};
  use sui::coin::{Coin, Self};

  const AUTH_ERR: u64 =  1;

  //流动池
  public struct Pool<phantom X, phantom Y> has key,store {
    id: UID,
    balance0: Balance<X>,
    balance1: Balance<Y>,
    owner: address
  }

  //创建流动池
  public entry fun createPool<X,Y>(ctx: &mut TxContext) {
    let pool = Pool<X,Y>{
      id: object::new(ctx),
      balance0: balance::zero(),
      balance1: balance::zero(),
      owner: ctx.sender(),
    };
    transfer::share_object(pool);
  }

  //添加流动性
  //这里不限制两边是否对等，管理员想怎么加怎么加
  public entry fun addLiq<X,Y>(pool: &mut Pool<X,Y>, _token0:Coin<X>, _token1:Coin<Y>, ctx: &mut TxContext) {
    assert!(pool.owner == ctx.sender(), AUTH_ERR);

    coin::put(& mut pool.balance0, _token0);
    coin::put(& mut pool.balance1, _token1);
  }

  //移除流动性
  public entry fun delLiq<X,Y>(pool: &mut Pool<X,Y>,amount0: u64, amount1: u64, ctx: &mut TxContext) {
    assert!(pool.owner == ctx.sender(), AUTH_ERR);

    //这里无需检查，因为balance实现已经检查了
    let coin0 = coin::from_balance(pool.balance0.split(amount0),ctx);
    transfer::public_transfer(coin0, pool.owner);

    let coin1 = coin::from_balance(pool.balance1.split(amount1),ctx);
    transfer::public_transfer(coin1,  pool.owner);
  }

  //兑换
  public entry fun x_to_y<X,Y>(pool: &mut Pool<X,Y>, token: Coin<X>, ctx: &mut TxContext) {
    //等量的X进去，等量的Y出来
    //这里无需检查余额够不够
    let amount:u64 = token.value();
    coin::put(& mut pool.balance0, token);

    transfer::public_transfer<Coin<Y>>(
      coin::from_balance(pool.balance1.split(amount),ctx),
      ctx.sender()
    );
  }

public entry fun y_to_x<X,Y>(pool: &mut Pool<X,Y>, token: Coin<Y>, ctx: &mut TxContext) {
    //等量的X进去，等量的Y出来
    //这里无需检查余额够不够
    let amount:u64 = token.value();
    coin::put(& mut pool.balance1, token);

    transfer::public_transfer<Coin<X>>(
      coin::from_balance(pool.balance0.split(amount),ctx),
      ctx.sender()
    );
  }

  

  #[test_only]
  public struct TokenA has drop{}
  #[test_only]
  public struct TokenB has drop{}

  #[test]
  fun test_swap() {
    use sui::test_scenario;
    use std::debug;
    
    let owner = @0x1000;
    let alice = @0x1001;

    let mut scenario = test_scenario::begin(owner);
    {
      //先创建两个token tokenA tokenB
      let mut tokenA = coin::mint_for_testing<TokenA>(10000, scenario.ctx());
      let mut tokenB = coin::mint_for_testing<TokenB>(10000, scenario.ctx());

      tokenA.split_and_transfer(100, alice, scenario.ctx());
      tokenB.split_and_transfer(1000, alice, scenario.ctx());

      transfer::public_transfer(tokenA, owner);
      transfer::public_transfer(tokenB, owner);
    };

    scenario.next_tx(owner);
    {
      //创建pool
      createPool<TokenA, TokenB>(scenario.ctx());      
    };
    scenario.next_tx(owner);
    {
      //添加流动性
      let mut pool = scenario.take_shared<Pool<TokenA,TokenB>>();

      assert!(pool.balance0.value()==0, 2);
      assert!(pool.balance1.value()==0, 2);


      let tokenA = scenario.take_from_sender<Coin<TokenA>>();
      let tokenB = scenario.take_from_sender<Coin<TokenB>>();

      
      addLiq<TokenA,TokenB>(& mut pool, tokenA, tokenB, scenario.ctx() );

      assert!(pool.balance0.value()>0, 3);
      assert!(pool.balance1.value()>0, 3);

      test_scenario::return_shared(pool);

      
    };

    scenario.next_tx(alice);
    {
      //兑换
      let mut pool = scenario.take_shared<Pool<TokenA,TokenB>>();
      let tokenA = scenario.take_from_sender<Coin<TokenA>>();
      x_to_y(& mut pool, tokenA, scenario.ctx());
      test_scenario::return_shared(pool);
    };

    scenario.next_tx(alice);
    {
      //检查兑换出来的tokenB
      let tokenB = scenario.take_from_sender<Coin<TokenB>>();
      debug::print(tokenB.balance());
      assert!(tokenB.value() == 100, 1);
      scenario.return_to_sender(tokenB);
    };
    

    scenario.end();
  }


}

