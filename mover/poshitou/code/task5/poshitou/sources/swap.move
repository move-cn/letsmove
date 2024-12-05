/// Module: swap
module poshitou::poshitou_swap;
use my_coin::faucet_coin::FAUCET_COIN;
use my_coin::my_coin::MY_COIN;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::transfer::share_object;
use sui::tx_context::sender;

public struct Bank has key {
    id: UID,
    faucet_coin: Balance<FAUCET_COIN>,
    my_coin: Balance<MY_COIN>,
}

public struct AdminCap has key {
    id: UID
}

fun init(ctx: &mut TxContext) {
    let bank = Bank {
        id: object::new(ctx),
        faucet_coin: balance::zero(),
        my_coin: balance::zero()
    };

    share_object(bank);

    transfer::transfer(AdminCap {
        id: object::new(ctx)
    }, sender(ctx));
}

entry fun deposit_faucet_coin(bank: &mut Bank, in: Coin<FAUCET_COIN>, _: &mut TxContext) {
    balance::join(&mut bank.faucet_coin, coin::into_balance(in));
}

entry fun deposit_my_coin(bank: &mut Bank, in: Coin<MY_COIN>, _: &mut TxContext) {
    balance::join(&mut bank.my_coin, coin::into_balance(in));
}

#[allow(lint(self_transfer))]
entry fun swap_faucet_coin_to_my_coin(bank: &mut Bank, in: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
    //假如 FAUCET_COIN 和 MY_COIN 的比例是 1:10
    //一个 FAUCET_COIN 可以换 10 个 MY_COIN
    let faucet_coin_amt = coin::value(&in);
    let my_coin_amt = faucet_coin_amt * 10;

    //银行的的faucet_coin增加，my_coin减少
    balance::join(&mut bank.faucet_coin, coin::into_balance(in));
    let my_coin_b = balance::split(&mut bank.my_coin, my_coin_amt);

    //把my_coin转给调用者
    transfer::public_transfer(coin::from_balance(my_coin_b, ctx), sender(ctx));
}

#[allow(lint(self_transfer))]
entry fun swap_mycoin_to_faucet_coin(bank: &mut Bank, in: Coin<MY_COIN>, ctx: &mut TxContext) {
    //假如 FAUCET_COIN 和 MY_COIN 的比例是 1:10
    //一个 MY_COIN 可以换 0.1 个 MY_COIN
    let my_coin_amt = coin::value(&in);
    let faucet_coin_amt = my_coin_amt * 1 / 10;

    //银行的的my_coin增加，faucet_coin减少
    balance::join(&mut bank.my_coin, coin::into_balance(in));
    let faucet_coin_b = balance::split(&mut bank.faucet_coin, faucet_coin_amt);

    //把my_coin转给调用者
    transfer::public_transfer(coin::from_balance(faucet_coin_b, ctx), sender(ctx));
}


//取钱 my coin
#[allow(lint(self_transfer))]
entry fun withdraw_my_coin(_admin_cap: &AdminCap, bank: &mut Bank, amt: u64, ctx: &mut TxContext) {
    let my_coin_amt = balance::split(&mut bank.my_coin, amt);

    transfer::public_transfer(coin::from_balance(my_coin_amt, ctx), sender(ctx));
}

//取钱fauct coin
#[allow(lint(self_transfer))]
entry fun withdarw_faucet_coin(_admin_cap: & AdminCap, bank: &mut Bank, amt: u64, ctx: &mut TxContext) {
    let faucet_coin_amt = balance::split(&mut bank.faucet_coin, amt);

    transfer::public_transfer(coin::from_balance(faucet_coin_amt, ctx), sender(ctx));
}
