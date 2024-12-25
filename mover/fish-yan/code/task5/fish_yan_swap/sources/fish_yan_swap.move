/*
/// Module: fish_yan_swap
module fish_yan_swap::fish_yan_swap;
*/
module fish_yan_swap::fish_yan_swap {

  use fish_yan_coin::fish_yan_coin::FISH_YAN_COIN;
  use fish_yan_faucet::fish_yan_faucet::FISH_YAN_FAUCET;
  use sui::balance;
  use sui::balance::{Balance};
  use sui::coin;
  use sui::coin::Coin;
  
  const E_INSUFFICIENT_BALANCE: u64 =0;
  const E_ZERO_AMOUNT: u64 = 1;

  public struct Pool has key {
    id: UID,
    balance_a: Balance<FISH_YAN_FAUCET>,
    balance_b: Balance<FISH_YAN_COIN>,
  }

 fun init(ctx: &mut TxContext) {
    let pool = Pool {
      id: object::new(ctx),
      balance_a: balance::zero(),
      balance_b: balance::zero(),
    };

    transfer::share_object(pool);
  }


  // 添加流动性
  public entry fun add_liquidity(
    pool: &mut Pool,
    coin_a: Coin<FISH_YAN_FAUCET>,
    coin_b: Coin<FISH_YAN_COIN>,
    ctx: &mut TxContext,
  ) {

    let coin_a_amount = coin_a.value();
    let coin_b_amount = coin_b.value();

    assert!(coin_a_amount > 0 && coin_b_amount > 0, E_ZERO_AMOUNT);
    
    pool.balance_a.join(coin_a.into_balance());
    pool.balance_b.join(coin_b.into_balance());

  }

  public entry fun a_swap_b(
    pool: &mut Pool,
    coin_a: Coin<FISH_YAN_FAUCET>,
    ctx: &mut TxContext
  ) {
    let amount = coin_a.value();
    assert!(amount <= pool.balance_b.value(), E_INSUFFICIENT_BALANCE);

    pool.balance_a.join(coin_a.into_balance());
    transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), ctx.sender());
  }

  public entry fun b_swap_a(
    pool: &mut Pool,
    coin_b: Coin<FISH_YAN_COIN>,
    ctx: &mut TxContext
  ) {
    let amount = coin_b.value();
    assert!(amount <= pool.balance_a.value(), E_INSUFFICIENT_BALANCE);

    pool.balance_b.join(coin_b.into_balance());
    transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), ctx.sender());

  }
}

