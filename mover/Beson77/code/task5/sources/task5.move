/*
/// Module: task5
module task5::task5;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module task5::task5;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::object;
use sui::object::UID;
use sui::transfer;
use sui::transfer::{transfer, public_share_object, share_object, public_transfer};
use sui::tx_context::TxContext;
use task2::beson77::BESON77;
use task2::faucet_beson77::FAUCET_BESON77;


const ErrCoinLow:u64 = 100;
const ErrFaucetCoinLow:u64 = 101;

public struct AdminCap has key{
    id: UID
}

public struct Swap has key{
    id: UID,
    coin: Balance<BESON77>,
    faucet_coin: Balance<FAUCET_BESON77>
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap{id: object::new(ctx)};
    let swap = Swap{
        id: object::new(ctx),
        coin: balance::zero<BESON77>(),
        faucet_coin: balance::zero<FAUCET_BESON77>()
    };

    transfer(adminCap, ctx.sender());
    share_object(swap);
}


public entry fun swap_coin_to_faucet(swap: &mut Swap, userCoin: &mut Coin<BESON77>, userCoinAmount: u64, ctx: &mut TxContext) {
    let takeFaucetAmount = userCoinAmount * 2;
    assert!(swap.faucet_coin.value() >= takeFaucetAmount);

    swap.coin.join(coin::into_balance(userCoin.split(userCoinAmount, ctx))); //压入coin

    //借出faucet_coin
    let takeCoin = coin::from_balance(swap.faucet_coin.split(takeFaucetAmount), ctx);
    public_transfer(takeCoin, ctx.sender());
}

public entry fun swap_faucet_to_coin(swap: &mut Swap, userFaucetCoin: &mut Coin<FAUCET_BESON77>, userFaucetCoinAmount: u64, ctx: &mut TxContext) {
    let takeCoinAmount = userFaucetCoinAmount / 2;
    assert!(swap.coin.value() >= takeCoinAmount);

    swap.faucet_coin.join(coin::into_balance(userFaucetCoin.split(userFaucetCoinAmount, ctx))); //押入faucet_coin

    //接出coin
    let takeFaucetCoin = coin::from_balance(swap.coin.split(takeCoinAmount), ctx);
    public_transfer(takeFaucetCoin, ctx.sender());
}


public entry fun save_coin(_: &AdminCap, swap: &mut Swap, userCoin: &mut Coin<BESON77>, userCoinAmount: u64, userFaucetCoin: &mut Coin<FAUCET_BESON77>, userFaucetCoinAmount: u64, ctx: &mut TxContext) {
    if (userCoinAmount > 0) {
        swap.coin.join(coin::into_balance(userCoin.split(userCoinAmount, ctx)));
    };
    if (userFaucetCoinAmount > 0) {
        swap.faucet_coin.join(coin::into_balance(userFaucetCoin.split(userFaucetCoinAmount, ctx)));
    };
}


public entry fun get_coin(_: &AdminCap, swap: &mut Swap, userCoinAmount: u64, userFaucetCoinAmount: u64, ctx: &mut TxContext) {
    if (userCoinAmount > 0 && swap.coin.value() > 0) {
        let take_coin = coin::from_balance(swap.coin.split(userCoinAmount), ctx);
        public_transfer(take_coin, ctx.sender());
    };
    if (userFaucetCoinAmount > 0 && swap.faucet_coin.value() > 0) {
        let take_faucet_coin = coin::from_balance(swap.faucet_coin.split(userFaucetCoinAmount), ctx);
        public_transfer(take_faucet_coin, ctx.sender());
    };
}

