/// Module: swaper
module swaper::swaper {
  use sui::coin::{Self, Coin};
  use sui::balance::{Self, Balance};

  public struct AdminCap has key {
    id: UID
  }

  public struct SwapBank<phantom CoinA, phantom CoinB> has key {
    id: UID,
    coinA_balance: Balance<CoinA>,
    coinB_balance: Balance<CoinB>,
  }

  fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap {id: object::new(ctx)};
    transfer::transfer(adminCap, tx_context::sender(ctx));
  }

  public entry fun create_pool<CoinA, CoinB>(ctx: &mut TxContext) {
    let bank = SwapBank<CoinA, CoinB> {
      id: object::new(ctx),
      coinA_balance: balance::zero(),
      coinB_balance: balance::zero()
    };

    transfer::share_object(bank);
  }

  public entry fun deposite_coinA<CoinA, CoinB>(bank: &mut SwapBank<CoinA, CoinB>, coin: Coin<CoinA>, _: &mut TxContext) {
    let coin_balance = coin::into_balance(coin);
    balance::join(&mut bank.coinA_balance, coin_balance);
  }
  
  public entry fun deposite_coinB<CoinA, CoinB>(bank: &mut SwapBank<CoinA, CoinB>, coin: Coin<CoinB>, _: &mut TxContext) {
    let coin_balance = coin::into_balance(coin);
    balance::join(&mut bank.coinB_balance, coin_balance);
  }

  public entry fun withdraw_CoinA<CoinA, CoinB>(_: &AdminCap, bank: &mut SwapBank<CoinA, CoinB>, amount: u64, ctx: &mut TxContext) {
    let coin_balance = balance::split(&mut bank.coinA_balance, amount);
    transfer::public_transfer(coin::from_balance(coin_balance, ctx), tx_context::sender(ctx));
  }

  public entry fun withdraw_CoinB<CoinA, CoinB>(_: &AdminCap, bank: &mut SwapBank<CoinA, CoinB>, amount: u64, ctx: &mut TxContext) {
    let coin_balance = balance::split(&mut bank.coinB_balance, amount);
    transfer::public_transfer(coin::from_balance(coin_balance, ctx), tx_context::sender(ctx));
  }

  // 1 meepo_coin for 5.5 meepo_faucet
  public entry fun swap_coinA_for_coinB<CoinA, CoinB>(bank: &mut SwapBank<CoinA, CoinB>, coinA: Coin<CoinA>, ctx: &mut TxContext) {
    let swap_amount = coin::value(&coinA) * (1000000 * 10 / 55 * 10000000);
    let swap_balance = balance::split(&mut bank.coinB_balance, swap_amount);
    balance::join(&mut bank.coinA_balance, coin::into_balance(coinA));
    transfer::public_transfer(coin::from_balance(swap_balance, ctx), tx_context::sender(ctx));
  }

  public entry fun swap_coinB_for_coinA<CoinA, CoinB>(bank: &mut SwapBank<CoinA, CoinB>, coinB: Coin<CoinB>, ctx: &mut TxContext) {
    let swap_amount = coin::value(&coinB) * 55 * 100000 / 1000000;
    let swap_balance = balance::split(&mut bank.coinA_balance, swap_amount);
    balance::join(&mut bank.coinB_balance, coin::into_balance(coinB));
    transfer::public_transfer(coin::from_balance(swap_balance, ctx), tx_context::sender(ctx));
  }

}
