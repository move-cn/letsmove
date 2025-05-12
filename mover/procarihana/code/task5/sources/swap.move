/// Module: swap
module procarihana::swap;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::object;
use sui::object::UID;
use sui::transfer::{transfer, share_object, public_transfer};
use sui::tx_context::TxContext;
use my_coin::faucet_procarihana::{FAUCET_PROCARIHANA};
use my_coin::procarihana::{PROCARIHANA};

const CoinNotEnough: u64 = 100;
const FaucetCoinNotEnough: u64 = 101;
const WalletNotEnough: u64 = 102;

public struct AdminCap has key {
    id: UID
}

// task2 创建的两种 coin
public struct Swap has key {
    id: UID,
    coin: Balance<PROCARIHANA>,
    faucet_coin: Balance<FAUCET_PROCARIHANA>
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap { id: object::new(ctx) };
    // 交换池
    let swap = Swap {
        id: object::new(ctx),
        coin: balance::zero<PROCARIHANA>(),
        faucet_coin: balance::zero<FAUCET_PROCARIHANA>()
    };
    transfer(adminCap, ctx.sender());
    share_object(swap);
}


public entry fun coin_to_faucet(
    swap: &mut Swap,
    // 交换币
    in_coin: &mut Coin<PROCARIHANA>,
    // 交换值
    in_amount: u64,
    ctx: &mut TxContext
) {
    // 钱包要够钱
    assert!(in_coin.value() >= in_amount, WalletNotEnough);
    let coin_old_value = swap.coin.value();
    let fauct_coin_old_value = swap.faucet_coin.value();
    let const_value = coin_old_value * fauct_coin_old_value;
    let coin_new_value = coin_old_value + in_amount;
    let fauct_coin_new_value = const_value / coin_new_value;
    let out_amount = fauct_coin_old_value - fauct_coin_new_value;
    // 交换池必须有所需的量
    assert!(swap.faucet_coin.value() >= out_amount, FaucetCoinNotEnough);
    // 交换池添加 coin
    swap.coin.join(coin::into_balance(in_coin.split(in_amount, ctx)));
    // 交换池交出 faucet_coin
    let takeCoin = coin::from_balance(swap.faucet_coin.split(out_amount), ctx);
    // 交换给用户
    public_transfer(takeCoin, ctx.sender());
}

public entry fun faucet_to_coin(
    swap: &mut Swap,
    in_coin: &mut Coin<FAUCET_PROCARIHANA>,
    in_amount: u64,
    ctx: &mut TxContext
) {
    // 钱包要够钱
    assert!(in_coin.value() >= in_amount, WalletNotEnough);
    let coin_old_value = swap.coin.value();
    let fauct_coin_old_value = swap.faucet_coin.value();
    let const_value = coin_old_value * fauct_coin_old_value;
    let fauct_coin_new_value = fauct_coin_old_value + in_amount;
    let coin_new_value = const_value / fauct_coin_new_value;
    let out_amount = coin_old_value - coin_new_value;
    assert!(swap.coin.value() >= out_amount, CoinNotEnough);
    // 交换池添加 faucet_coin
    swap.faucet_coin.join(coin::into_balance(in_coin.split(in_amount, ctx)));
    // 交换池拿出 coin
    let out_coin = coin::from_balance(swap.coin.split(out_amount), ctx);
    // 交换给用户
    public_transfer(out_coin, ctx.sender());
}

public entry fun save_coin(
    _: &AdminCap,
    swap: &mut Swap,
    coin: &mut Coin<PROCARIHANA>,
    coin_amt: u64,
    faucet_coin: &mut Coin<FAUCET_PROCARIHANA>,
    faucet_coin_amount: u64,
    ctx: &mut TxContext
) {
    if (coin_amt > 0) {
        swap.coin.join(coin::into_balance(coin.split(coin_amt, ctx)));
    };
    if (faucet_coin_amount > 0) {
        swap.faucet_coin.join(coin::into_balance(faucet_coin.split(faucet_coin_amount, ctx)));
    };
}


public entry fun get_coin(
    _: &AdminCap,
    swap: &mut Swap,
    coin_amount: u64,
    faucet_coin_amount: u64,
    ctx: &mut TxContext
) {
    if (coin_amount > 0 && swap.coin.value() > 0) {
        let take_coin = coin::from_balance(swap.coin.split(coin_amount), ctx);
        public_transfer(take_coin, ctx.sender());
    };
    if (faucet_coin_amount > 0 && swap.faucet_coin.value() > 0) {
        let take_faucet_coin = coin::from_balance(swap.faucet_coin.split(faucet_coin_amount), ctx);
        public_transfer(take_faucet_coin, ctx.sender());
    };
}

