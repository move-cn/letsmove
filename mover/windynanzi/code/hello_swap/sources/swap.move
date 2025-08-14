module windynanzi::swap {

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
  public struct LP<phantom COINA, phantom COINB> has drop{}

  // 池子当中最为关键的是两种货币各自的量
  public struct Pool<phantom COINA, phantom COINB> has key {
    id: UID,
    balance_a: Balance<COINA>,
    balance_b: Balance<COINB>,
    lp_supply: Supply<LP<COINA, COINB>>
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
  entry fun create_pool<COINA, COINB>(ctx: &mut TxContext) {
    let pool = Pool<COINA,COINB> {
      id: object::new(ctx),
      balance_a: balance::zero(),
      balance_b: balance::zero(),
      lp_supply: balance::create_supply<LP<COINA,COINB>>(LP<COINA,COINB> {})
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
  public entry fun add_liquidity<COINA, COINB>(
    pool: &mut Pool<COINA,COINB>,
    coin_a: Coin<COINA>,
    coin_b: Coin<COINB>,
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
  public entry fun remove_liquidity<COINA,COINB>(
    pool: &mut Pool<COINA,COINB>,
    lp: Coin<LP<COINA,COINB>>,
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
  public entry fun a_swap_b<COINA,COINB>(
    pool: &mut Pool<COINA, COINB>,
    coin_a: Coin<COINA>,
    ctx: &mut TxContext
  ) {
    let amount = coin_a.value();
    assert!(amount <= pool.balance_b.value(), ENotEnoughBalance);

    pool.balance_a.join(coin_a.into_balance());
    transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), ctx.sender());
  }

  public entry fun b_swap_a<COINA,COINB>(
    pool: &mut Pool<COINA, COINB>,
    coin_b: Coin<COINB>,
    ctx: &mut TxContext
  ) {
    let amount = coin_b.value();
    assert!(amount <= pool.balance_b.value(), ENotEnoughBalance);

    pool.balance_b.join(coin_b.into_balance());
    transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), ctx.sender());

  }

}

// publish hash 9PihP3hJP1mm8LB2YRKsZVYoQiFhrBLBYtzTJwYhyHW3
// package id 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0
// coin_a_cap 0xf301b2692d449dfa7a7e8caba279ca2d37efb8213b6d9b6fe95e3af1d639349d
// coin_b_cap 0xfd034480993e55bea9ed82a1842f0e5cb988f3054c07676bd2794143a7d54d2b
// address 0xddb33d56ab9aebc1cef10fbfb8ad6e29e2d3a2a33fc69ab658579b0699b28434


// 铸币
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module coin_a --function mint --args 0xf301b2692d449dfa7a7e8caba279ca2d37efb8213b6d9b6fe95e3af1d639349d 50 0xddb33d56ab9aebc1cef10fbfb8ad6e29e2d3a2a33fc69ab658579b0699b28434
// DqYhrhB4DBTyUEcUfUUTtENjSHFUatwrcKzx9DbC3jhk a 50
// 2MyGbC78cb6V1MuUS3MZL4kNbjhG2AJ9h5QbaP7zi1dG a 50
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module coin_b --function mint --args 0xfd034480993e55bea9ed82a1842f0e5cb988f3054c07676bd2794143a7d54d2b 100 0xddb33d56ab9aebc1cef10fbfb8ad6e29e2d3a2a33fc69ab658579b0699b28434
// BTN7yptt5w2GjfBnR8DAymuUXFiMYjf2LCfXs3QLBo6a b 100


// set a1_id = 0x9a99d549a97ecaec182ab5ce3f188fdcb0edaaad9bfc3841fdee178084dfa1eb
// set a2_id = 0xd925b1d9f4f32302adc687ff0ac0cc7ca402fa0a3ab1e22baa54c0a317f2409a
// set b_id = 0x186436efbfa758a0c4b0dbc74c42a4b2f84620bbd797ae08e99430bf0cf4710f

// set a_type = 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_a::COIN_A
// set b_type = 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_b::COIN_B

// 创建流动性资金池
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module swap --function create_pool --type-args 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_a::COIN_A 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_b::COIN_B
// hash 2WZHK4okdaoRRGmJHGB5QwjwzDzswjoBhScyNTJ4Af6R
// pool id 0x25f08c455c9529e1d042666ad3d418d43d34324597c63575fed6f0d672e80e9a
// pocket id 0xb91b8c8339eed5ec7474c719aa9316d3e5a30fcc979ffe2ab9967458a25cfefe

// 添加流动性
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module swap --function add_liquidity --args 0x25f08c455c9529e1d042666ad3d418d43d34324597c63575fed6f0d672e80e9a 0x9a99d549a97ecaec182ab5ce3f188fdcb0edaaad9bfc3841fdee178084dfa1eb 0x186436efbfa758a0c4b0dbc74c42a4b2f84620bbd797ae08e99430bf0cf4710f 0xb91b8c8339eed5ec7474c719aa9316d3e5a30fcc979ffe2ab9967458a25cfefe --type-args 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_a::COIN_A 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_b::COIN_B
// hash 5JnjdGgTTi6Q8fXUCx9quXp6yFvtt9cpRKDv3Uxgm9vF
// lp id 0x01cbd2018dff0758aee78da926b94b256ecc93b0cc116a0aa24ce878487afff1


// a 交换 b
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module swap --function a_swap_b --args 0x25f08c455c9529e1d042666ad3d418d43d34324597c63575fed6f0d672e80e9a 0xd925b1d9f4f32302adc687ff0ac0cc7ca402fa0a3ab1e22baa54c0a317f2409a --type-args 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_a::COIN_A 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_b::COIN_B
// hash 4zETge4hTR1RBJ3LkVYEdQFfq8CUcxPVfx2AnK1pGmpg
// b_new_id 0xf703f0eaaad4894bd355dea55f319694b432833ecbc37d95d577a72f4784724a

// b 交换 a
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module swap --function b_swap_a --args 0x25f08c455c9529e1d042666ad3d418d43d34324597c63575fed6f0d672e80e9a 0xf703f0eaaad4894bd355dea55f319694b432833ecbc37d95d577a72f4784724a --type-args 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_a::COIN_A 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_b::COIN_B
// hash 5kPkALLCWTUS5KEFq7PUpxZdYRVubyY4jjb3ET5bHRhQ

// 移除流动性
// sui client call --package 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0 --module swap --function remove_liquidity --args 0x25f08c455c9529e1d042666ad3d418d43d34324597c63575fed6f0d672e80e9a 0x2c97223d5880f9f68075bf7a8e71f91130d108f16bf85d7a836adca6a3a6ca12 0x9ad4d46c15a6137d034f4f9112f7e569772cec64ada67f37da1c3eede49f7638 --type-args 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_a::COIN_A 0xda2b6726d5ec14013e98c486976ffb64b087ad6260fb5b7c1f41df508e1dd2d0::coin_b::COIN_B
// hash 49AL7kG8gvAfhq8ABp8abHTNVtwrfvdHnasNZjsF3eLM