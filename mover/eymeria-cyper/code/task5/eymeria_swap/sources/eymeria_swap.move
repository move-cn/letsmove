module eymeria_swap::eymeria_swap {
  use my_coin::eymeria_faucet::{EYMERIA_FAUCET};
  use my_coin::eymeria_coin::{EYMERIA_COIN};
  use sui::balance;
  use sui::balance::{Balance, Supply};
  use sui::coin;
  use sui::coin::{balance, Coin};
  use sui::object;
  use sui::object::ID;
  use sui::table;
  use sui::table::Table;
  use sui::transfer;

  const ENotContainLP: u64 = 0;
  const ENotEnoughBalance: u64 =0;

  // 权益代币 只是一个凭证，内部并不需要存储什么额外的东西
  public struct LP<phantom EYMERIA_FAUCET, phantom EYMERIA_COIN> has drop{}
  
  //phantom关键字可以要求move类型系统放松对内部类型的能力约束(能力指key,store这些)，适合用于需要在泛型中指定类型，但是又不实际存储数据的地方。比如LP虽然与流动性池关联，但是并不需要存储这些具体的代币数据。
  // 池子当中最为关键的是两种货币各自的量
  public struct Pool<phantom EYMERIA_FAUCET, phantom EYMERIA_COIN> has key {
    id: UID,
    balance_a: Balance<EYMERIA_FAUCET>,
    balance_b: Balance<EYMERIA_COIN>,
    lp_supply: Supply<LP<EYMERIA_FAUCET, EYMERIA_COIN>>
  }

  // 为了保证用户提供的凭证LP的有效性和真实性，再用一个结构来存储合约给出的凭证相关信息，以ID作为 Key，
  // vector<u64>作为 Value，来组建一个Table数据结构，其中vector里的第一个值是第一种货币的提供量，第二个值是第二种货币的提供量
  public struct Pocket has key {
    id: UID,
    id_to_vec: Table<ID, vector<u64>>
  }

  // 创建流动性资金池
  // 关键在于创建空的 balance 和 supply, 最后将其可变分享给所有人
  // create_supply 必须传入一个参数
  entry fun create_pool<EYMERIA_FAUCET, EYMERIA_COIN>(ctx: &mut TxContext) {
    let pool = Pool<EYMERIA_FAUCET,EYMERIA_COIN> {
      id: object::new(ctx),
      balance_a: balance::zero(),
      balance_b: balance::zero(),
      lp_supply: balance::create_supply<LP<EYMERIA_FAUCET,EYMERIA_COIN>>(LP<EYMERIA_FAUCET,EYMERIA_COIN> {})
    };

    let pocket = Pocket {
      id: object::new(ctx),
      id_to_vec: table::new<ID, vector<u64>>(ctx),
    };

    transfer::share_object(pool);
    transfer::share_object(pocket);
  }


  // 添加流动性
  // 传入两种货币，投入流动池，将凭证LP所有权传回给该流动性提供者，同时在Pocket当中存储相关的信息
  public entry fun add_liquidity<EYMERIA_FAUCET, EYMERIA_COIN>(
    pool: &mut Pool<EYMERIA_FAUCET,EYMERIA_COIN>,
    coin_a: Coin<EYMERIA_FAUCET>,
    coin_b: Coin<EYMERIA_COIN>,
    pocket: &mut Pocket,
    ctx: &mut TxContext,
  ) {

    // &mut 使得变量指向了可变引用，而无需重新分配内存，释放内存
    let coin_a_amount = coin_a.value();
    let coin_b_amount = coin_b.value();

    pool.balance_a.join(coin_a.into_balance());
    pool.balance_b.join(coin_b.into_balance());

    // increase_supply 在更新 supply 的同时返回更新后的 Balance
    let lp_balance = pool.lp_supply.increase_supply(coin_a_amount + coin_b_amount);
    // 相当于创建了一个新的币种
    let lp_coin = coin::from_balance(lp_balance, ctx);
    let lp_id = object::id(&lp_coin);

    let mut vec = vector::empty<u64>();
    vec.push_back(coin_a_amount);
    vec.push_back(coin_b_amount);

    // 钱包将这个币种和它相关的两个币的数量记录
    pocket.id_to_vec.add(lp_id, vec);
    transfer::public_transfer(lp_coin, ctx.sender());
  }


  // 移除流动性
  // 通过自身持有的凭证LP，从池中取出对应数量的两种货币，当然，这张凭证需要通过Pocket认证
  public entry fun remove_liquidity<EYMERIA_FAUCET,EYMERIA_COIN>(
    pool: &mut Pool<EYMERIA_FAUCET,EYMERIA_COIN>,
    lp: Coin<LP<EYMERIA_FAUCET,EYMERIA_COIN>>,
    pocket: &mut Pocket,
    ctx: &mut TxContext,
  ) {

    let lp_id = object::id(&lp);
    assert!(pocket.id_to_vec.contains(lp_id), ENotContainLP);

    let vec = table::remove(&mut pocket.id_to_vec, lp_id) ;
    let coin_a_amount = vec[0];
    let coin_b_amount = vec[1];
    assert!(coin_a_amount <= pool.balance_a.value() && coin_b_amount <= pool.balance_b.value(), ENotEnoughBalance);

    pool.lp_supply.decrease_supply(lp.into_balance());

    transfer::public_transfer(coin::take(&mut pool.balance_a, coin_a_amount, ctx), ctx.sender());
    transfer::public_transfer(coin::take(&mut pool.balance_b, coin_b_amount, ctx), ctx.sender());
  }

  // 1:1 置换，且无需置换费用
  // 相当于将拿出的这部分 a 放进了池子，而取出 b 放回自己账户
  public entry fun a_swap_b<EYMERIA_FAUCET,EYMERIA_COIN>(
    pool: &mut Pool<EYMERIA_FAUCET, EYMERIA_COIN>,
    coin_a: Coin<EYMERIA_FAUCET>,
    ctx: &mut TxContext
  ) {
    let amount = coin_a.value();
    assert!(amount <= pool.balance_b.value(), ENotEnoughBalance);

    pool.balance_a.join(coin_a.into_balance());
    transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), ctx.sender());
  }

  public entry fun b_swap_a<EYMERIA_FAUCET,EYMERIA_COIN>(
    pool: &mut Pool<EYMERIA_FAUCET, EYMERIA_COIN>,
    coin_b: Coin<EYMERIA_COIN>,
    ctx: &mut TxContext
  ) {
    let amount = coin_b.value();
    assert!(amount <= pool.balance_a.value(), ENotEnoughBalance);

    pool.balance_b.join(coin_b.into_balance());
    transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), ctx.sender());

  }
}

