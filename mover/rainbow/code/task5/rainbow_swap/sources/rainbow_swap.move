module rainbow_swap::rainbow_swap {
  use faucet_coin::faucet_coin::{FAUCET_COIN};
  use my_coin::my_coin::{MY_COIN};
  use sui::coin::{Self,Coin};
  use sui::balance::{Self,Balance};

  public struct Bank has key{
    id:UID,
    NB:Balance<FAUCET_COIN>,
    BULL_COIN:Balance<MY_COIN>,
     // NB = 2BULL_COIN
    rate: u64,
    service_charge:u64,
  }

  public struct AdminCap has key{
    id:UID
  }

  fun init(ctx:&mut TxContext){
    let bank = Bank {
      id:object::new(ctx),
      NB:balance::zero<FAUCET_COIN>(),
      BULL_COIN:balance::zero<MY_COIN>(),
      rate:2,
      service_charge:10
    };
    let adminCap = AdminCap{id:object::new(ctx)};
    transfer::share_object(bank);
    transfer::transfer(adminCap, ctx.sender());
  }

  // 设置汇率
  public fun set_rate(_: &AdminCap,bank:&mut Bank,rate:u64){
    bank.rate = rate;
  }

  // 设置手续费率
  public fun set_service_charge(_: &AdminCap,bank:&mut Bank,rate:u64){
    bank.service_charge = rate;
  }

  // 给NB充值
  public fun deposit_NB(bank:&mut Bank,coin:Coin<FAUCET_COIN>){
    let in_balance = coin::into_balance(coin);
    balance::join(&mut bank.NB, in_balance);
  }
  
  // 给BULL_COIN充值
  public fun deposit_BULL_COIN(bank:&mut Bank,coin:Coin<MY_COIN>){
    let in_balance = coin::into_balance(coin);
    balance::join(&mut bank.BULL_COIN, in_balance);
  }

  // NB 换 BULL_COIN
  public entry fun swap_NB_to_BULL_COIN(bank:&mut Bank,coin:&mut Coin<FAUCET_COIN>,amount:u64,ctx:&mut TxContext){
    // Target coin
    //扣除手续费
    let swap_amount = amount - amount/100*bank.service_charge;
    let target_amount = swap_amount*bank.rate;


    let bank_stock  = bank.NB.value();

    let client_balance = coin::balance_mut(coin);
    let client_balance_value = client_balance.value();

    //检测一下资金池库存够不够
    assert!(bank_stock>target_amount,0);

    // 检查用户有没有足够的币支付
    assert!(client_balance_value>amount,1); 

    let bull_coin_balance = balance::split(client_balance, amount);
    balance::join(&mut bank.NB, bull_coin_balance);
    
    
    let nb_balance =  balance::split(&mut bank.BULL_COIN,  target_amount);
    let nb = coin::from_balance(nb_balance, ctx);
    transfer::public_transfer(nb, ctx.sender());
  }

  // BULL_COIN 换 NB
  public entry fun swap_BULL_COIN_to_NB(bank:&mut Bank,coin:&mut Coin<MY_COIN>,amount:u64,ctx:&mut TxContext){

    // Target coin
    //扣除手续费
    let swap_amount = amount - amount/100*bank.service_charge;
    let target_amount = swap_amount/bank.rate;


    let bank_stock  = bank.NB.value();

    let client_balance = coin::balance_mut(coin);
    let client_balance_value = client_balance.value();

    //检测一下资金池库存够不够
    assert!(bank_stock>target_amount,0);

    // 检查用户有没有足够的币支付
    assert!(client_balance_value>amount,1); 

    let bull_coin_balance = balance::split(client_balance, amount);
    balance::join(&mut bank.BULL_COIN, bull_coin_balance);
    
    
    let nb_balance =  balance::split(&mut bank.NB,  target_amount);
    let nb = coin::from_balance(nb_balance, ctx);
    transfer::public_transfer(nb, ctx.sender());
  }
}

