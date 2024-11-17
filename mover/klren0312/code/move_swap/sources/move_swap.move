module move_swap::klren0312_swap {
  use faucet_coin::TRUMP_COIN::TRUMP_COIN;
  use move_coin::ZCDCCOIN::ZCDCCOIN;
  use sui::balance::{Balance, value, split, join};
  use sui::coin::{Coin, into_balance, from_balance};
  use sui::tx_context::sender;

  // 报错code
  const ErrorSwapPoolBalanceInsufficient: u64 = 0; // 池子余额不足

  // swap池子结构体
  public struct SwapPool has key {
    id: UID,
    trump_coin: Balance<TRUMP_COIN>,
    zcdc_coin: Balance<ZCDCCOIN>,
  }

  // 创建swap池子
  entry fun create_swap_pool(trump_coin: Coin<TRUMP_COIN>, zcdc_coin: Coin<ZCDCCOIN>, ctx: &mut TxContext) {
    // 创建的时候就存好钱
    let swap_pool = SwapPool {
      id: object::new(ctx),
      trump_coin: into_balance(trump_coin),
      zcdc_coin: into_balance(zcdc_coin),
    };
    transfer::share_object(swap_pool);
  }

  // trump to zcdc
  entry fun swap_trump_to_zcdc(swap_pool: &mut SwapPool, trump_coin: Coin<TRUMP_COIN>, ctx: &mut TxContext) {
    let trump_coin_balance = into_balance(trump_coin);
    // 获取trump的数量
    let trump_coin_value = value(&trump_coin_balance);
    // 换算出能兑换的zcdc数量
    let zcdc_coin_swap_value = trump_coin_value * 4;
    // 获取池子的zcdc余额
    let swap_zcdc_balance = value(&swap_pool.zcdc_coin);
    // 池子余额不足报错
    assert!(swap_zcdc_balance >= zcdc_coin_swap_value, ErrorSwapPoolBalanceInsufficient);
    // 从池子里取出要需要swap的zcdc
    let zcdc_coin_balance = split(&mut swap_pool.zcdc_coin, zcdc_coin_swap_value);
    // zcdc余额转换成coin
    let zcdc_coin = from_balance(zcdc_coin_balance, ctx);
    // 把trump放入池子中
    join(&mut swap_pool.trump_coin, trump_coin_balance);
    // 把zcdc发给账号
    transfer::public_transfer(zcdc_coin, sender(ctx));
  }

  // zcdc to trump
  entry fun swap_zcdc_to_trump(swap_pool: &mut SwapPool, zcdc_coin: Coin<ZCDCCOIN>, ctx: &mut TxContext) {
    let zcdc_coin_balance = into_balance(zcdc_coin);
    // 获取zcdc的数量
    let zcdc_coin_value = value(&zcdc_coin_balance);
    // 换算出能兑换的trump数量
    let trump_coin_swap_value = zcdc_coin_value / 4;
    // 获取池子的trump余额
    let swap_trump_balance = value(&swap_pool.trump_coin);
    // 池子余额不足报错
    assert!(swap_trump_balance >= trump_coin_swap_value, ErrorSwapPoolBalanceInsufficient);
    // 从池子里取出要需要swap的trump
    let trump_coin_balance = split(&mut swap_pool.trump_coin, trump_coin_swap_value);
    // trump余额转换成coin
    let trump_coin = from_balance(trump_coin_balance, ctx);
    // 把zcdc放入池子中
    join(&mut swap_pool.zcdc_coin, zcdc_coin_balance);
    // 把zcdc发给账号
    transfer::public_transfer(trump_coin, sender(ctx));
  }
}

