module faucet_coin::TRUMP_COIN {
  use sui::coin::{Self, TreasuryCap};
  use sui::url;
  use sui::balance::{Self, Balance}; // 余额操作

  public struct TRUMP_COIN has drop {}
  // 公共钱包
  public struct Public_Wallet has key {
    id: UID,
    coin: Balance<TRUMP_COIN>, // 余额
    faucet_amount: u64 // 水龙头总量
  }

  fun init(witness: TRUMP_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      8,
      b"TRUMP_COIN",
      b"TRUMP_COIN",
      b"TRUMP_COIN",
      option::some(url::new_unsafe_from_bytes(b"https://aggregator.walrus-testnet.walrus.space/v1/UNM9lClNgS1UYX5SRZzEx_DFJheAPKre6dZM_A7LV1I")),
      ctx
    ); 
    transfer::public_freeze_object(metadata);
    // 所有权给发布合约的人
    transfer::public_transfer(treasury, tx_context::sender(ctx));
    // 初始化公共钱包
    let publicWallet = Public_Wallet {
      id: object::new(ctx),
      coin: balance::zero(),
      faucet_amount: 100000000 // 水龙头一次获取的数量
    };
    // 将给定对象转换为可变的共享对象，每个人都可以访问和变更该对象。
    transfer::share_object(publicWallet);
  }

  // 修改水龙头一次获取数量
  public entry fun set_faucet_amount(
    wallet: &mut Public_Wallet,
    amount: u64,
    _ctx: &mut TxContext
  ) {
    wallet.faucet_amount = amount;
  }

  // 创建水龙头
  public entry fun create_faucet(
    treasury_cap: &mut TreasuryCap<TRUMP_COIN>,
    amount: u64,
    wallet: &mut Public_Wallet,
    ctx: &mut TxContext
  ) {
    // 铸造币
    let coins = coin::mint(treasury_cap, amount, ctx);
    // 存到公共钱包的余额中
    balance::join(&mut wallet.coin, coin::into_balance(coins));
  }

  public entry fun get_faucet(
    wallet: &mut Public_Wallet,
    ctx: &mut TxContext
  ) {
    // 获取钱包余额
    let balance_amount = balance::value(&wallet.coin);
    // 判断余额是否大于水龙头的数量，大于则通过，反之不通过
    assert!(balance_amount >= wallet.faucet_amount, 1);
    // 从余额中取出水龙头数量的余额
    let split_balance = balance::split(&mut wallet.coin, wallet.faucet_amount);
    // 生成水龙头的币
    let faucet_coin = coin::from_balance(split_balance, ctx);
    // 发给钱包
    transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
  }
  
}

