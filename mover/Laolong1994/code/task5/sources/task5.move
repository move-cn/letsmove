
/// Module: task5
module task5::task5;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::transfer::{share_object, public_transfer,transfer};
use task2::laolong1994_coin::LAOLONG1994_COIN;
use task2::laolong1994_faucet_coin::LAOLONG1994_FAUCET_COIN;


public struct Bank has key {
    id: UID,
    coin: Balance<LAOLONG1994_COIN>,
    faucet_coin: Balance<LAOLONG1994_FAUCET_COIN>,
    /// exchange rate:  1 USD = 7 RMB
}

public struct AdminCap has key{
    id:UID,
}


fun init(ctx:& mut TxContext){

    let bank = Bank{
        id:object::new(ctx),
        coin:balance::zero(),
        faucet_coin:balance::zero(),
    };
    share_object(bank);

    let admincap = AdminCap{
        id:object::new(ctx),
    };

    transfer(admincap,ctx.sender())
}

//存钱
public fun add_coin(bank:& mut Bank,in:Coin<LAOLONG1994_COIN>,_:& mut TxContext){
    bank.coin.join(coin::into_balance(in));
}

public fun add_faucet_coin(bank:& mut Bank,in:Coin<LAOLONG1994_FAUCET_COIN>,_:& mut TxContext){
    bank.faucet_coin.join(coin::into_balance(in));
}

//交换
public fun coin_to_faucet_coin(bank:& mut Bank,in:Coin<LAOLONG1994_COIN>,ctx:& mut TxContext){
    //1 coin = 7.2 faucet
    let coin_amt = in.value();
    let faucet_amt =coin_amt*72/10;

    bank.coin.join(coin::into_balance(in));
    let faucet_coin_b = bank.faucet_coin.split(faucet_amt);
    public_transfer(coin::from_balance(faucet_coin_b,ctx),ctx.sender());
}

public fun faucet_coin_to_coin(bank:& mut Bank,in:Coin<LAOLONG1994_FAUCET_COIN>,ctx:& mut TxContext){
    //1 coin = 7.2 faucet
    //怎么获取汇率 pyth预言机
    let faucet_coin_amt = in.value();
    let coin_amt =faucet_coin_amt*10/72;

    bank.faucet_coin.join(coin::into_balance(in));
    let coin_b = bank.coin.split(coin_amt);
    public_transfer(coin::from_balance(coin_b,ctx),ctx.sender());
}

//取钱
public fun without_coin(_:& AdminCap,bank:& mut Bank,amt:u64,ctx:& mut TxContext){
    let out = bank.faucet_coin.split(amt);
    public_transfer(coin::from_balance(out,ctx),ctx.sender())
}


sui client call --package 0xe506fec551083f07b74512f8c71df25909803401130a82561c6477bb9b158672 --module task5 --function add_coin  --args 0x4e5e715a4243fcb7b76159099b5dd4bdbaa3a5a516ac0120106af3367df4d19f 0xa59e9a6ec2ab6df762addac5ddbafffcae2e38223c8082b05eda7b53032113cb --dry-run--gas-budget 50000000